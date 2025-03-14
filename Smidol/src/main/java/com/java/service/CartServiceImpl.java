package com.java.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.java.dto.CartDto;
import com.java.dto.MemberDto2;
import com.java.repository.CartRepository;
import com.java.repository.MemberRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class CartServiceImpl implements CartService {
	@Autowired CartRepository sRepository;
	@Autowired MemberRepository memberRepository;
	
	// 장바구니 리스트
	@Override
	public List<CartDto> findByMemberNickname(String sessionNick) {
		List<CartDto> cList = sRepository.findByMemberNickname(sessionNick);
		return cList;
	}

	// 장바구니 삭제
	@Override
	public boolean deleteCartItem(int cartNo) {
	    try {
	        if (sRepository.existsById(cartNo)) {  // 해당 cartNo가 존재하는지 확인
	            sRepository.deleteById(cartNo);   // 장바구니에서 삭제
	            return true; // 삭제 성공
	        } else {
	            return false; // 해당 cartNo가 없음
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false; // 삭제 중 오류 발생
	    }
	}

	@Override
	public CartDto addToCart(String memberNickname, String cartItems) {
	    System.out.println("Searching for member with nickname: " + memberNickname);
	    // 회원 조회 시도
	    Optional<MemberDto2> memberOpt = memberRepository.findByMemberNickname(memberNickname);
	    System.out.println("Member found: " + memberOpt.isPresent());
		
	    System.out.println("장바구니 " + cartItems);
        // 1. 회원 조회
        MemberDto2 member = memberRepository.findByMemberNickname(memberNickname)
            .orElseThrow(() -> new RuntimeException("회원을 찾을 수 없습니다."));
        System.out.println("조회결과 : " + member);
        
        
        // 2. 장바구니 DTO 생성
        CartDto cartDto = new CartDto();
        cartDto.setMember(member);
        cartDto.setCart_items(cartItems);
        cartDto.setCart_category("굿즈");
        cartDto.setCart_date(new Timestamp(System.currentTimeMillis()));

        
        
        // 3. 저장 및 반환
        return sRepository.save(cartDto);
	}

	
	//구매제한개수 확인하기
	@Override
	public int getCartItemQuantity(String memberNickname, int shopNo) {
	    // 사용자의 장바구니 목록 가져오기
	    List<CartDto> userCarts = findByMemberNickname(memberNickname);
	    
	    int totalQuantity = 0;
	    
	    // 각 장바구니를 확인
	    for (CartDto cart : userCarts) {
	        if (cart.getCart_items() != null) {
	            try {
	                // JSON 문자열 파싱
	                ObjectMapper mapper = new ObjectMapper();
	                List<Map<String, Object>> items = mapper.readValue(
	                    cart.getCart_items(), 
	                    new TypeReference<List<Map<String, Object>>>() {}
	                );
	                
	                // 상품 번호가 일치하는 항목 찾기
	                for (Map<String, Object> item : items) {
	                    if (Integer.parseInt(item.get("shopNo").toString()) == shopNo) {
	                        // 수량 더하기
	                        totalQuantity += Integer.parseInt(item.get("quantity").toString());
	                    }
	                }
	            } catch (Exception e) {
	                System.out.println("JSON 파싱 오류: " + e.getMessage());
	            }
	        }
	    }
	    
	    return totalQuantity;
	}

	
	

}
