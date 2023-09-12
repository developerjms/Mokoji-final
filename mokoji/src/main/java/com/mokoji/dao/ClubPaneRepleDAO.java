package com.mokoji.dao;

import java.util.HashMap;
import java.util.List;

import com.mokoji.domain.ClubPaneRepleVO;
import com.mokoji.domain.ClubPaneVO;

public interface ClubPaneRepleDAO {
	
	//댓글 등록
	public void insertComment(HashMap<String, Object> map);
	
	//댓글 목록 가져오기
	public List<HashMap<String, Object>> getCommentList(ClubPaneVO vo);
	
	//댓글 수정
	public void updateReple(ClubPaneRepleVO cprvo);
	
	//댓글 삭제
	public void deleteReple(ClubPaneRepleVO cprvo);
}
