package com.iot.test.service;

import java.util.List;

import com.iot.test.vo.BoardHitVO;

public interface BoardHitService {
	public List<String> hitSessionIdList(int bNo);
	
	public void insertHit(BoardHitVO bhv);

	public int truncateHit();
}
