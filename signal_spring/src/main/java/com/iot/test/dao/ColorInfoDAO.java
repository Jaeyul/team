package com.iot.test.dao;

import java.util.List;
import java.util.Map;

public interface ColorInfoDAO {
	
	public List<Map<String,Object>> selectColorList();
	
	public Map<String,Object> selectCategoryName(String colorId);

}
