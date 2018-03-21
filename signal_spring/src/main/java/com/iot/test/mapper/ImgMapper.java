package com.iot.test.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.iot.test.vo.ImageVO;

@Mapper
public interface ImgMapper {

	@Select("select imgNo, imgName, imgProtect, bNo from image_file")
	public List<ImageVO> ImgList();

	@Select("select imgNo, imgName, imgProtect, bNo from image_file where imgNo = #{imgNo}")
	public List<ImageVO> searchImgList(@Param("imgNo") Integer imgNo);
	
	@Insert("insert into image_file(imgName, imgProtect, imgRegDate, bNo) values(#{imgName}, #{imgProtect}, curent_timestamp, #{bNo})")
	public int insertImg(@Param("img") ImageVO img);
	
	@Delete("delete from image_file where imgNo = #{imgNo}")
	public int deleteImg(@Param("imgNo") Integer imgNo);
	
	@Update("update image_file set imgName = #{imgName}, imgProtect = #{imgProtect}, bNo =#{bNo} where imgNo = #{imgNo}")
	public int updateImg(@Param("img") ImageVO img);
}
