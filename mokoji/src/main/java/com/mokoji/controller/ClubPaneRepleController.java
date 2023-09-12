package com.mokoji.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mokoji.domain.ClubPaneRepleVO;
import com.mokoji.domain.ClubPaneVO;
import com.mokoji.domain.MemberVO;
import com.mokoji.service.ClubPaneRepleService;

@Controller
public class ClubPaneRepleController {

	@Autowired
	private ClubPaneRepleService clubPaneRepleService;
	
	
	//댓글 작성 후 리스트 불러오기
	@RequestMapping(value="/insertComment.do")
	@ResponseBody
	public List<HashMap<String, Object>> getCommentList(@RequestParam("cp_code") int cp_code , @RequestParam("cpreple_content") String cpreple_content, ClubPaneVO cpvo ,ClubPaneRepleVO cprvo, MemberVO mvo, HttpSession session){
		HashMap<String, Object> map= new HashMap<String, Object>();
		//멤버코드
		int memcode = (int)session.getAttribute("code");
		mvo.setMem_code(memcode);
		//댓글 내용
		cprvo.setCpreple_content(cpreple_content);
		//게시글 번호
		cpvo.setCp_code(cp_code);
		
		map.put("cpreple", cprvo);
		map.put("member", mvo);
		map.put("clubpane", cpvo);
		clubPaneRepleService.insertComment(map);
		
		return clubPaneRepleService.getCommentList(cpvo);
	}
	
	//댓글 리스트만 불러오기
	@RequestMapping(value="/selectComment.do")
	@ResponseBody
	public List<HashMap<String, Object>> getComment(@RequestParam("cp_code") int cp_code,ClubPaneVO cpvo){
		
		cpvo.setCp_code(cp_code);
		return clubPaneRepleService.getCommentList(cpvo);
	}
	
	//댓글 수정
	@RequestMapping(value="/updateReple.do",method = RequestMethod.POST)
	@ResponseBody
	public List<HashMap<String, Object>> updateReple(@RequestParam("cpreple_code") int cpreple_code, @RequestParam("cpreple_content") String cpreple_content ,ClubPaneVO cpvo, ClubPaneRepleVO cprvo){
		cprvo.setCpreple_code(cpreple_code);
		cprvo.setCpreple_content(cpreple_content);
		
		clubPaneRepleService.updateReple(cprvo);
		
		
		return clubPaneRepleService.getCommentList(cpvo);
	}
	
	//댓글 삭제
	@RequestMapping(value="/deleteReple.do",method = RequestMethod.POST)
	@ResponseBody
	public List<HashMap<String, Object>> deleteReple(@RequestParam("cpreple_code") int cpreple_code,ClubPaneVO cpvo, ClubPaneRepleVO cprvo){
		cprvo.setCpreple_code(cpreple_code);
		clubPaneRepleService.deleteReple(cprvo);
		return clubPaneRepleService.getCommentList(cpvo);
	}
	
}
