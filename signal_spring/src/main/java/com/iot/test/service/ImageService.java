package com.iot.test.service;

import java.io.IOException;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.iot.test.vo.ImageVO;

public interface ImageService {
	public List<ImageVO> ImgList();

	public List<ImageVO> selectByBno(int bNo);

	public int insertImg(ImageVO img);

	public int deleteImgByBNo(int imgNo);

	public int deleteImgByImgId(String imgId);

	public int updateImg(ImageVO img);

	public ImageVO save(MultipartFile multipartFile, int bNo);

	public String saveToFile(MultipartFile src, String id) throws IOException;

	public String getExtension(String fileName);

}
