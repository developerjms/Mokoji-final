package com.mokoji.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mokoji.dao.ClubPaneRepleDAO;
import com.mokoji.dao.ClubPaneRepleDAOImple;
import com.mokoji.domain.ClubPaneRepleVO;
import com.mokoji.domain.ClubPaneVO;

@Service("clubPaneRepleService")
public class ClubPaneRepleServieImple implements ClubPaneRepleService{

	@Autowired
	private ClubPaneRepleDAOImple clubPaneRepleDAO;
	
	//댓글 등록
	@Override
	public void insertComment(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		clubPaneRepleDAO.insertComment(map);
	}

	//댓글 목록 가져오기
	@Override
	public List<HashMap<String, Object>> getCommentList(ClubPaneVO vo) {
		// TODO Auto-generated method stub
		return clubPaneRepleDAO.getCommentList(vo);
	}

	//댓글 수정
	@Override
	public void updateReple(ClubPaneRepleVO cprvo) {
		// TODO Auto-generated method stub
		clubPaneRepleDAO.updateReple(cprvo);
	}

	//댓글 삭제
	@Override
	public void deleteReple(ClubPaneRepleVO cprvo) {
		// TODO Auto-generated method stub
		clubPaneRepleDAO.deleteReple(cprvo);
	}
	
}
