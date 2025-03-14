package com.java.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.ShopDto;
import com.java.repository.ShopRepository;

@Service
public class ShopServiceImpl implements ShopService {

	@Autowired ShopRepository shopRepository;
	
	//전체 상품리스트 정렬
	@Override
	public List<ShopDto> findAll() {
		List<ShopDto> list = shopRepository.findAll();
		return list;
	}

	
	//가수상품전체
	@Override
	public List<ShopDto> findByNo(int artist_no) {
		List<ShopDto> list = shopRepository.findByNo(artist_no);
		return list;
	}

	//가수상품상세
	@Override
	public Optional<ShopDto> findById(int shop_no) {
		Optional<ShopDto> list = shopRepository.findById(shop_no);
		return list;
	}


}