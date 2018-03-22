package com.iot.test.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iot.test.dao.RegeonDAO;
import com.iot.test.mapper.RegeonMapper;

@Repository
public class RegeonDAOImpl implements RegeonDAO{
	@Autowired
	RegeonMapper rgm;
	
	@Override
	public List<Map<String, Object>> selectRegeonList() {
		List<Map<String, Object>> rgList = rgm.selectRegeonList();		
		return rgList;
	}

	@Override
	public Map<String,Object> selectRegeonNo(String regeonName) {
		Map<String,Object> regeonNo = rgm.selectRegeonNo(regeonName);		
		return regeonNo;
	}

}
