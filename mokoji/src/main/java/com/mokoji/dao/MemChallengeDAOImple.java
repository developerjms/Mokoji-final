package com.mokoji.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("MemChallengeDAO")
public class MemChallengeDAOImple implements MemChallengeDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public int getMemChCode(HashMap<String, Object>map) {
		Integer cnt = mybatis.selectOne("MemChallengeDAO.getMemChCode",map);
		if(cnt == null) {
			cnt=0;
		}
		return cnt;
	}
	
	@Override
	public int joinChallenge(HashMap<String, Object> map) {
		
		return mybatis.insert("MemChallengeDAO.joinChallenge", map);
	}
	
	@Override
	public int checkMtCode(HashMap<String, Object>map) {
		Integer mhcode = mybatis.selectOne("MemChallengeDAO.checkMtCode",map);
		if(mhcode == null) {
			mhcode = 0;
		}
		return mhcode;
	}
	
	
}
