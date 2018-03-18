package com.iot.test.dao;

import java.util.List;

import com.iot.test.vo.UserInfoVO;

public interface UserInfoDAO {
	
	public List<UserInfoVO> selectUserList(UserInfoVO ui);

}
