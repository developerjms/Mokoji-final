package com.mokoji.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mokoji.domain.ClubInstantVO;
import com.mokoji.domain.ClubVO;

@Repository("ClubInstantDAO")
public class ClubInstantDAOImple implements ClubInstantDAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public List<HashMap<String, Object>> getInstantList(HashMap<String, Object> map){
		List<HashMap<String, Object>> list = mybatis.selectList("ClubInstantDAO.getInstantList", map);
		
		return list;
	}

	//번개 등록
	@Override
	public int insertClubInstant(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return mybatis.insert("ClubInstantDAO.insertClubInstant", map);
	}

	//동호회의 번개 리스트
	@Override
	public List<HashMap<String, Object>> thisClubInstantList(ClubVO cvo) {
		// TODO Auto-generated method stub
		List<HashMap<String,Object>> list = mybatis.selectList("ClubInstantDAO.thisClubInstantList",cvo);
		return list;
	}

	//번개 상세
	@Override
	public List<HashMap<String, Object>> thisClubInstantInfo(ClubInstantVO civo) {
		// TODO Auto-generated method stub
		List<HashMap<String, Object>> list = mybatis.selectList("ClubInstantDAO.thisClubInstantInfo", civo);
		return list;
	}

	//번개 신청
	@Override
	public void insertClubInstantInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		mybatis.insert("ClubInstantDAO.insertClubInstantInfo", map);
	}

	//번개 신청 검사
	@Override
	public int checkAlreadyApply(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("ClubInstantDAO.checkAlreadyApply", map);
	}

	//번개 신청 멤버 목록
	@Override
	public List<HashMap<String, Object>> getApplyMember(ClubInstantVO civo) {
		// TODO Auto-generated method stub
		List<HashMap<String, Object>> list = mybatis.selectList("ClubInstantDAO.getApplyMember", civo);

		return list;
	}

	
	//다음 번개 코드
	@Override
	public int getNextClubInstantCode() {
		// TODO Auto-generated method stub
		return mybatis.selectOne("ClubInstantDAO.getNextClubInstantCode");
	}
}
