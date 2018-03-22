package com.iot.test.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iot.test.dao.RoomInfoDAO;
import com.iot.test.service.RoomInfoService;

@Service
public class RoomInfoServiceImpl implements RoomInfoService {
	@Autowired
	private RoomInfoDAO ridao;
			
	@Override
	public void setRoomInfo(Map<String, Object> rNameMap) {		
		rNameMap.put("msg", "중복된 방이 존재합니다.");		
		if((ridao.selectRoomInfoList(rNameMap).size())==0) {
			rNameMap.remove("msg");					
		}		
	}

	@Override
	public int insertRoomInfo(Map<String, Object> rMap) {
		
		return ridao.insertRoomInfo(rMap);
	}
}
