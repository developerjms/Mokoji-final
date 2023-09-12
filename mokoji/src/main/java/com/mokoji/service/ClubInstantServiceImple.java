package com.mokoji.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mokoji.dao.ClubInstantDAOImple;
import com.mokoji.domain.ClubInstantVO;
import com.mokoji.domain.ClubVO;

@Service("ClubInstantService")
public class ClubInstantServiceImple implements ClubInstantService{

	@Autowired
	private ClubInstantDAOImple clubInstantDAO;
	
	//번개모임 불러오기
	@Override
	public List<HashMap<String, Object>> getInstantList(HashMap<String, Object> map){
		return clubInstantDAO.getInstantList(map);
	}

	//번개모임 등록
	@Override
	public int insertClubInstant(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return clubInstantDAO.insertClubInstant(map);
	}

	//클럽의 번개 모임 리스트
	@Override
	public List<HashMap<String, Object>> thisClubInstantList(ClubVO cvo) {
		// TODO Auto-generated method stub
		return clubInstantDAO.thisClubInstantList(cvo);
	}

	//해당 번개 모임 정보
	@Override
	public List<HashMap<String, Object>> thisClubInstantInfo(ClubInstantVO civo) {
		// TODO Auto-generated method stub
		return clubInstantDAO.thisClubInstantInfo(civo);
	}

	//번개 신청
	@Override
	public void insertClubInstantInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		clubInstantDAO.insertClubInstantInfo(map);
	}

	//번개 신청 확인
	@Override
	public int checkAlreadyApply(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return clubInstantDAO.checkAlreadyApply(map);
	}

	//번개 신청 멤버목록
	@Override
	public List<HashMap<String, Object>> getApplyMember(ClubInstantVO civo) {
		// TODO Auto-generated method stub
		return clubInstantDAO.getApplyMember(civo);
	}

	@Override
	public int getNextClubInstantCode() {
		// TODO Auto-generated method stub
		return clubInstantDAO.getNextClubInstantCode();
	}
}
