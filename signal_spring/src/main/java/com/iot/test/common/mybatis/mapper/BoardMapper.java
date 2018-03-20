package com.iot.test.common.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.iot.test.vo.BoardVO;

@Mapper
public interface BoardMapper {

	@Select("select bNo, bName, bContent, bRegDate, uiNo from bulletin_board")
	public List<BoardVO> boardList();
	
	@Select("select bNo, bName, bContent, bRegDate, uiNo from bulletin_board where bName = #{bName} or bContent = #{bContent} or uiNo = #{uiNo}")
	public List<BoardVO> searchBoardList(@Param("bName") String bName, @Param("bContent") String bContent, @Param("uiNo") Integer uiNo);
}
