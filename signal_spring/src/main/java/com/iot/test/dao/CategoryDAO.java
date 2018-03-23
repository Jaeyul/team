package com.iot.test.dao;

import java.util.List;
import java.util.Map;

public interface CategoryDAO {
	
	public List<Map<String,Object>> selectCategoryList();
	
	public Map<String,Object> selectCategoryNo(Map<String,Object> categoryName);

}
