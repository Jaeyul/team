package com.iot.test.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RoomInfoMapper {
	
	List<Map<String,Object>> selectRoomInfoList(Map<String,Object> rNameMap);
	int insertRoomInfo(Map<String,Object> rMap);
}
