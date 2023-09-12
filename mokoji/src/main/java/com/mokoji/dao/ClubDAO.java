package com.mokoji.dao;

import java.util.HashMap;
import java.util.List;

import com.mokoji.domain.CategoryVO;
import com.mokoji.domain.ClubVO;

public interface ClubDAO {

	// 동호회코드등록
	public int selectClubcode(ClubVO vo);

	// 동호회 등록
	public int insertClub(HashMap<String, Object> map);

	public int insertMemClub(HashMap<String, Object> map);


	// 동호회 리스트 가져오기
	   public List<ClubVO> getClubCard(ClubVO vo);
	   
	   public List<HashMap<String, Object>> getClubList(HashMap<String, Object> map);

	// 하위 카테고리로 동호회 리스트
	   public List<HashMap<String, Object>> getClubListInterest(HashMap<String, Object> map);

	// 상위 카테고리로 동호회 리스트
	   public List<HashMap<String, Object>> getHighClubListInterest(HashMap<String, Object> map);

	// 동호회코드로 동호회 1개
	public List<ClubVO> getOneClublist(ClubVO vo);
	
	//카테고리 검색 위해 카테코리pk받아오기
	public int getSearchClubCate(CategoryVO catevo);
	
	//활동 지역으로 클럽 리스트 검색
	public List<HashMap<String, Object>> selectClubByClubLoc(HashMap<String, Object> map);
	
	//카테고리로 클럽 리스트 검색
	public List<HashMap<String, Object>> selectClubByCategory(HashMap<String, Object> map);
}
