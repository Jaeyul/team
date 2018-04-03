package com.iot.test.service.impl;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.iot.test.mapper.ImgMapper;
import com.iot.test.service.ImageService;
import com.iot.test.vo.ImageVO;

@Service
public class ImageServiceImpl implements ImageService {
	@Autowired
	ImgMapper im;

	public static final String IMAGE_DIR = "src/main/resources/static/web/upload_images\\";

	@Override
	public List<ImageVO> ImgList() {

		return im.ImgList();
	}

	@Override
	public List<ImageVO> selectByBno(int bNo) {

		return im.selectByBno(bNo);
	}

	@Override
	public int insertImg(ImageVO img) {

		return im.insertImg(img);
	}

	@Override
	public int deleteImgByBNo(int bNo) {

		return im.deleteImgByBNo(bNo);
	}
	

	public int deleteImgByImgId(String imgId) {
		return im.deleteImgByImgId(imgId);
	}

	@Override
	public int updateImg(ImageVO img) {

		return im.updateImg(img);
	}

	/**
	 * Multipart File을 파일로 저장하고 DB(를 빙자한 맵)에 업로드 파일 정보 저장, 실패하는 경우 null리
	 */
	public ImageVO save(MultipartFile multipartFile, int bNo) {
		// UUID로 유일할 것 같은 값 생성.. 낮은 확률로 중복 가능성이 있음
		String genId = UUID.randomUUID().toString();
		String imgId = null;
		try {
			imgId = saveToFile(multipartFile, genId);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ImageVO iv = new ImageVO();
		iv.setImgId(imgId);
		iv.setImgType(multipartFile.getContentType());
		iv.setImgSize((int) multipartFile.getSize());
		iv.setImgName(multipartFile.getOriginalFilename());
		iv.setbNo(bNo);
		return iv;

	}

	/**
	 * Multipart File의 내용을 파일로 저장, 저장 후 저장된 파일 이름을 반환
	 */
	public String saveToFile(MultipartFile src, String id) throws IOException {
		String fileName = src.getOriginalFilename();
		byte[] bytes = src.getBytes();
		String saveFileName = id + "." + getExtension(fileName);
		String savePath = IMAGE_DIR + saveFileName;

		/* 파일 쓰기 */
		BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(savePath));
		bos.write(bytes);
		bos.flush();
		bos.close();
		return saveFileName;
	}

	/**
	 * 파일이름으로부터 확장자를 반환하는 메서드 파일이름에 확장자 구분을 위한 . 문자가 없거나. 가장 끝에 있는 경우는 빈문자열 ""을 리턴
	 */
	public String getExtension(String fileName) {
		int dotPosition = fileName.lastIndexOf('.');

		if (-1 != dotPosition && fileName.length() - 1 > dotPosition) {
			return fileName.substring(dotPosition + 1);
		} else {
			return "";
		}
	}

}
