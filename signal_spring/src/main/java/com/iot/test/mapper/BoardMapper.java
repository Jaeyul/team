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

	@Select("select bNo, bName, bContent, bRegDate, uiNickName, bHit, bRecom from bulletin_board")
	public List<BoardVO> boardList();

	@Select("select bNo, bName, bContent, bRegDate, uiNickName, bHit, bRecom from bulletin_board where bName = #{bv.bName} or bContent = #{bv.bContent} or uiNickName = #{bv.uiNickName}")
	public List<BoardVO> searchBoardList(@Param("bv") BoardVO bv);

	@Select("select bNo, bName, bContent, bRegDate, uiNickName, bHit, bRecom from bulletin_board where bNo = #{bNo}")
	public BoardVO selectByNo(@Param("bNo") Integer bNo);
	
	@Insert("call p_board_insertGetNo(#{bv.bName}, #{bv.bContent}, #{bv.uiNickName})")
	public int insertBoard(@Param("bv") BoardVO bv);

	@Delete("delete from bulletin_board where bNo = #{bNo}")
	public int deleteBoard(@Param("bNo") Integer bNo);

	@Update("update bulletin_board set bName = #{bv.bName}, bContent = #{bv.bContent} where bNo = #{bv.bNo}")
	public int updateBoard(@Param("bv") BoardVO bv);

	@Update("update bulletin_board set bHit = bHit+1 where bNo = #{bNo}")
	public int updateBoardHit(@Param("bNo") int bNo);

	@Update("update bulletin_board set bRecom = bRecom+1 where bNo = #{bNo}")
	public int updateBoardRecom(@Param("bNo") int bNo);
	
}
