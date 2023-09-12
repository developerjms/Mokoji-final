package com.mokoji.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;




@Repository("indexDAO")
public class IndexDAOImple implements IndexDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;




}
