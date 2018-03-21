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

	@Select("select bNo, bName, bContent, bRegDate, uiNo from bulletin_board")
	public List<BoardVO> boardList();

	@Select("select bNo, bName, bContent, bRegDate, uiNo from bulletin_board where bName = #{bName} or bContent = #{bContent} or uiNo = #{uiNo}")
	public List<BoardVO> searchBoardList(@Param("bv") BoardVO bv);

	@Insert("insert into bulletin_board(bName, bContent, bRegDate, uiNo) values(#{bName}, #{bContent}, curent_timestamp, #{uiNo})")
	public int insertBoard(@Param("bv") BoardVO bv);

	@Delete("delete from bulletin_board where bNo = #{bNo}")
	public int deleteBoard(@Param("bNo") Integer bNo);

	@Update("update bulletin_board set bName = #{bName}, bContent = #{bContent} where bNo = #{bNo}")
	public int updateBoard(@Param("bv") BoardVO bv);

}
