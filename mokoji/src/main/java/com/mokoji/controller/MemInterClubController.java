package com.mokoji.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mokoji.domain.ClubVO;
import com.mokoji.domain.MemberVO;
import com.mokoji.service.MemInterClubService;

@Controller
public class MemInterClubController {
	
	@Autowired
	private MemInterClubService meminterclubservice;
	
	
	@RequestMapping(value = "/insertHeartLikes.do", method = RequestMethod.POST)
	@ResponseBody
	public int insertHeartLikes (@RequestParam("club_code") int club_code, ClubVO vo, MemberVO mvo, HttpSession session){
		
		vo.setClub_code(club_code);
		HashMap<String, Object> map = new HashMap<String, Object> ();
		int mem_code = (int)session.getAttribute("code");
		mvo.setMem_code(mem_code);
		map.put("club", vo);
		map.put("member", mvo);
		
		int num = meminterclubservice.insertHeartLikes(map);
		return num;
}
	@RequestMapping(value="/clubdownHeart.do", method = RequestMethod.POST)
	@ResponseBody
	public int clubdownHeart(@RequestParam("club_code") int club_code, ClubVO vo,MemberVO mvo, HttpSession session){
		
		vo.setClub_code(club_code);
		HashMap<String, Object> map = new HashMap<String, Object> ();
		int mem_code = (int)session.getAttribute("code");
		mvo.setMem_code(mem_code);
		map.put("club", vo);
		map.put("member", mvo);
		
		//하트 목록에 delete
		int num = meminterclubservice.deleteHeartLikes(map);
		return num;
		

	}
	

	
}
