package com.iot.test.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iot.test.dao.CategoryDAO;
import com.iot.test.dao.ColorInfoDAO;
import com.iot.test.dao.RegeonDAO;
import com.iot.test.dao.RoomInfoDAO;
import com.iot.test.mapper.RoomInfoMapper;
import com.iot.test.service.RoomInfoService;

@Service
public class RoomInfoServiceImpl implements RoomInfoService {
	@Autowired
	private RoomInfoDAO ridao;
	
	@Autowired
	private ColorInfoDAO cldao;
	
	@Autowired
	private CategoryDAO ctdao;
	
	@Autowired
	private RegeonDAO rgdao;
	
	@Autowired
	private RoomInfoMapper rim;
			
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
	
	@Override
	public List<Map<String, Object>> searchAllRoom(Map<String, Object> regeonMap) {
		
		String regeonName = (String) regeonMap.get("regeonName");
		Map<String,Object> regeonNo = rgdao.selectRegeonNo(regeonName);
		
		List<Map<String, Object>> allRoomList = rim.selectAllRoomList(regeonNo);
		return allRoomList;
	}
	

	@Override
	public List<Map<String, Object>> searchRoomInfo(Map<String, Object> roomMap) {
		List<Map<String,Object>> categoryNoList = new ArrayList<Map<String,Object>>();
		
		List<String> colorList = (List<String>) roomMap.get("categoryList");
		String regeonName = (String) roomMap.get("regeonName");
		
		Map<String,Object> regeonNo = rgdao.selectRegeonNo(regeonName);
				
		for(String colorId : colorList) {			
			Map<String,Object> categoryName = cldao.selectCategoryName(colorId);			
			Map<String,Object> categoryNo = ctdao.selectCategoryNo(categoryName);
			categoryNo.put("regeonNo", regeonNo.get("regeonNo"));			
			categoryNoList.add(categoryNo);
		}		
		
		List<Map<String,Object>> roomInfoList = new ArrayList<Map<String,Object>>();
		
		for(Map<String,Object> roomInfo : categoryNoList) {
			List<Map<String,Object>> roomList = rim.selectRoomList(roomInfo);
			for(Map<String,Object> roomInfoMap : roomList) {
				roomInfoList.add(roomInfoMap);				
			}
		}	
		
		System.out.println(roomInfoList);
		
		return roomInfoList;
	}

	


}
