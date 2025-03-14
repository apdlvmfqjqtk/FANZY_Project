package com.java.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.java.dto.ShopDto;

public interface ShopRepository extends JpaRepository<ShopDto, Integer>{

	//아티스트전체
	@Query(value = "SELECT * FROM shopdto WHERE artist_no = :artistNo", nativeQuery = true)
	List<ShopDto> findByNo(@Param("artistNo") int artistNo);




}