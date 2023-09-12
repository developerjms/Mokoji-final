package com.mokoji.service;

import com.mokoji.domain.MemberVO;

public interface MemberService {
	//로그인
	public MemberVO checkMember(MemberVO vo);
	
	//회원가입
	public void insertMember(MemberVO vo);
	
	//아이디 중복 검사
	public int nameCheck(String mem_id);
}
