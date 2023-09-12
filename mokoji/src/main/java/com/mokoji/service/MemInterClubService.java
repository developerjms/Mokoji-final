package com.mokoji.service;

import java.util.HashMap;

public interface MemInterClubService {
	//찜하기
	public int insertHeartLikes(HashMap<String, Object> map);
	
	//찜취소
	public int deleteHeartLikes(HashMap<String, Object> map);
	

}
