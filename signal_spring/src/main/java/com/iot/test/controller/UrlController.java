package com.iot.test.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import com.iot.test.mapper.CategoryMapper;
import com.iot.test.mapper.ColorInfoMapper;
import com.iot.test.mapper.RegeonMapper;
import com.iot.test.service.RoomInfoService;

@Controller
public class UrlController {
	private static final Logger log = LoggerFactory.getLogger(UrlController.class);

	@Autowired
	private CategoryMapper ctm;

	@Autowired
	private ColorInfoMapper clm;

	@Autowired
	private RegeonMapper rgm;

	@Autowired
	private RoomInfoService ris;

	@RequestMapping("/welcome")
	public String index() {

		return "index";
	}

	@RequestMapping("/header")
	public String header() {

		return "common/header";
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
	public ModelAndView groupcall(@RequestParam Map<String, Object> rMap) throws JsonProcessingException {
		ModelAndView mav = new ModelAndView();
		ObjectMapper om = new ObjectMapper();
		String regeonName = (String) rMap.get("regeonName");
		rMap.remove("regeonName");
		rMap.put("regeonNo", ((rgm.selectRegeonNo(regeonName)).get("regeonNo")));
		ris.insertRoomInfo(rMap);
		mav.setViewName("vchat/groupcall");
		mav.addObject("roomInfo", rMap.get("rName"));
		return mav;
	}

	@RequestMapping("/map")
	public ModelAndView map(ModelAndView mav) {

		mav.addObject("ctList", ctm.selectCategoryList());
		mav.addObject("clList", clm.selectColorList());
		mav.addObject("rgList", rgm.selectRegeonList());

		mav.setViewName("map/map");
		return mav;
	}

}
