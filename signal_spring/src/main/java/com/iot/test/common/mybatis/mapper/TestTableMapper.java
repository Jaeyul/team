package com.iot.test.common.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TestTableMapper {
	
	List<Map<String, Object>> selectUserList();
}