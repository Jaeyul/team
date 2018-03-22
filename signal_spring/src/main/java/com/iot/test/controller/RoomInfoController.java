package com.iot.test.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iot.test.service.RoomInfoService;

@Controller
@RequestMapping("/room")
public class RoomInfoController {
	private static final Logger log = LoggerFactory.getLogger(RoomInfoController.class);
	
	@Autowired
	RoomInfoService ris;
	
	@RequestMapping(value="/check", method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> checkRoomName(@RequestBody Map<String,Object> rNameMap){
		
		ris.setRoomInfo(rNameMap);	
		
		return rNameMap;
	}

}
