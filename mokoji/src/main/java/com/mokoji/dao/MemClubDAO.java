package com.mokoji.dao;

import java.util.HashMap;
import java.util.List;

import com.mokoji.domain.ClubVO;
import com.mokoji.domain.MemClubVO;

public interface MemClubDAO {
	public int getMemCtCode(HashMap<String, Object> map);
	public int joinClub(HashMap<String, Object> map);
	public int checkMcCode(HashMap<String, Object> map);
	public List<HashMap<String, Object>> getAllMemClub(ClubVO vo);
	//승인 확인
	public void upMemclub(MemClubVO vo);
	
	//승인 거절
	public void delMemClub(MemClubVO vo);
	
	//동호회 검사
	public int checkClubJang(int memcode);
	
	
	public int getMemJangCtCode(HashMap<String, Object> map);
	
	// 동호회장 기준으로 카테고리 미드 코드 뽑기
	public int getMemCtMidCode(HashMap<String, Object> map);
}
