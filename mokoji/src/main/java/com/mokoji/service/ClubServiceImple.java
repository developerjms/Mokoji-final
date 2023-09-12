package com.mokoji.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mokoji.dao.ClubDAOImple;
import com.mokoji.domain.CategoryVO;
import com.mokoji.domain.ClubVO;


@Service("clubService")
public class ClubServiceImple implements ClubService{
	
	@Autowired
	private ClubDAOImple clubdao;
	
	
	
	//동호회 리스트
	   @Override
	   public List<ClubVO> getClubCard(ClubVO vo){
	      return clubdao.getClubCard(vo);
	   }
	   @Override
	   public List<HashMap<String, Object>> getClubList(HashMap<String, Object> map) {
	      // TODO Auto-generated method stub
	      return clubdao.getClubList(map);
	   }



	//동호회 관심사 리스트 가져오기
	   @Override
	   public List<HashMap<String, Object>> getClubListInterest(HashMap<String, Object> map) {
	      // TODO Auto-generated method stub
	      return clubdao.getClubListInterest(map);
	   }




	   @Override
	   public List<HashMap<String, Object>> getHighClubListInterest(HashMap<String, Object> map) {
	      // TODO Auto-generated method stub
	      return clubdao.getHighClubListInterest(map);
	   }




	   @Override
	   public List<ClubVO> getOneClublist(ClubVO vo) {
	      // TODO Auto-generated method stub
	      return clubdao.getOneClublist(vo);
	   }




	@Override
	public int selectClubcode(ClubVO vo) {
		// TODO Auto-generated method stub
		return clubdao.selectClubcode(vo);
	}




	@Override
	public int insertClub(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return clubdao.insertClub(map);
	}




	@Override
	public int insertMemClub(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return clubdao.insertMemClub(map);
	}
	
	//카테고리 검색 위해 카테코리pk받아오기
	@Override
	public int getSearchClubCate(CategoryVO catevo) {
		// TODO Auto-generated method stub
		return clubdao.getSearchClubCate(catevo);
	}
	
	//활동 지역으로 클럽 리스트 검색
	@Override
	public List<HashMap<String, Object>> selectClubByClubLoc(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		
		
		return clubdao.selectClubByClubLoc(map);
	}
	//카테고리로 클럽 리스트 검색
	@Override
	public List<HashMap<String, Object>> selectClubByCategory(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		
		return clubdao.selectClubByCategory(map);
	}


}
