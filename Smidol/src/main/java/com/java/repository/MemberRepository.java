package com.java.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.java.dto.MemberDto2;

public interface MemberRepository extends JpaRepository<MemberDto2, String>{

	@Query("SELECT m FROM MemberDto2 m WHERE m.member_id = ?1 AND m.member_pw = ?2")
	MemberDto2 findByMember_idAndMember_pw(String id, String pw);

	@Query(value = "SELECT * FROM memberdto2 WHERE member_id = :memberId", nativeQuery = true)
	Optional<MemberDto2> findByMemberId(String memberId);

}