package com.mokoji.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mokoji.service.IndexService;

@Controller
public class IndexController {
	@Autowired
	private IndexService indexService;
	
	
	
	//기본 경로
	@RequestMapping({"/{step}.do"})
	public String viewPage(@PathVariable String step) {
		return step;
	}
	

	
}
