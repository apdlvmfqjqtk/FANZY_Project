package com.java.controller;

import java.security.SecureRandom;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.dto.ArtistDto;
import com.java.dto.CartDto;
import com.java.dto.MemberDto2;
import com.java.dto.OrderDto;
import com.java.dto.ReadyResponseDto;
import com.java.dto.ShopDto;
import com.java.service.ArtistService;
import com.java.service.CartService;
import com.java.service.MemberService;
import com.java.service.ShopService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.java.dto.ApproveResponseDto;
import com.java.service.KakaopayService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FController {

	@Autowired HttpSession session;
	@Autowired ShopService shopService;
	@Autowired ArtistService artistService;
	@Autowired MemberService memberService;
	@Autowired KakaopayService kakaopayService;
	@Autowired CartService cartService;
	
	//메인 화면 호출
	@GetMapping("/smain")
	public String smain(Model model) {
		List<ArtistDto> list = artistService.findAll();
		model.addAttribute("list", list);
		return "smain";
	}
	
	// 아티스트물건 전체 리스트 호출
	@GetMapping("/sprods")
	public String sprods(@RequestParam("artistNo") int artist_no, Model model) {
		// get받은 artist_no 일치하는 ShopDto 전달
		List<ShopDto> list = shopService.findByNo(artist_no);
		model.addAttribute("slist", list);
		
		// ShopDto에서 Shop_category만 따로 전달
		Set<String> categories = list.stream()
	    .map(ShopDto::getShop_category)
	    .collect(Collectors.toCollection(LinkedHashSet::new));
	    model.addAttribute("categories", categories);
		
		System.out.println("artist_no : " + artist_no);
		System.out.println("ShopDto : " + list);
		System.out.println("category : " + categories);
		return "sprods";
	}
	
	@GetMapping("/sprodview")
	public String sprodview(@RequestParam("shopNo") int shop_no, Model model) {
		Optional<ShopDto> slist = shopService.findById(shop_no);
		System.out.println("상품 하나가져오기 : " + slist);
		System.out.println("상품 하나가져오기 : " + slist.get());
		model.addAttribute("prod", slist.get());
		model.addAttribute("artist", slist.get().getArtistDto());
		
		return "sprodview";
	}
	
	
	//장바구니 추가
	@PostMapping("/addToCart")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> addToCart(
	    @RequestBody Map<String, Object> productInfo, 
	    HttpSession session
	) {
		//디버그
		System.out.println("AddToCart 요청 수신: " + productInfo);
	    String memberNickname = (String) session.getAttribute("session_nickname");
	    
	    try {
	        // JSON 문자열로 변환
	        ObjectMapper objectMapper = new ObjectMapper();
	        String cartItemsJson = objectMapper.writeValueAsString(
	            List.of(productInfo)
	        );

	        CartDto savedCart = cartService.addToCart(memberNickname, cartItemsJson);
	        
	        return ResponseEntity.ok(Map.of("success", true, "cartNo", savedCart.getCart_no()));
	    } catch (Exception e) {
	        return ResponseEntity.badRequest().body(Map.of("success", false, "message", e.getMessage()));
	    }
	}
	
	
	// 배송설정화면
	@GetMapping("/sptwind")
	public String sptwind(@RequestParam("sprodId") int shop_no,HttpSession session, Model model) {
		// 선택한 물건 정보를 넘긴다
		Optional<ShopDto> sprod = shopService.findById(shop_no);
		System.out.println("상품하나 : " + sprod);
		model.addAttribute("sdto", sprod.orElse(null));
		
		//로그인한 회원 정보를 넘긴다
		String memberId = (String) session.getAttribute("session_id");
		System.out.println("세션아이디 : " + session.getAttribute("session_id"));
		Optional<MemberDto2> minfo = memberService.findByMemberId(memberId);
		System.out.println("로그인고객정보 : " + minfo);
		model.addAttribute("mdto", minfo.orElse(null));
		return "sptwind";
	}
	
	
	//카카오페이페이지 결제
	@ResponseBody
	@PostMapping("/pay/orderPay")
	public ReadyResponseDto orderPay(OrderDto odto) {
		log.info("odto name : "+odto.getName());
		System.out.println("odto name : "+odto.getName());
		
		// 주문번호 생성
	    String orderNumber = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd")) 
	                       + String.format("%010d", new SecureRandom().nextLong() % 10_000_000_000L);
        // 카카오 결제 준비하기
        ReadyResponseDto readyResponseDto = kakaopayService.payReady(odto);
        
        // 주문번호 설정
        SessionUtils.addAttribute("orderNumber", orderNumber);
        
        
        // 세션에 결제 고유번호(tid) 저장
        SessionUtils.addAttribute("tid", readyResponseDto.getTid());
        log.info("결제 고유번호: " + readyResponseDto.getTid());
        
        return readyResponseDto;
	}
	
	@GetMapping("/pay/completed")
    public String payCompleted(@RequestParam("pg_token") String pgToken) {
    
		//섹션에서 tid값을 가져옴.
        String tid = SessionUtils.getStringAttributeValue("tid");
        log.info("결제승인 요청을 인증하는 토큰: " + pgToken);
        log.info("결제 고유번호: " + tid);

        // 카카오 결제 요청하기
        ApproveResponseDto approveResponseDto = kakaopayService.payApprove(tid, pgToken);

        System.out.println("승인날짜 : "+approveResponseDto.getApproved_at());
        
        return "redirect:/sptdone";
    }
	
	//카카오페이성공
	@GetMapping("/success")
	public String success() {
		return "success";
	}
	
	
	
	
	
	@GetMapping("/sptdone")
	public String sptdone() {
		return "sptdone";
	}
	
	// 문의사항 페이지
	@GetMapping("/squestion")
	public String squestion() {
		return "squestion";
	}
	
	//test서버 open
	@CrossOrigin 
	@GetMapping("/test")
	public String test(Model model) {
		List<ShopDto> list = shopService.findAll();
		model.addAttribute("list", list);
		return "test";
	}
	
	
	// 로그인 페이지
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	//로그아웃
	@GetMapping("/member/logout")
	public String logout() {
		session.invalidate();
		return "redirect:/?loginChk=0";
	}
	
	// 로그인 확인
	@PostMapping("/login")
	public String login(String id, String pw) {
	    // 아이디와 비밀번호를 모두 확인하는 메서드
	    MemberDto2 memberDto = memberService.findByIdAndPw(id, pw);

	    // memberDto가 null이면 아이디가 없다는 뜻
	    if (memberDto == null) {
	        // 아이디가 없는 경우
	        if (memberService.findById(id) == null) {  // 아이디만 조회해서 없으면
	            return "redirect:/login?chkLogin=0";  // 계정이 없다는 메시지로 리다이렉트
	        } else {
	            // 아이디는 있지만 비밀번호가 틀린 경우
	            return "redirect:/login?chkLogin=2";  // 비밀번호 틀린 경우 메시지로 리다이렉트
	        }
	    }

	    // 아이디와 비밀번호가 모두 일치하는 경우
	    session.setAttribute("session_id", id);
	    session.setAttribute("session_nickname", memberDto.getMember_nickname());  // 닉네임 저장
	    return "redirect:/login?chkLogin=1";  // 로그인 성공
	}
	
	
}