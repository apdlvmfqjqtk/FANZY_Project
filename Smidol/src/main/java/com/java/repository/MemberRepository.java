package com.java.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.java.dto.MemberDto2;

public interface MemberRepository extends JpaRepository<MemberDto2, String>{


	@Query(value = "SELECT * FROM memberdto2 WHERE member_id = :memberId", nativeQuery = true)
	Optional<MemberDto2> findByMemberId(String memberId);

	MemberDto2 findByIdAndPw(String id, String pw);

	//  nickname으로 회원 조회 (Optional 사용)
    Optional<MemberDto2> findByMemberNickname(String memberNickname);

}