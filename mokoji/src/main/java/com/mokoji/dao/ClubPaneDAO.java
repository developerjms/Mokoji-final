package com.mokoji.dao;

import java.util.HashMap;
import java.util.List;

import com.mokoji.domain.ClubPaneVO;
import com.mokoji.domain.ClubVO;
import com.mokoji.domain.MemberVO;

public interface ClubPaneDAO {
	
	public List<HashMap<String, Object>> selectClubPaneList(HashMap<String, Object> map);
	public void insertClubPane(HashMap<String, Object> map);
	//하트 업데이트
	public void updateHeart(int cp_code);
	
	//cpcode로 pane
	public List<ClubPaneVO> getOneClubPane(int cp_code);
	
	//하트 클릭 시 감소
	public void downHeart(int cp_code);
	
	//하트 목록  insert
	public void insertHeartLikes(HashMap<String, Object> map);
	
	//하트 목록 delete
	public void deleteHeartLikes(HashMap<String, Object> map);
	
	//내 좋아요 목록
	public List<ClubPaneVO> getMyLikes(MemberVO vo);
	
	public List<HashMap<String, Object>> selectMyChallenge(HashMap<String, Object>map);
	
	public List<HashMap<String, Object>> selectMySocialing(HashMap<String, Object>map);
	
	public List<HashMap<String, Object>> selectMyClub(HashMap<String, Object>map);
	
	public List<MemberVO> selectInfo(MemberVO vo);
	
	public List<HashMap<String, Object>> selectMyClubPaneList(HashMap<String, Object> map);
	

}
