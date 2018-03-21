package com.iot.test.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ColorInfoMapper {
	
	List<Map<String,Object>> selectColorList();

}
