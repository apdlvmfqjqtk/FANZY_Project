package com.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.ArtistDto;
import com.java.repository.ArtistRepository;

@Service
public class ArtistServiceImpl implements ArtistService {

	@Autowired ArtistRepository artistRepository;
	
	//샵메인에 상품가져오기
	@Override
	public List<ArtistDto> findAll() {
		List<ArtistDto> list =  artistRepository.findAll();
		return list;
	}


}