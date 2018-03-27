package com.iot.test.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.iot.test.vo.UserInRoomVO;

@Mapper
public interface UserInRoomMapper {
	
	@Insert("insert into user_in_room(uiId, rName) values(#{uiId},#{rName})")
	public int insertUserInRoom(UserInRoomVO uirv);
	
	@Delete("delete from user_in_room where uiId=#{uiId} and rName=#{rName}")
	public int deleteUserInRoom(UserInRoomVO uirv);
	
	@Select("select rName from user_in_room where rName=#{rName}")
	List<UserInRoomVO> selectUserInRoomForRName(UserInRoomVO uirv);

}
