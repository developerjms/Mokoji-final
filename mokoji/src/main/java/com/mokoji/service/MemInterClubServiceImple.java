package com.mokoji.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mokoji.dao.MemInterClubDAOImple;

@Service("meminterclubservice")
public class MemInterClubServiceImple implements MemInterClubService{
	
	@Autowired
	private MemInterClubDAOImple meminterclubDAO;

	@Override
	public int insertHeartLikes(HashMap<String, Object> map) {
		return meminterclubDAO.insertHeartLikes(map);
	}
	
	@Override
	public int deleteHeartLikes(HashMap<String, Object> map) {
		return meminterclubDAO.deleteHeartLikes(map);
	}

}
