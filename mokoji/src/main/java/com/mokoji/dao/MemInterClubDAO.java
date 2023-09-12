package com.mokoji.dao;

import java.util.HashMap;

public interface MemInterClubDAO {
	
	//찜하기
	public int insertHeartLikes(HashMap<String, Object> map);
	
	//찜하기 취소
	public int deleteHeartLikes(HashMap<String, Object> map);
	
}
