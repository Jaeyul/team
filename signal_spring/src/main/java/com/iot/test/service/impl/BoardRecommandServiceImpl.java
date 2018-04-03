package com.iot.test.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iot.test.mapper.BoardRecommandMapper;
import com.iot.test.service.BoardRecommandService;
import com.iot.test.vo.BoardRecommandVO;

@Service
public class BoardRecommandServiceImpl implements BoardRecommandService {

	@Autowired
	BoardRecommandMapper brm;
	
	@Override 
	public List<Integer> recommandUiIdList(int bNo){
		return brm.RecomuiIdList(bNo);
	}

	@Override
	public void insertRecommand(BoardRecommandVO brv) {
		brm.insertRecom(brv);
	}

	@Override
	public int truncateRecommand() {

		return brm.tuncateRecom();
	}

}
