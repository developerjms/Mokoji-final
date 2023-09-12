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
import com.mokoji.domain.ClubVO;
import com.mokoji.domain.MemInterClubVO;
import com.mokoji.domain.MemberVO;
import com.mokoji.domain.SocialingVO;
import com.mokoji.service.CategoryService;
import com.mokoji.service.ChallengeService;
import com.mokoji.service.ClubService;
import com.mokoji.service.SocialingService;

@Controller
public class CategoryController {

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private ClubService clubService;

	@Autowired
	private SocialingService socialingService;
	
	@Autowired
	private ChallengeService challengeService;

	// 첫번째 카테고리
	@RequestMapping(value = "/goSign.do")
	public String goSignUp(CategoryVO vo, Model model) throws IOException {

		model.addAttribute("catehighList", categoryService.getCateHighList(vo));

		return "SignUp";
	}

	// 두번째 카테고리
	@RequestMapping(value = "/SignUp.do", method = RequestMethod.GET)
	@ResponseBody
	public List<CategoryVO> getSelect(@RequestParam("cthigh_name") String cthigh_name) {
		return categoryService.getCateMidList(cthigh_name);
	}

	// 메인에서 넘길때
	@RequestMapping(value = "/goclub.do")
	public String category(ClubVO vo2, CategoryVO vo, MemberVO mvo, Model model, MemInterClubVO mivo, HttpSession session) throws IOException {

	      int code = (int)session.getAttribute("code");
	      mvo.setMem_code(code);
	      
	      HashMap<String, Object> map = new HashMap<String, Object> ();
	      map.put("clublist", vo2);
	      map.put("member", mvo);
	      map.put("meminter", mivo);
	      
	      
	      // 상위
	      model.addAttribute("highcategory", categoryService.getCateList2(vo));

	      // 85개
	      model.addAttribute("midcategory", categoryService.getCateList(vo));

	      // 리스트
	      model.addAttribute("clubTotList", clubService.getClubList(map));
	      
	      
	      return "clubTotal";
	   }

	//카테고리 뽑아오기
	@RequestMapping(value = "/gosocial.do")
	public String social(SocialingVO vo2, CategoryVO vo, Model model) throws IOException {

		HashMap<String, Object> map = new HashMap<String, Object>();
		// 상위
		model.addAttribute("highcategory", categoryService.getCateList2(vo));

		// 85개
		model.addAttribute("midcategory", categoryService.getCateList(vo));

		// 리스트
		model.addAttribute("SocialTotList", socialingService.getSocialList(vo2));

		return "Social";
	}

	//챌린지 갈때 카테고리
	  @RequestMapping(value = "/gochallenge.do")
      public String category(ChallengeVO vo2,CategoryVO vo, Model model) throws IOException{
         //상위
         model.addAttribute("highcategory", categoryService.getCateList2(vo));
         
         //85개
         model.addAttribute("midcategory", categoryService.getCateList(vo));
        
         //리스트
         model.addAttribute("challengeTotList", challengeService.getChallengeList(vo2));

         return "challengeTotal";
      }
      
}