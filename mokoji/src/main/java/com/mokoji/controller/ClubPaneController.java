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
import com.mokoji.domain.ClubInstantVO;
import com.mokoji.domain.ClubPaneVO;
import com.mokoji.domain.ClubVO;
import com.mokoji.domain.MemClubVO;
import com.mokoji.domain.MemberVO;
import com.mokoji.domain.SocialingVO;
import com.mokoji.service.CategoryService;
import com.mokoji.service.ClubInstantService;
import com.mokoji.service.ClubPaneService;
import com.mokoji.service.MemberService;

@Controller
public class ClubPaneController {
	
	
	@Autowired
	private ClubPaneService clubPaneService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private ClubInstantService clubinstantService;
	
	
	//게시판 등록
	@RequestMapping(value="/insertClubPane.do", method = RequestMethod.POST)
	public String insertClubPane(MemberVO mvo, ClubVO cvo, ClubPaneVO clubpanevo, MemClubVO memclubvo,HttpSession session) throws IOException{
		int mccode = (Integer)session.getAttribute("check");
		memclubvo.setMc_code(mccode);
		
		int memcode = (Integer)session.getAttribute("code");
		mvo.setMem_code(memcode);

		
		
		
		session.setAttribute("clubcode", cvo.getClub_code());
		
		//VO여러개 해쉬맵으로
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("clubpane", clubpanevo);
		map.put("memclub", memclubvo);
		map.put("club", cvo);
		map.put("member", mvo);
		clubPaneService.insertClubPane(map);
		
		
		return "redirect:/details.do";
	}
	
	//하트 업데이트
	@RequestMapping(value = "/updateHeart.do", method = RequestMethod.POST)
	@ResponseBody
	public List<ClubPaneVO> updateHeart(@RequestParam("cp_code") int cp_code, ClubPaneVO cpvo, MemberVO mvo,ClubVO vo,HttpSession session){
		HashMap<String , Object> map = new HashMap<String, Object>();
	
		map.put("clubpane", cpvo);
		int mem_code = (int)session.getAttribute("code");
		mvo.setMem_code(mem_code);
		map.put("member", mvo);
		
		//하트수 +1
		clubPaneService.updateLikes(cp_code);
		
		//하트 목록에 insert
		clubPaneService.insertHeartLikes(map);
		
		//하트수 증가 후 리스트
		return clubPaneService.getOneClubPane(cp_code);
	}
	
	//하트 내리기
	@RequestMapping(value="/downHeart.do", method = RequestMethod.POST)
	@ResponseBody
	public List<ClubPaneVO> downHeart(@RequestParam("cp_code") int cp_code, ClubVO vo, MemberVO mvo, ClubPaneVO cpvo, HttpSession session){
		HashMap<String , Object> map = new HashMap<String, Object>();
		map.put("clubpane", cpvo);
		int mem_code = (int)session.getAttribute("code");
		mvo.setMem_code(mem_code);
		
		map.put("member", mvo);
		
		//하트수 -1
		clubPaneService.downHeart(cp_code);
		
		//하트 목록에 delete
		clubPaneService.deleteHeartLikes(map);
		
		//하트수 감소 후 리스트
		return clubPaneService.getOneClubPane(cp_code);
	}
	
	@RequestMapping(value ="/goMyPage.do")
	public String selectMyClubPaneList(MemberVO vo, ClubPaneVO cpvo, SocialingVO svo, ChallengeVO chvo ,ClubVO cvo, ClubInstantVO civo, CategoryVO cavo, HttpSession session, Model model) {

		int memcode = (int)session.getAttribute("code");
		
		vo.setMem_code(memcode);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("member", vo);
		map.put("clubpane", cpvo);
		map.put("club", cvo);
		map.put("instant", civo);
		map.put("midcategory", cavo);
		map.put("socialing", svo);
		map.put("challenge", chvo);
		
		model.addAttribute("mychallenge", clubPaneService.selectMyChallenge(map));
		model.addAttribute("mysocialing", clubPaneService.selectMySocialing(map));
		model.addAttribute("myclubpane", clubPaneService.selectMyClubPaneList(map));
		model.addAttribute("myinfo", clubPaneService.selectInfo(vo));
		model.addAttribute("myclub",clubPaneService.selectMyClub(map));
		return "myPage";
	
	}
	
	
}
