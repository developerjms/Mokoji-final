package com.mokoji.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("meminterclubDAO")
public class MemInterClubDAOImple implements MemInterClubDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public int insertHeartLikes(HashMap<String, Object> map) {
		return mybatis.insert("meminterclubDAO.insertHeartLikes", map);
	}
	
	@Override
	public int deleteHeartLikes(HashMap<String, Object> map) {
		return mybatis.delete("meminterclubDAO.deleteHeartLikes", map);
	}
	
}
