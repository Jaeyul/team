package com.iot.test.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iot.test.mapper.BoardHitMapper;
import com.iot.test.service.BoardHitService;
import com.iot.test.vo.BoardHitVO;

@Service
public class BoardHitServiceImpl implements BoardHitService {

	@Autowired
	BoardHitMapper bhm;

	@Override
	public List<String> hitSessionIdList(int bNo) {
		
		return bhm.hitSessionIdList(bNo);
	}
	@Override
	public void insertHit(BoardHitVO bhv) {
		bhm.insertHit(bhv);
	}

	@Override
	public int truncateHit() {

		return bhm.tuncateHit();
	}


}
