package com.iot.test.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.iot.test.vo.BoardCommentVO;

@Mapper
public interface BoardCommentMapper {
	@Select("select bcNo, bcText, uiId, bNo, bcRegDate from board_comment")
	public List<BoardCommentVO> boardCommentList();

	@Select("select bcNo, bcText, uiId, bNo, bcRegDate from board_comment where bNo = #{bNo}")
	public List<BoardCommentVO> selectCommentByBNo(@Param("bNo") Integer bNo);

	@Insert("insert into board_comment (bcText, uiId, bNo, bcRegDate) values(#{bText},#{uiId},#{bNo},current_timestamp)")
	public int insertComment(@Param("bcv") BoardCommentVO bcv);

	@Delete("delete from board_comment where bcNo = #{bcNo}")
	public int deleteComment(@Param("bcNo") Integer bcNo);

}
