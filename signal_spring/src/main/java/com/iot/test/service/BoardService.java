package com.iot.test.service;

import java.util.List;

import com.iot.test.vo.BoardVO;

public interface BoardService {
	public List<BoardVO> boardList();

	public List<BoardVO> searchBoardList(BoardVO bv);

	public BoardVO selectByNo(Integer bNo);

	public int insertBoard(BoardVO bv);

	public int deleteBoard(Integer bcNo);

	public int updateBoard(BoardVO bv);
}
