package com.iot.test.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.iot.test.vo.UserInfoVO;

@Mapper
public interface UserInfoMapper {

	List<UserInfoVO> selectUserList(UserInfoVO ui);
}
