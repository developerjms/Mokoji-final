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

import com.mokoji.domain.GiftCategoryVO;
import com.mokoji.domain.GifticonVO;
import com.mokoji.domain.MemberVO;
import com.mokoji.service.GifticonService;

@Controller
public class GifticonController {
	
	@Autowired
	private GifticonService gifticonService;
	
	
	//기프티콘화면
	@RequestMapping(value="/goGiftshop.do")
	public String AllgifticonList(GifticonVO vo, Model model) throws IOException {
		model.addAttribute("AllgifticonList",  gifticonService.AllgifticonList(vo));
		return "Giftshop";
	}
	
	//카테고리 선택 비동기
	@RequestMapping(value="/giftcate.do", method = RequestMethod.POST)
	@ResponseBody
	public List<GifticonVO> selectGifticon(@RequestParam("shophigh_name") String shophigh_name){
		return gifticonService.selectGifticon(shophigh_name);
	}

	@RequestMapping(value="/goGiftTotal.do")
	public String getGiftTotal(GifticonVO vo, GiftCategoryVO cvo, Model model) {
		
		 
		 model.addAttribute("giftList",  gifticonService.allGiftList(vo));
		
		return "GiftshopTotal";
	}
	
	//기프트토탈페이지 중카테고리 추출
	@RequestMapping(value="/getMiddleList.do", method =  RequestMethod.POST)
	@ResponseBody
	public List<GiftCategoryVO> getMiddleList(@RequestParam("shophigh_name") String shophigh_name){
		
		return gifticonService.getMiddleList(shophigh_name);
	}
	
	//기프트토탈페이지 검색기능
	@RequestMapping(value="/searchGift.do", method =  RequestMethod.GET)
	@ResponseBody
	public List<HashMap<String, Object>> searchGift(@RequestParam("shopmiddle_code") int shopmiddle_code,
			@RequestParam("gcon_price") int pay, GifticonVO vo, GiftCategoryVO cvo){
		
			vo.setGcon_price(pay);
			cvo.setShopmiddle_code(shopmiddle_code);
			
			
			HashMap<String,Object> map = new HashMap<String, Object> ();
			map.put("gift", vo);
			map.put("cate", cvo);
			
		return gifticonService.searchGift(map);
	}
	
	//기프트 디테일페이지 이동
	@RequestMapping(value="/goGiftshopdetails.do")
	public String goGiftshopDetails(GifticonVO vo, Model model) {

		
		model.addAttribute("GiftOneList",gifticonService.goGiftshopDetails(vo));
		
		return "Giftshopdetails";
	}
	
	//기프티콘 구입
	@RequestMapping(value="buyGift.do", method =  RequestMethod.POST)
	@ResponseBody
	public void buyGift(@RequestParam("gcon_code") int gcon_code, @RequestParam("remainpoint") int remainpoint, @RequestParam("giftcount")int giftcount, GifticonVO vo, MemberVO mvo, HttpSession session){
		int code = (int)session.getAttribute("code");
		mvo.setMem_code(code);
		mvo.setMem_point(remainpoint);
		vo.setGcon_code(gcon_code);
		vo.setGcon_count(giftcount);
		HashMap <String,Object> map = new HashMap<String, Object>();
		map.put("gifticon", vo);
		map.put("member", mvo);
		
		gifticonService.insertBuyGift(map);
		gifticonService.updateMemGift(map);
		int point = gifticonService.getMemPoint(code);
		session.setAttribute("point", point);
	}



	
}
