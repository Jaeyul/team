package com.iot.test.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.iot.test.vo.BoardVO;

@Mapper
public interface BoardMapper {

	@Select("select bNo, bName, bContent, bRegDate, uiId from bulletin_board")
	public List<BoardVO> boardList();

	@Select("select bNo, bName, bContent, bRegDate, uiId from bulletin_board where bName = #{bv.bName} or bContent = #{bv.bContent} or uiId = #{bv.uiId}")
	public List<BoardVO> searchBoardList(@Param("bv") BoardVO bv);

	@Select("select bNo, bName, bContent, bRegDate, uiId from bulletin_board where bNo = #{bNo}")
	public BoardVO selectByNo(@Param("bNo") Integer bNo);
	
	@Select("call p_board_insertGetNo(#{bv.bName}, #{bv.bContent}, #{bv.uiId})")
	public int insertBoard(@Param("bv") BoardVO bv);

	@Delete("delete from bulletin_board where bNo = #{bNo}")
	public int deleteBoard(@Param("bNo") Integer bNo);

	@Update("update bulletin_board set bName = #{bv.bName}, bContent = #{bv.bContent} where bNo = #{bv.bNo}")
	public int updateBoard(@Param("bv") BoardVO bv);
	
}
