package com.iot.test.service.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iot.test.dao.UserInfoDAO;
import com.iot.test.service.UserInfoService;
import com.iot.test.vo.UserInfoVO;

@Service
public class UserInfoServiceImpl implements UserInfoService {

	@Autowired
	private UserInfoDAO uidao;
	
	@Override
	public void setUserInfoList(Map<String, Object> rMap, UserInfoVO ui, HttpSession hs) {
		
		rMap.put("msg", "로그인에 실패하셨습니다.");
		rMap.put("biz", false);
		List<UserInfoVO> userList = uidao.selectUserList(ui);
		
		if(userList.size()!=0) {
			rMap.put("msg", "로그인에 성공하셨습니다.");
			rMap.put("biz", true);
			hs.setAttribute("user", userList);			
		}
		
	}

}
