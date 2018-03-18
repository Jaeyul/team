package com.iot.test.common.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.iot.test.vo.UserInfoVO;

@Mapper
public interface UserInfoMapper {
	
	List<UserInfoVO> selectUserList(UserInfoVO ui);
}
