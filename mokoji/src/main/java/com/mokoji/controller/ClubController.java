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
public class ClubController {
	@Autowired
	private SocialingService socialingService;
	
	@Autowired
	private ClubService clubService;

	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ChallengeService challengeService;

	//동호회 생성
	@RequestMapping(value="/insertClub.do")
	public String insertClub(ClubVO cvo, MemberVO mvo, CategoryVO cavo, HttpSession session) throws IOException{
		
		HashMap<String, Object> map= new HashMap<String, Object>();
		
		
		int num = clubService.selectClubcode(cvo);		
		
		cvo.setClub_code(num);
		
		map.put("club", cvo);
		
		map.put("member", mvo);
		
		map.put("category", cavo);
		
		clubService.insertClub(map);
		clubService.insertMemClub(map);
		
		

		return "redirect:/go.do";
	}
	

	// index - main 연결
	// index - main 연결
	@RequestMapping(value = "/go.do")
	public String goMain(CategoryVO vo1, ChallengeVO chvo, ClubVO vo, Model model) throws IOException {
		// 동호회 리스트 가져오기
		model.addAttribute("clubList", clubService.getClubCard(vo));
		model.addAttribute("challengeList", challengeService.getChallengeList(chvo));
		// return "main/main";
		return "/main/testindex";
	}

	// 상위 카테고리 별 동호회 리스트 뽑기
	@RequestMapping(value = "/clubTotal.do", method = RequestMethod.POST)
	@ResponseBody
	public List<HashMap<String, Object>> getHighClubListInterest(@RequestParam("cthigh_name") String cthigh_name, ClubVO vo,MemInterClubVO mivo, CategoryVO cvo,MemberVO mvo, HttpSession session) {
	      
	      int code = (int)session.getAttribute("code");
	      mvo.setMem_code(code);
	      cvo.setCthigh_name(cthigh_name);
	      
	      HashMap<String, Object> map = new HashMap<String, Object> ();
	      map.put("club", vo);
	      map.put("cate", cvo);
	      map.put("member", mvo);
	      map.put("meminter", mivo);
	      
	      return clubService.getHighClubListInterest(map);
	   }

	// 하위 카테고리 별 동호회 리스트 뽑기
	@RequestMapping(value = "/clubTotal.do", method = RequestMethod.GET)
	@ResponseBody
	 public List<HashMap<String, Object>> getClubListInterest(@RequestParam("ctmid_name") String ctmid_name, ClubVO vo, MemInterClubVO mivo, CategoryVO cvo,MemberVO mvo, HttpSession session) {
	      
	      int code = (int)session.getAttribute("code");
	      mvo.setMem_code(code);
	      cvo.setCthigh_name(ctmid_name);
	      
	      HashMap<String, Object> map = new HashMap<String, Object> ();
	      map.put("club", vo);
	      map.put("cate", cvo);
	      map.put("member", mvo);
	      map.put("meminter", mivo);
	      
	      return clubService.getClubListInterest(map);
	   }
	
	//검색류
	@RequestMapping("SearchClub.do")
	public String getSearchClubList(@RequestParam("search") String search, Model model, MemberVO mvo, CategoryVO catevo, SocialingVO svo,HttpSession session) {
		
		//로그인한 멤버코드 가져오기
		mvo.setMem_code((int)session.getAttribute("code"));
		
		//검색어 가져오기
		svo.setSocial_loc(search);
		catevo.setCtmid_name(search);
		HashMap<String, Object> map = new HashMap<String, Object> ();
		
		
		int ctnum = clubService.getSearchClubCate(catevo);
		catevo.setCtmid_code(ctnum);
		
		map.put("member", mvo);
		map.put("category", catevo);
		
		
		
		//0이면 지역
		if(ctnum == 0) {
			model.addAttribute("clubLocList", clubService.selectClubByClubLoc(map));
			model.addAttribute("socialLocList", socialingService.searchSocialByLoc(svo));
			
		}else {
			//0이 아니면 카테고리
			model.addAttribute("clubCtList", clubService.selectClubByCategory(map));
			model.addAttribute("socialCtList", socialingService.searchSocialByCate(catevo));
			
		}
		
		
		return "searchPage";
		
	}
	

}
