package com.iot.test.dao;

import java.util.List;
import java.util.Map;

public interface RegeonDAO {
	
	public List<Map<String,Object>> selectRegeonList();
	
	public Map<String,Object> selectRegeonNo(String regeonName);
}
