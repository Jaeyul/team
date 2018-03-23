package com.iot.test.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iot.test.dao.RoomInfoDAO;
import com.iot.test.mapper.RoomInfoMapper;

@Repository
public class RoomInfoDAOImpl implements RoomInfoDAO{
	
	@Autowired
	private RoomInfoMapper rim;

	@Override
	public List<Map<String, Object>> selectRoomInfoList(Map<String, Object> rNameMap) {
		
		List<Map<String,Object>> roomInfoList = rim.selectRoomInfoList(rNameMap);
		
		return roomInfoList;
	}

	@Override
	public int insertRoomInfo(Map<String, Object> rMap) {
		
		int result = rim.insertRoomInfo(rMap);
		return result;
	}
	
	

}
