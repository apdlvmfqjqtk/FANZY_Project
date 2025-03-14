package com.java.service;

import java.util.List;

import com.java.dto.ArtistDto;

public interface ArtistService {

	//샵메인에 아티스트와 상품 불러오기
	List<ArtistDto> findAll();


}