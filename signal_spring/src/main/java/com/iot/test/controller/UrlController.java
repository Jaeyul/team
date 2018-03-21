package com.iot.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.iot.test.dao.CategoryDAO;
import com.iot.test.dao.ColorInfoDAO;

@Controller
public class UrlController {
	@Autowired
	private CategoryDAO ctdao;

	@Autowired
	private ColorInfoDAO cldao;
	@RequestMapping("/welcome")
	public String index() {

		return "index";
	}

	@RequestMapping(value = "/login")
	public String login() {

		return "user/login";
	}

	@RequestMapping("/signup")
	public String signup() {

		return "user/signup";
	}

	@RequestMapping("/video")
	public String groupcall() {

		return "vchat/groupcall";
	}

	@RequestMapping("/map")
	public ModelAndView map(ModelAndView mav) {
			
		mav.addObject("ctList",ctdao.selectCategoryList());
		mav.addObject("clList",cldao.selectColorList());
		
		mav.setViewName("map/map");
		
		return mav;
	}
	

}
