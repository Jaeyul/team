package com.iot.test.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iot.test.mapper.RoomInfoMapper;
import com.iot.test.mapper.UserInRoomMapper;
import com.iot.test.vo.UserInRoomVO;

@Controller
@RequestMapping("/uir")
public class UserInRoomController {
	private static final Logger log = LoggerFactory.getLogger(UserInRoomController.class);
	
	@Autowired
	UserInRoomMapper uirm;
	
	@Autowired
	RoomInfoMapper rim;

	@RequestMapping(value="/leave", method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> boardListPage(@RequestBody UserInRoomVO uirv) {
		Map<String,Object> rMap = new HashMap<String,Object>();
		
		log.info("UserInRoomVO =>{}", uirv);
		uirm.deleteUserInRoom(uirv);
		List<UserInRoomVO> uirvList = uirm.selectUserInRoomForRName(uirv);
		if(uirvList.size()==0) {
			int result = rim.deleteRoomInfo(uirv);			
		}
		return rMap;
	}

	
}

