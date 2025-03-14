package com.java.service;

import java.util.List;

import com.java.dto.CartDto;

public interface CartService {
	// 장바구니 리스트
	List<CartDto> findByMemberNickname(String sessionNick);

	// 장바구니 삭제
	boolean deleteCartItem(int cartNo);
	
    // 카트에 물건추가
    CartDto addToCart(String memberNickname, String cartItems);

}
