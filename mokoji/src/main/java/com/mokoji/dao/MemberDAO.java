package com.mokoji.dao;

import com.mokoji.domain.MemberVO;

public interface MemberDAO {
	//로그인
	public MemberVO checkMember(MemberVO vo);
	
	//회원가입
	public void insertMember(MemberVO vo);
	
	//아이디 중복 확인
	public int nameCheck(String mem_id);
	
}
