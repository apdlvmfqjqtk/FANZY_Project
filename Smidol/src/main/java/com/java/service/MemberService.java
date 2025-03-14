package com.java.service;

import java.util.Optional;

import com.java.dto.MemberDto2;

public interface MemberService {


	//로그인한 회원정보 넘기기
	Optional<MemberDto2> findByMemberId(String memberId);

	//로그인
	MemberDto2 findByIdAndPw(String id, String pw);

	//아이디가없다면
	Object findById(String id);

}