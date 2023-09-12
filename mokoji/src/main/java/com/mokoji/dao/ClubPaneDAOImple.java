package com.mokoji.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mokoji.domain.ClubPaneVO;
import com.mokoji.domain.ClubVO;
import com.mokoji.domain.MemberVO;

@Repository("ClubPaneDAO")
public class ClubPaneDAOImple implements ClubPaneDAO{
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public void insertClubPane(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		mybatis.insert("ClubPaneDAO.insertClubPane", map);
		
	}

	@Override
	public List<HashMap<String, Object>> selectClubPaneList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<HashMap<String, Object>> list =mybatis.selectList("ClubPaneDAO.selectClubPaneList",map); 
		return list;
	}

	//하트 클릭 시 증가
	@Override
	public void updateHeart(int cp_code) {
		// TODO Auto-generated method stub
		mybatis.update("ClubPaneDAO.updateHeart", cp_code);
	}

	//하트 클릭 후 리스트
	@Override
	public List<ClubPaneVO> getOneClubPane(int cp_code) {
		// TODO Auto-generated method stub
		return mybatis.selectList("ClubPaneDAO.getOneClubPane",cp_code);
	}
	//하트 클릭 시 감소
	@Override
	public void downHeart(int cp_code) {
		// TODO Auto-generated method stub
		mybatis.update("ClubPaneDAO.downHeart", cp_code);
	}

	//하트 목록 insert
	@Override
	public void insertHeartLikes(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		mybatis.insert("ClubPaneDAO.insertHeartLikes", map);
	}

	//하트 목록 delete
	@Override
	public void deleteHeartLikes(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		mybatis.delete("ClubPaneDAO.deleteHeartLikes", map);
	}

	//내 좋아요 목록
	@Override
	public List<ClubPaneVO> getMyLikes(MemberVO vo) {
		// TODO Auto-generated method stub
		List<ClubPaneVO> list = mybatis.selectList("ClubPaneDAO.getMyLikes", vo);
		return list;
	}

	@Override
	public List<HashMap<String, Object>> selectMyChallenge(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<HashMap<String, Object>> list = mybatis.selectList("ClubPaneDAO.selectMyChallenge", map);
		return list;
	}

	@Override
	public List<HashMap<String, Object>> selectMySocialing(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<HashMap<String, Object>> list=mybatis.selectList("ClubPaneDAO.selectMySocialing", map);
		return list;
	}

	@Override
	public List<HashMap<String, Object>> selectMyClub(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<HashMap<String, Object>> list=mybatis.selectList("ClubPaneDAO.selectMyClub", map);
		return list;
	}

	@Override
	public List<MemberVO> selectInfo(MemberVO vo) {
		// TODO Auto-generated method stub
		List<MemberVO> list=mybatis.selectList("ClubPaneDAO.selectInfo", vo);
		return list;
	}

	@Override
	public List<HashMap<String, Object>> selectMyClubPaneList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<HashMap<String, Object>> list=mybatis.selectList("ClubPaneDAO.selectMyClubPaneList", map);
		return list;
	}

}
