package com.mokoji.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mokoji.dao.IndexDAOImple;

@Service("indexService")
public class IndexServiceImple implements IndexService{
	@Autowired
	private IndexDAOImple indexDAO;




	
}
