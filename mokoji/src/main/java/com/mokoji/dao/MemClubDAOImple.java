package com.mokoji.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mokoji.domain.ClubVO;
import com.mokoji.domain.MemClubVO;
@Repository("MemClubDAO")
public class MemClubDAOImple implements MemClubDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public int getMemCtCode(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		Integer cnt = mybatis.selectOne("MemClubDAO.getMemCtCode", map);
		if(cnt == null) {
			cnt=0;
		}
		return cnt;
	}

	@Override
	public int joinClub(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return mybatis.insert("MemClubDAO.joinClub", map);
	}

	@Override
	public int checkMcCode(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		Integer mccode = mybatis.selectOne("MemClubDAO.checkMcCode", map);
		if(mccode == null) {
			mccode = 0;
		}
		
		return mccode;
	}

	//가입 대기 중 인원 리스트
	@Override
	public List<HashMap<String, Object>> getAllMemClub(ClubVO vo) {
		// TODO Auto-generated method stub
		List<HashMap<String, Object>> list = mybatis.selectList("MemClubDAO.getAllMemClub",vo);
		return list;
	}

	//승인 확인
	@Override
	public void upMemclub(MemClubVO vo) {
		// TODO Auto-generated method stub
		mybatis.update("MemClubDAO.upMemclub", vo);
	}

	//승인 거절
	@Override
	public void delMemClub(MemClubVO vo) {
		// TODO Auto-generated method stub
		mybatis.delete("MemClubDAO.delMemClub", vo);
	}

	//동호회장 확인
	@Override
	public int checkClubJang(int memcode) {
		// TODO Auto-generated method stub
		Integer chnum = mybatis.selectOne("MemClubDAO.checkClubJang",memcode);
		if(chnum==null) {
			chnum = 0;
		}
		return chnum;
	}
	
	//동호회장 매칭
	@Override
	public int getMemJangCtCode(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		
		Integer cnt = mybatis.selectOne("MemClubDAO.getMemJangCtCode", map);
		if(cnt == null) {
			cnt=0;
		}
		return cnt;
	}

	@Override
	public int getMemCtMidCode(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		Integer cnt = mybatis.selectOne("MemClubDAO.getMemCtMidCode", map);
		if(cnt == null) {
			cnt=0;
		}
		return cnt;
	}

}
