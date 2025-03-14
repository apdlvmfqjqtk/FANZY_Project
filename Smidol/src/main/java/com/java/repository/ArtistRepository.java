package com.java.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.java.dto.ArtistDto;

public interface ArtistRepository extends JpaRepository<ArtistDto, Integer>{

}