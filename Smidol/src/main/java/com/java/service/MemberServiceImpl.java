package com.java.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.MemberDto2;
import com.java.repository.MemberRepository;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired MemberRepository memberRepository;
	
	//로그인
	@Override
	public MemberDto2 findByMember_idAndMember_pw(String id, String pw) {
		MemberDto2 list = memberRepository.findByMember_idAndMember_pw(id, pw);
		return list;
	}

	//로그인한 회원정보 넘기기
	@Override
	public Optional<MemberDto2> findByMemberId(String memberId) {
		Optional<MemberDto2> minfo = memberRepository.findByMemberId(memberId);
		return minfo;
	}

}