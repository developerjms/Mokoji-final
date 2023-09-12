package com.mokoji.service;

import java.util.HashMap;
import java.util.List;

import com.mokoji.domain.ClubPaneVO;
import com.mokoji.domain.ClubVO;
import com.mokoji.domain.MemberVO;

public interface ClubPaneService {
	//게시글 등록
	public void insertClubPane(HashMap<String, Object> map);
	
	//게시글 리스트
	public List<HashMap<String, Object>> selectClubPaneList(HashMap<String, Object> map);
	
	//하트 클릭 시 증가
	public void updateLikes(int cp_code);
	//하트 클릭 후 리스트 목록 불러오기
	public List<ClubPaneVO> getOneClubPane(int cp_code);
	
	//하트 클릭 시 감소
	public void downHeart(int cp_code);
	
	//하트 목록에 insert
	public void insertHeartLikes(HashMap<String, Object> map);
	
	//하트 목록에 delete
	public void deleteHeartLikes(HashMap<String, Object> map);
	
	//내 좋아요 목록
	public List<ClubPaneVO> getMyLikes(MemberVO vo);
	
	
	public List<HashMap<String, Object>> selectMyClubPaneList(HashMap<String, Object>map);
	
	public List<HashMap<String, Object>> selectMyClub(HashMap<String, Object>map);
	
	public List<HashMap<String, Object>> selectMySocialing(HashMap<String, Object>map);
	
	public List<HashMap<String, Object>> selectMyChallenge(HashMap<String, Object>map);
	
	public List<MemberVO> selectInfo(MemberVO vo);
	
}
