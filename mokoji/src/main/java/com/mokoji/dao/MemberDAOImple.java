package com.mokoji.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mokoji.domain.MemberVO;

@Repository("MemberDAO")
public class MemberDAOImple implements MemberDAO{
	@Autowired
	private SqlSessionTemplate mybatis;

	//로그인
	@Override
	public MemberVO checkMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("MemberDAO.checkMember", vo);	
	}

	//회원가입
	@Override
	public void insertMember(MemberVO vo) {
		// TODO Auto-generated method stub
		mybatis.insert("MemberDAO.insertMember", vo);
	}

	//아이디 중복 검사
	@Override
	public int nameCheck(String mem_id) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("MemberDAO.nameCheck", mem_id);
	}
}
