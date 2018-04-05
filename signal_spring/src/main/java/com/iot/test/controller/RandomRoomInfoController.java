package com.iot.test.controller;

import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/random")
public class RandomRoomInfoController {
	
	private static final Logger log = LoggerFactory.getLogger(RandomRoomInfoController.class);
	
	@RequestMapping("/chat")
	public String goInRandomChat(@RequestParam Map<String,Object> checkMap, HttpSession hs) {
				
		
		return "rvchat/yaho";
	}
	
	@RequestMapping(value="/check", method=RequestMethod.POST)
	public @ResponseBody String RandomChatSizeCheck(@RequestBody Map<String,Object> checkMap, HttpSession hs) {
		
		String randomRoomName = UUID.randomUUID().toString();
		log.info("아이디 확인이나 해보자 ==>{}", randomRoomName);
		log.info("받아오는 값 확인이나 해보자 ==>{}", checkMap);		
	
		return "야호";
	}

}
