package com.mokoji.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mokoji.dao.MemChallengeDAOImple;

@Service("MemChallengeService")
public class MemChallengeServiceImple implements MemChallengeService {

	@Autowired
	private MemChallengeDAOImple memChallengeDAOImple;
	
	@Override
	public int getMemCtCode(HashMap<String, Object>map) {
		
		return memChallengeDAOImple.getMemChCode(map);
	}
	
	@Override
	public void joinChallenge(HashMap<String, Object> map) {
		
		memChallengeDAOImple.joinChallenge(map);
	}
	
	@Override
	public int checkMtCode(HashMap<String, Object> map) {
		
		return memChallengeDAOImple.checkMtCode(map);
	}
	
}
