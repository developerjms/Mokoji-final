package com.mokoji.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mokoji.domain.ClubPaneRepleVO;
import com.mokoji.domain.ClubPaneVO;

@Repository("ClubPaneRepleDAO")
public class ClubPaneRepleDAOImple implements ClubPaneRepleDAO{

	@Autowired
	private SqlSessionTemplate mybatis;

	//댓글 등록
	@Override
	public void insertComment(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		mybatis.insert("ClubPaneReple.insertComment", map);
	}

	//댓글 ㄹ리스트 불러오기
	@Override
	public List<HashMap<String, Object>> getCommentList(ClubPaneVO vo) {
		// TODO Auto-generated method stub
		List<HashMap<String, Object>> list = mybatis.selectList("ClubPaneReple.getCommentList", vo);
		return list;
	}

	//댓글 수정
	@Override
	public void updateReple(ClubPaneRepleVO cprvo) {
		// TODO Auto-generated method stub
		mybatis.update("ClubPaneReple.updateReple", cprvo);
	}

	//댓글 삭제
	@Override
	public void deleteReple(ClubPaneRepleVO cprvo) {
		// TODO Auto-generated method stub
		mybatis.delete("ClubPaneReple.deleteReple", cprvo);
	}
	
	
}
