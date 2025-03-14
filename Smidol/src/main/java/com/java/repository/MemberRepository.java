package com.java.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.java.dto.MemberDto2;

public interface MemberRepository extends JpaRepository<MemberDto2, String> {
    // 1. findByIdAndPw에 명시적 쿼리 추가
    @Query("SELECT m FROM MemberDto2 m WHERE m.member_id = :id AND m.member_pw = :pw")
    MemberDto2 findByIdAndPw(@Param("id") String id, @Param("pw") String pw);

    // 2. findByMemberNickname 메서드 수정
    Optional<MemberDto2> findByMemberNickname(String nickname);

    // 멤버 ID 조회
    @Query(value = "SELECT * FROM memberdto2 WHERE member_id = :memberId", nativeQuery = true)
    Optional<MemberDto2> findByMemberId(String memberId);
}