package com.mokoji.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mokoji.domain.CategoryVO;
import com.mokoji.domain.ClubVO;
import com.mokoji.domain.MatchingInfoVO;
import com.mokoji.domain.MatchingVO;
import com.mokoji.domain.MemClubVO;
import com.mokoji.domain.MemberVO;
import com.mokoji.service.MatchingService;
import com.mokoji.service.MemClubService;

@Controller
public class MatchingController {

	@Autowired
	private MatchingService matchingService;

	@Autowired
	private MemClubService memClubService;

	// 매칭 등록
	@RequestMapping(value = "/insertMatching.do", method = RequestMethod.POST)
	public String insertMatching(MatchingVO mvo, ClubVO cvo, MatchingInfoVO mivo, HttpSession session)
			throws IOException {

		HashMap<String, Object> map = new HashMap<String, Object>();

		int num = matchingService.selectMatching(mvo);
		mvo.setMat_code(num);

		map.put("match", mvo);
		map.put("club", cvo);
		map.put("matchinfo", mivo);

		matchingService.insertMatching(map);
		matchingService.insertMatchingInfo(map);

		session.setAttribute("clubcode", cvo.getClub_code());

		return "redirect:/details.do";
	}

	// 매칭 리스트
	@RequestMapping(value = "/match.do", method = RequestMethod.GET)
	public String getMatchList(MatchingVO mvo, ClubVO cvo, CategoryVO ctvo, MemberVO mbvo, Model model,
			HttpSession session) throws IOException {

		if (session.getAttribute("clubcode") != null) {
			cvo.setClub_code((int) session.getAttribute("clubcode"));
		}

		int memcode = (int) session.getAttribute("code");
		mbvo.setMem_code(memcode);

		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("match", mvo);

		map.put("club", cvo);

		map.put("midcate", ctvo);

		map.put("member", mbvo);

		int memct = memClubService.getMemCtMidCode(map);
		session.setAttribute("memctmid_code", memct);

		session.setAttribute("clubcode", matchingService.getClubCode(map));

		model.addAttribute("matchList", matchingService.getMatchList(map));

		return "Matching";
	}

	// 등록된 매칭 참가하기
	@RequestMapping(value = "/joinmatch.do")
	public void insertJoinMatching(MatchingVO mvo, ClubVO cvo, MemClubVO mcvo, MemberVO mbvo, HttpSession session,
			HttpServletResponse response) throws IOException {

		HashMap<String, Object> map = new HashMap<String, Object>();

		int num = (int) session.getAttribute("clubcode");

		map.put("match", mvo);
		map.put("club", cvo);
		map.put("memclub", mcvo);
		map.put("mem", mbvo);

		HashMap<String, Object> mat = new HashMap<String, Object>();

		cvo.setClub_code(num);
		
		mat.put("club", cvo);
		
		mat.put("matching", mvo);

		int matCheck = matchingService.getMatCode(mat);
		
		if (matCheck == 0) {
			matchingService.insertJoinMatching(map);
			response.setContentType("text/html; charset=UTF-8");

			PrintWriter out = response.getWriter();

			out.println("<script>alert('매칭 신청이 완료되었습니다.');history.back();</script>");

			out.flush();

		} else {
			response.setContentType("text/html; charset=UTF-8");

			PrintWriter out = response.getWriter();

			out.println("<script>alert('이미 신청한 매칭입니다!');history.back();</script>");

			out.flush();

		}

	}

	// 승인 확인
	@RequestMapping(value = "/upMatching.do", method = RequestMethod.POST)
	public String upMatching(MatchingInfoVO vo, ClubVO cvo, HttpSession session) {

		session.setAttribute("clubcode", cvo.getClub_code());

		matchingService.upMatching(vo);

		return "redirect:/details.do";

	}

	// 승인 거절
	@RequestMapping(value = "/delMatching.do", method = RequestMethod.POST)
	public String delMatching(MatchingInfoVO vo, ClubVO cvo, HttpSession session) {
		matchingService.delMatching(vo);

		session.setAttribute("clubcode", cvo.getClub_code());

		return "redirect:/details.do";
	}

}