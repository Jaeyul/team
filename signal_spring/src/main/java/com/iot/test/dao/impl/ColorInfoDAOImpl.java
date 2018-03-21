package com.iot.test.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iot.test.dao.ColorInfoDAO;
import com.iot.test.mapper.ColorInfoMapper;

@Repository
public class ColorInfoDAOImpl implements ColorInfoDAO{
	
	@Autowired
	private ColorInfoMapper cim;

	@Override
	public List<Map<String, Object>> selectColorList() {
		
		List<Map<String,Object>> colorList = cim.selectColorList();		
		return colorList;
	}

}
