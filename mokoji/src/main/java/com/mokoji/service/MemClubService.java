package com.mokoji.service;

import java.util.HashMap;
import java.util.List;

import com.mokoji.domain.ClubVO;
import com.mokoji.domain.MemClubVO;

public interface MemClubService {
	public int getMemCtCode(HashMap<String, Object> map);
	//동호회가입
	public void joinClub(HashMap<String, Object> map);
	//동호회가입확인
	public int checkMcCode(HashMap<String, Object> map);
	
	public List<HashMap<String, Object>> getAllMemClub(ClubVO vo);
	
	//승인 확인
	public void upMemclub(MemClubVO vo);
	
	//승인 거절
	public void delMemClub(MemClubVO vo);
	
	//동호회장인지 확인
	public int checkClubJang(int memcode);
	
	//동호회장 매칭
	public int getMemJangCtCode(HashMap<String, Object> map);
	
	// 동호회장 기준으로 카테고리 미드 코드 뽑기
	public int getMemCtMidCode(HashMap<String, Object> map);
}
