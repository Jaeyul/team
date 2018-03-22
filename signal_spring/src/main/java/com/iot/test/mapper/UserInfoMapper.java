package com.iot.test.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.iot.test.vo.UserInfoVO;

@Mapper
public interface UserInfoMapper {
	
	List<UserInfoVO> selectUserList(UserInfoVO ui);
	
	@Select("select uiNo,uiId,uiPwd,uiNickName,uiEmail,uiRegDate "
			+ "from user_info where uiId = #{uiv.uiId} and uiPwd = #{uiv.uiPwd}")
	UserInfoVO selectUserForLogin(@Param("uiv")UserInfoVO uiv);
}
