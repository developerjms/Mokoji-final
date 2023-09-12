package com.mokoji.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mokoji.dao.MemClubDAOImple;
import com.mokoji.dao.MemberDAOImple;
import com.mokoji.domain.MemberVO;

@Service("memberService")
public class MemberServiceImple implements MemberService{
	
	@Autowired
	private MemberDAOImple memberDAO;
	
	@Autowired
	private MemClubDAOImple memClubDAOImple;
	
	//로그인
	@Override
	public MemberVO checkMember(MemberVO vo) {
		return memberDAO.checkMember(vo);
	}

	//회원가입
	@Override
	public void insertMember(MemberVO vo) {
		// TODO Auto-generated method stub
		memberDAO.insertMember(vo);
	}

	//아이디 중복 검사
	@Override
	public int nameCheck(String mem_id) {
		// TODO Auto-generated method stub
		return memberDAO.nameCheck(mem_id);
	}
	


}
