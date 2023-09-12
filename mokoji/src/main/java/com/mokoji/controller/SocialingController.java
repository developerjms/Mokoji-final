package com.mokoji.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mokoji.domain.CategoryVO;
import com.mokoji.domain.MemberVO;
import com.mokoji.domain.SocialingInfoVO;
import com.mokoji.domain.SocialingVO;
import com.mokoji.service.SocialingService;

@Controller
public class SocialingController {

	   @Autowired
	   private SocialingService socialingService;
	   
	   
	   @RequestMapping(value="/insertSocialing.do")
	   public String insertSocialing(SocialingVO vo, CategoryVO cvo, MemberVO mvo) throws IOException   {
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      int num = socialingService.selectSocialcode(vo);
	      
	      vo.setSocial_code(num);
	      
	      map.put("socialing", vo);
	      map.put("category", cvo);
	      map.put("member", mvo);
	      
	      socialingService.insertSocialing(map);
	      socialingService.insertSocialinfo(map);
	      return "redirect:/go.do";
	   }
	   
	   // 상위 카테고리 별 동호회 리스트 뽑기
	   @RequestMapping(value = "/Social.do", method = RequestMethod.POST)
	   @ResponseBody
	   public List<SocialingVO> getHighSocialListInterest(@RequestParam("cthigh_name") String cthigh_name) {
	      
	      return socialingService.getHighSocialListInterest(cthigh_name);
	   }

	   // 하위 카테고리 별 동호회 리스트 뽑기
	   @RequestMapping(value = "/Social.do", method = RequestMethod.GET)
	   @ResponseBody
	   public List<SocialingVO> getSocialListInterest(@RequestParam("ctmid_name") String ctmid_name) {
	      
	      return socialingService.getSocialListInterest(ctmid_name);
	   }
	   
	   //소셜링디테일 페이지 열기
	   @RequestMapping(value="/gosocialdetails.do")
	   public String getSocialdetails(SocialingVO vo, SocialingInfoVO svo, MemberVO mvo, Model model, HttpSession session) throws IOException{
	      
	      int memcode = (int)session.getAttribute("code");
	      mvo.setMem_code(memcode);
	      
	      
	      if(session.getAttribute("socialcode") != null) {
	         vo.setSocial_code((int)session.getAttribute("socialcode"));
	         
	      }
	      
	      model.addAttribute("OneSocialList", socialingService.getOneSocialList(vo));
	      
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      map.put("social", vo);
	      map.put("socialinfo", svo);
	      map.put("member", mvo);
	      
	      int check = socialingService.checkMemSocial(map);
	      session.setAttribute("check", check);
	      
	      
	      int memctcode = socialingService.getmemctcode(map);
	      session.setAttribute("memct_code", memctcode);
	      
	      //소셜링 입금 안된 목록  추출
	      model.addAttribute("MemSocialList", socialingService.getAllMemSocial(vo));
	      //소셜링 입금내역확인목록
	      model.addAttribute("Socialpay", socialingService.getsocialpay(map));
	      
	      session.removeAttribute("socialcode");
	      
	      return "Socialdetails";
	   }
	   
	   @RequestMapping(value = "/socialjoin.do")
	   public String joinsocialinsert(SocialingVO vo, SocialingInfoVO svo,MemberVO mvo,  HttpSession session,  HttpServletResponse response) throws IOException {
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      
	      int memcode = (int)session.getAttribute("code");
	      mvo.setMem_code(memcode);
	      
	      session.setAttribute("socialcode", vo.getSocial_code());
	      
	      
	      int cost = vo.getSocial_cost();
	      String chpay = "N";
	      if(cost == 0) {
	         chpay="Y";
	      }else {
	         chpay="N";
	      }
	      svo.setSocialinfo_chpay(chpay);
	      
	      map.put("member", mvo);
	      map.put("social", vo);
	      map.put("socialinfo", svo);
	      
	      int num = socialingService.getmemctcode(map);
	      
	      
	      if(num==2) {
	         //2면이미 가입한 동호회
	            response.setContentType("text/html; charset=UTF-8");
	                
	               PrintWriter out = response.getWriter();
	                
	               out.println("<script>alert('이미 가입한 소셜링입니다.'); location.href='gosocialdetails.do';</script>");
	                
	               out.flush();

	         
	         
	      }else if(num==1) {
	         //null이면 가입가능
	            response.setContentType("text/html; charset=UTF-8");
	                
	               PrintWriter out = response.getWriter();
	                
	               out.println("<script>alert('당신이만든 소셜링입니다.'); location.href='gosocialdetails.do';</script>");
	                
	               out.flush();

	         
	         
	      }else if(num==0){
	         //null이면서 동호회 가입유형이 승인제면 N으로 아님 Y로
	            response.setContentType("text/html; charset=UTF-8");
	                
	               PrintWriter out = response.getWriter();
	                
	               out.println("<script>alert('소셜링 신청이 완료되었습니다.'); location.href='gosocialdetails.do';</script>");
	                
	               out.flush();

	         socialingService.joinsocial(map);
	      }
	      
	      return "redirect:/gosocialdetails.do";
	   }
		       //소셜링 입금 확인
		       @RequestMapping(value="/upsocialpay.do")
		       public String upsocialpay(SocialingInfoVO vo, SocialingVO vo1, HttpSession session) {
		          
		          session.setAttribute("socialcode", vo1.getSocial_code());
		          System.out.println(session.getAttribute("socialcode"));
		          socialingService.upsocialpay(vo);
		          
		          return "redirect:/gosocialdetails.do";
		          
		       }

	         //승인 확인
	         @RequestMapping(value="/upsocialing.do", method = RequestMethod.POST)
	         public String upsocialing(SocialingInfoVO vo, SocialingVO vo1, HttpSession session) {
	            
	            session.setAttribute("socialcode", vo1.getSocial_code());
	            
	            socialingService.upsocialing(vo);
	            
	            return "redirect:/gosocialdetails.do";
	         }

	         
	         //승인 거절
	         @RequestMapping(value="/delsocialing.do", method = RequestMethod.POST)
	         public String delsocialing(SocialingInfoVO vo, SocialingVO vo1, HttpSession session) {
	            
	            session.setAttribute("socialcode", vo.getSocial_code());
	            
	            socialingService.delsocialing(vo);
	            
	            return "redirect:/gosocialdetails.do";
	         }

	   

}