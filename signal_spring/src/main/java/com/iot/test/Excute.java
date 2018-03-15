package com.iot.test;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;

import com.iot.test.common.mybatis.mapper.TestTableMapper;

public class Excute {
	@Autowired
	private TestTableMapper mapper;

	public static void main(String[] args) {

		Test2Application t2 = new Test2Application();
	}
}
