package com.iot.test.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iot.test.common.mybatis.mapper.UserInfoMapper;
import com.iot.test.dao.UserInfoDAO;
import com.iot.test.vo.UserInfoVO;

@Repository
public class UserInfoDAOImpl implements UserInfoDAO{
	@Autowired
	private UserInfoMapper uim;
	
	@Override
	public List<UserInfoVO> selectUserList(UserInfoVO ui) {
		
		List<UserInfoVO> userList = uim.selectUserList(ui);
		return userList;
	}
	
	

}
