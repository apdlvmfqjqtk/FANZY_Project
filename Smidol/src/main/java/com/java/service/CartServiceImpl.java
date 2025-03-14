package com.java.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.CartDto;
import com.java.dto.MemberDto2;
import com.java.repository.CartRepository;
import com.java.repository.MemberRepository;

@Service
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
        // 1. 회원 조회
        MemberDto2 member = memberRepository.findByMemberNickname(memberNickname)
            .orElseThrow(() -> new RuntimeException("회원을 찾을 수 없습니다."));

        // 2. 장바구니 DTO 생성
        CartDto cartDto = new CartDto();
        cartDto.setMember(member);
        cartDto.setCart_items(cartItems);
        cartDto.setCart_category("굿즈");
        cartDto.setCart_date(new Timestamp(System.currentTimeMillis()));

        // 3. 저장 및 반환
        return sRepository.save(cartDto);
	}

	
	

}
