package com.mokoji.service;

import java.util.HashMap;

public interface MemChallengeService {
	public int getMemCtCode(HashMap<String, Object>map);
	//챌린지 가입
	public void joinChallenge(HashMap<String, Object>map);
	
	public int checkMtCode(HashMap<String, Object>map);
	
}
