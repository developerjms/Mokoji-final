package com.mokoji.dao;

import java.util.HashMap;

public interface MemChallengeDAO {
	public int getMemChCode(HashMap<String, Object>map);
	
	public int joinChallenge(HashMap<String, Object>map);
	
	public int checkMtCode(HashMap<String, Object>map);
	
}
