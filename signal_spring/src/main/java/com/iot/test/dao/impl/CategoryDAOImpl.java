package com.iot.test.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iot.test.dao.CategoryDAO;
import com.iot.test.mapper.CategoryMapper;

@Repository
public class CategoryDAOImpl implements CategoryDAO{

	@Autowired
	private CategoryMapper cm;
	
	@Override
	public List<Map<String, Object>> selectCategoryList() {
		List<Map<String,Object>> cList = cm.selectCategoryList();		
		return cList;
	}
	
	

}
