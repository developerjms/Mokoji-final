package com.mokoji.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mokoji.domain.ClubInstantVO;
import com.mokoji.domain.ClubPaneLikesVO;
import com.mokoji.domain.ClubVO;
import com.mokoji.domain.MemberVO;
import com.mokoji.service.ClubInstantService;
import com.mokoji.service.ClubPaneService;
import com.mokoji.service.ClubService;
import com.mokoji.service.MemClubService;

@Controller
public class ClubInstantController {
	@Autowired
	private ClubPaneService clubPaneService;

	@Autowired
	private ClubInstantService clubInstantService;

	@Autowired
	private ClubService clubService;

	@Autowired
	private MemClubService memClubService;

	// 동호회 상세 페이지 이동
	@RequestMapping(value = "/details.do")
	public String getInstantList(ClubInstantVO vo, ClubVO vo2, ClubPaneLikesVO cplvo, MemberVO mvo, Model model,
			HttpSession session) throws IOException {

		if (session.getAttribute("clubcode") != null) {
			vo2.setClub_code((int) session.getAttribute("clubcode"));
			session.setAttribute("ccode", session.getAttribute("clubcode"));
		}

		int memcode = (int) session.getAttribute("code");
		mvo.setMem_code(memcode);

		// 동아리 회장확인
		model.addAttribute("oneClubList", clubService.getOneClublist(vo2));
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("instant", vo);
		map.put("club", vo2);
		map.put("member", mvo);

		int memct = memClubService.getMemCtCode(map);
		session.setAttribute("memct_code", memct);

		int check = memClubService.checkMcCode(map);
		session.setAttribute("check", check);

		// 내 좋아요 리스트 뽑기
		model.addAttribute("myLikes", clubPaneService.getMyLikes(mvo));
		model.addAttribute("MemClubList", memClubService.getAllMemClub(vo2));
		model.addAttribute("clubPaneList", clubPaneService.selectClubPaneList(map));
		model.addAttribute("instant", clubInstantService.getInstantList(map));

		// 페이지를 나갔다 들어왔을때 각 클럽코드 적용되야함으로 지워줌
		// 멤버클럽컨트롤러에서 가입 승인시 세션에 보내줌
		session.removeAttribute("clubcode");

		return "Clubdetails";

	}

	//번개 등록
	@RequestMapping(value = "/insertClubInstant.do", method = RequestMethod.POST)
	public void insertClubInstant(ClubInstantVO vo, MemberVO mvo, ClubVO cvo, HttpServletResponse response) throws UnsupportedEncodingException , IOException{
		
		HashMap<String, Object> map = new HashMap<String, Object>();

		int nextcode = clubInstantService.getNextClubInstantCode();
		vo.setCinst_code(nextcode);
		map.put("clubinstant", vo);

		map.put("member", mvo);

		map.put("club", cvo);
		
		clubInstantService.insertClubInstant(map);
		
		clubInstantService.insertClubInstantInfo(map);
		
		String msg = "번개 등록 완료!";
		response.setContentType("text/html; charset=utf-8");
		PrintWriter w = response.getWriter();
		w.write("<script>alert('" + msg + "');history.back();</script>");
		w.flush();
		w.close();
		

	}

	//번개 전체 일정
	@RequestMapping(value="/ClubInstantCal.do")
	public String thisClubInstantList(@RequestParam("club_code") int club_code,Model model, ClubVO cvo) {
		
		cvo.setClub_code(club_code);
		model.addAttribute("clubInstant", clubInstantService.thisClubInstantList(cvo));
		
		
		return "ClubInstantCal";
	}
	
	//번개 상세 보기
	@RequestMapping(value="/dodo.do")
	public String showClubInstDetail(@RequestParam("cinst_code") int cinst_code, ClubInstantVO civo, Model model) {
		model.addAttribute("thisClubInst", clubInstantService.thisClubInstantInfo(civo));
		model.addAttribute("applyMember", clubInstantService.getApplyMember(civo));
		return "clubInstantDetail";
	}
	
	//번개 신청
	@RequestMapping(value="/applyClubInst.do", method = RequestMethod.POST)
	public void insertClubInstantInfo(Model model, ClubInstantVO civo, MemberVO mvo, HttpSession session,HttpServletResponse response) throws IOException {
		int memcode = (int)session.getAttribute("code");
		mvo.setMem_code(memcode);
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("member", mvo);
		map.put("clubinstant", civo);
		int checkapply = clubInstantService.checkAlreadyApply(map);
		
		
		
		if(checkapply >= 1) {
			response.setContentType("text/html; charset=UTF-8");

			PrintWriter out = response.getWriter();

			out.println("<script>alert('이미 신청을 한 번개모임 입니다!');history.back();</script>");

			out.flush();
		}else {
			
			clubInstantService.insertClubInstantInfo(map);
			
			response.setContentType("text/html; charset=UTF-8");

			PrintWriter out = response.getWriter();

			out.println("<script>alert('신청이 완료되었습니다!');history.back();</script>");

			out.flush();
			
		}
		
		
		
		
		
		
		
		
	}


}
