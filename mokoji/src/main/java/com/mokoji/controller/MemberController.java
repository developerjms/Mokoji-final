package com.mokoji.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mokoji.domain.MemberVO;
import com.mokoji.service.MemClubService;
import com.mokoji.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private MemClubService memClubService;
	
	// 로그인
	@RequestMapping(value = "/checkMember.do")
	public String checkMember(MemberVO vo, HttpSession session) throws IOException {
		MemberVO result = memberService.checkMember(vo);

		char juminsex = result.getMem_jumin().charAt(6);
		String juminage = result.getMem_jumin().substring(0, 2);

		//현재 년도
		LocalDate now = LocalDate.now();
		int year = now.getYear();

		// 주민번호로 성별구하고 나이 뽑기
		if (juminsex == '1' || juminsex == '3') {
			vo.setMem_sex("남자");
			session.setAttribute("gender", "남자");
			if (juminsex == '1') {
				int realage = year - (Integer.parseInt(juminage) + 1900)+1;
				vo.setMem_age(realage);
				session.setAttribute("age", realage);
			} else if (juminsex == '3') {
				int realage = year - (Integer.parseInt(juminage) + 2000) + 1;
				vo.setMem_age(realage);
				session.setAttribute("age", realage);
			}

		} else if (juminsex == '2' || juminsex == '4') {
			vo.setMem_sex("여자");
			session.setAttribute("gender", "여자");
			if (juminsex == '2') {
				int realage = year - (Integer.parseInt(juminage) + 1900) + 1;
				vo.setMem_age(realage);
				session.setAttribute("age", realage);
			} else if (juminsex == '4') {
				int realage = year - (Integer.parseInt(juminage) + 2000) + 1;
				vo.setMem_age(realage);
				session.setAttribute("age", realage);
			}
		}

		
		// 주민번호로 나이구하기

		if (result == null || result.getMem_id() == null) {

			return "redirect:/SignUp.do";
		} else {
			// #4. 세션에 저장
			session.setAttribute("sessionTime", new Date().toString());
			session.setAttribute("name", result.getMem_id());
			session.setAttribute("code", result.getMem_code());
			session.setAttribute("point", result.getMem_point());
		}
		
		int chnum = memClubService.checkClubJang((int)session.getAttribute("code"));
		session.setAttribute("checknum", chnum);
		
		return "redirect:/go.do";
		

	}

	// 회원가입
	@RequestMapping(value = "/insertMember.do")
	public String insertMember(MemberVO vo) {
		memberService.insertMember(vo);
		return "redirect:/test.do";
	}

	// 아이디 중복 체크
	@RequestMapping(value = "/SignUp.do", method = RequestMethod.POST)
	@ResponseBody
	public int nameCheck(@RequestParam("mem_id") String mem_id) {
		return memberService.nameCheck(mem_id);
	}

	// 로그아웃
	@RequestMapping(value = "logout.do", method = RequestMethod.POST)
	@ResponseBody
	public void logoutPOST(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();
		

		session.invalidate();

	}
}
