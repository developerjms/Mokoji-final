package com.mokoji.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mokoji.domain.CategoryVO;
import com.mokoji.domain.ChallengeVO;
import com.mokoji.domain.MemberVO;
import com.mokoji.service.ChallengeService;

@Controller
public class ChallengeController {

	@Autowired
	private ChallengeService challengeService;

	// 챌린지 등록
	@RequestMapping(value = "/inserting.do")
	public String insertClub(ChallengeVO cvo, MemberVO mvo, CategoryVO cavo, HttpSession session) throws IOException {

		cvo.setChall_code(challengeService.getchallcode(cvo));

		mvo.setMem_code((int) session.getAttribute("code"));
		HashMap<String, Object> paramap = new HashMap<String, Object>();

		paramap.put("challenge", cvo);
		paramap.put("member", mvo);
		paramap.put("category", cavo);
		challengeService.insertChallenge(paramap);
		challengeService.insertMemChallenge(paramap);

		return "redirect:/go.do";
	}

	// 상위 카테고리 별 챌린지 리스트 뽑기
	@RequestMapping(value = "/challengeTotal.do", method = RequestMethod.POST)
	@ResponseBody
	public List<ChallengeVO> getHighChallengeList(@RequestParam("cthigh_name") String cthigh_name) {
		return challengeService.getHighChallengeList(cthigh_name);
	}

	// 하위 카테고리 별 챌린지 리스트 뽑기
	@RequestMapping(value = "/challengeTotal.do", method = RequestMethod.GET)
	@ResponseBody
	public List<ChallengeVO> getClubListInterest(@RequestParam("ctmid_name") String ctmid_name) {
		return challengeService.getChallengeList(ctmid_name);
	}

	@RequestMapping(value = "/ChallengeOne.do")
	public String getOneChallengelist(ChallengeVO vo, Model model) throws IOException {

		model.addAttribute("challenge", challengeService.getOneChallengelist(vo));

		return "Challengedetails";
	}

}
