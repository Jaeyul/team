package com.iot.test.common.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.iot.test.vo.ImageVO;

@Mapper
public interface ImgMapper {
	public List<ImageVO> ImgList();
}
