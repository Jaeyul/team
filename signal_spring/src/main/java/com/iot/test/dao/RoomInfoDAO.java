package com.iot.test.dao;

import java.util.List;
import java.util.Map;

public interface RoomInfoDAO {
	
	public List<Map<String,Object>> selectRoomInfoList(Map<String,Object> rNameMap);
	public int insertRoomInfo(Map<String,Object> rMap);
}
