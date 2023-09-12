package com.mokoji.dao;

import java.util.HashMap;
import java.util.List;

import com.mokoji.domain.ClubInstantVO;
import com.mokoji.domain.ClubVO;

public interface ClubInstantDAO {
	//번개모임 리스트 
	public List<HashMap<String, Object>> getInstantList(HashMap<String, Object> map);
	
	//번개모임 인서트
	public int insertClubInstant(HashMap<String, Object> map);
	
	//클럽의 번개 모임 리스트
	public List<HashMap<String,Object>> thisClubInstantList(ClubVO cvo);
	
	//해당 번개 모임 정보
	public List<HashMap<String,Object>> thisClubInstantInfo(ClubInstantVO civo);
	
	//번개 신청
	public void insertClubInstantInfo(HashMap<String, Object> map);
	
	//번개 신청 검사
	public int checkAlreadyApply(HashMap<String, Object> map);
	
	//번개 신청 멤버 목록
	public List<HashMap<String,Object>> getApplyMember(ClubInstantVO civo);
	
	//다음 번개 모임코드
	public int  getNextClubInstantCode();
}
