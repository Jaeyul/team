package com.iot.test.service;

import java.util.Map;

public interface RoomInfoService {
	
	public void setRoomInfo(Map<String,Object> rNameMap);
	public int insertRoomInfo(Map<String,Object> rMap);
}
