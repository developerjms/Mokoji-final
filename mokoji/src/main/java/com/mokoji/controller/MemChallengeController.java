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

import com.mokoji.domain.ChallengeVO;
import com.mokoji.domain.MemberVO;
import com.mokoji.service.MemChallengeService;

@Controller
public class MemChallengeController {

	@Autowired
	private MemChallengeService memChallengeService;

	// 챌린지 가입
	@RequestMapping(value = "/joinChallenge.do")
	public void joinChallengeInsert(ChallengeVO vo, MemberVO mvo, Model model, HttpSession session,
			HttpServletResponse response) throws IOException {

		mvo.setMem_code((int) session.getAttribute("code"));

		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("member", mvo);
		map.put("challenge", vo);

		String msg = "이미 가입한  챌린지입니다";
		String msg1 = "본인이 생성한 챌린지입니다";
		String msg2 = "챌린지 가입 신청이 완료되었습니다!";
		response.setContentType("text/html; charset=utf-8");
		PrintWriter w = response.getWriter();
		

		// 회원분류
		int num = memChallengeService.checkMtCode(map);
		System.out.println(num + "회원분류료");

		if (num == 2) {
			// 2면이미 가입한 동호회
			
			w.write("<script>alert('" + msg + "');history.back();</script>");
			w.flush();
			w.close();
		} else if (num == 1) {
			// null이면 가입가능
			
			w.write("<script>alert('" + msg1 + "');history.back();</script>");
			w.flush();
			w.close();
		} else {
			// null이면서챌린지 가입유형이 승인제면 N으로 아님 Y로
			memChallengeService.joinChallenge(map);
			w.write("<script>alert('" + msg2 + "');history.back();</script>");
			w.flush();
			w.close();
		}

	}
}
