package com.iot.test.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iot.test.mapper.BoardMapper;
import com.iot.test.service.BoardService;
import com.iot.test.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardMapper bm;

	@Override
	public List<BoardVO> boardList() {

		return bm.boardList();
	}

	@Override
	public List<BoardVO> searchBoardList(BoardVO bv) {

		return bm.searchBoardList(bv);
	}

	@Override
	public BoardVO selectByNo(Integer bNo) {

		return bm.selectByNo(bNo);
	}

	@Override
	public int insertBoard(BoardVO bv) {

		return bm.insertBoard(bv);
	}

	@Override
	public int deleteBoard(Integer bNo) {

		return bm.deleteBoard(bNo);
	}

	@Override
	public int updateBoard(BoardVO bv) {

		return bm.updateBoard(bv);
	}

}
