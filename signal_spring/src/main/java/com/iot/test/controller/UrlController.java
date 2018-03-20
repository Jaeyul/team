package com.iot.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UrlController {

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
	public String map() {

		return "map/map";
	}
	
	@RequestMapping("/board")
	public String board() {

		return "board/board";
	}

}
