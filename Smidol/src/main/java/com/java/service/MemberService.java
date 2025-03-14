package com.java.service;

import java.util.Optional;

import com.java.dto.MemberDto2;

public interface MemberService {

	MemberDto2 findByMember_idAndMember_pw(String id, String pw);

	//로그인한 회원정보 넘기기
	Optional<MemberDto2> findByMemberId(String memberId);

}