package com.iot.test.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
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
	
	@Select("select uiId from user_info where uiId = #{uiv.uiId}")			
	UserInfoVO selectUiId(@Param("uiv")UserInfoVO uiv);
	
	
	@Insert("insert into user_info(uiId,uiPwd,uiNickName,uiEmail,uiRegdate) "
			+ "values(#{uiId},#{uiPwd},#{uiNickName},#{uiEmail},current_timestamp)")
	int insertUserInfo(UserInfoVO uiv);
			
}
