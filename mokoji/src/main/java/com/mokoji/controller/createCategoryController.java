package com.mokoji.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mokoji.domain.CategoryVO;
import com.mokoji.service.CategoryService;

@Controller
public class createCategoryController {

	@Autowired
	private CategoryService CategoryService;

	// 소셜링 첫번째 카테고리
	@RequestMapping(value = "/createClub.do")
	public String ClubList(CategoryVO vo, Model model) throws IOException {

		model.addAttribute("catehighList", CategoryService.getCateHighList(vo));

		return "createClub";
	}

	// 소셜링 두번째 카테고리
	@RequestMapping(value = "/ClubList.do", method = RequestMethod.GET)
	@ResponseBody
	public List<CategoryVO> getSocialSelect(@RequestParam("cthigh_name") String cthigh_name) {
		return CategoryService.getCateMidList(cthigh_name);
	}

}
