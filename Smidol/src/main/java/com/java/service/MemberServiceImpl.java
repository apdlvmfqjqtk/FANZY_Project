package com.java.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.MemberDto2;
import com.java.repository.MemberRepository;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired MemberRepository memberRepository;
	

	//로그인한 회원정보 넘기기
	@Override
	public Optional<MemberDto2> findByMemberId(String memberId) {
		Optional<MemberDto2> minfo = memberRepository.findByMemberNickname(memberId);
		return minfo;
	}

	//로그인
	@Override
	public MemberDto2 findByIdAndPw(String id, String pw) {
		MemberDto2 list = memberRepository.findByIdAndPw(id, pw);
		return list;
	}

	//아이디확인
	@Override
	public Object findById(String id) {
		return memberRepository.findById(id).orElse(null);
	}

}