package com.mokoji.service;

import java.util.HashMap;
import java.util.List;

import com.mokoji.domain.ClubInstantVO;
import com.mokoji.domain.ClubVO;

public interface ClubInstantService {
	// 번개모임 불러오기
	public List<HashMap<String, Object>> getInstantList(HashMap<String, Object> map);

	// 번개모임 생성
	public int insertClubInstant(HashMap<String, Object> map);
	
	//클럽의 번개 모임 리스트
	public List<HashMap<String,Object>> thisClubInstantList(ClubVO cvo);
	
	//해당 번개 모임 정보 
	public List<HashMap<String,Object>> thisClubInstantInfo(ClubInstantVO civo);
	
	//번개 신청
	public void insertClubInstantInfo(HashMap<String, Object> map);
	
	//번개 신청 검사
	public int checkAlreadyApply(HashMap<String, Object> map);
	
	//해당 번개 신청 멤버
	public List<HashMap<String, Object>> getApplyMember(ClubInstantVO civo);
	
	//다음 번개모임 코드 가져오기
	public int getNextClubInstantCode();
}
