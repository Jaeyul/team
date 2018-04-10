package com.iot.test.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iot.test.mapper.FriendsMapper;
import com.iot.test.mapper.UserInfoMapper;
import com.iot.test.vo.UserInfoVO;

@Controller
@RequestMapping("/friends")
public class FriendsController {
	
	@Autowired
	FriendsMapper fm;
	
	@Autowired
	UserInfoMapper uim;
	
	@RequestMapping(value="/add")
	public @ResponseBody String addFriends(@RequestBody Map<String,String> nickNameMap, HttpSession hs) {		
		String fId = uim.selectUiIdForChat(nickNameMap.get("uiNickName"));		
		
		Map<String,Object> fMap = new HashMap<String,Object>();
		fMap.put("fId", fId);
		fMap.put("uiId", ((UserInfoVO) hs.getAttribute("user")).getUiId());
		
		
		List<Map<String,Object>> friendsCheckList = fm.selectFriendsListCheck(fMap);
		if(friendsCheckList.size()==0) {
			Map<String,Object> fInfoMap = uim.selectUserInfoToFriend(fId);
			fInfoMap.put("uiId", fMap.get("uiId"));
			int result = fm.insertFriends(fInfoMap);
			if(result==1) {								
				return "친구등록이 완료되었습니다.";
			}
			
		}else {			
			return "이미 등록된 친구입니다.";
		}
		
		
		
		
		return "친구등록에 실패하였습니다.";
	}

}
