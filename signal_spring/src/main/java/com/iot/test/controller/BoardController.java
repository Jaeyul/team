package com.iot.test.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.iot.test.common.mybatis.ImageView;
import com.iot.test.mapper.BoardMapper;
import com.iot.test.service.ImageService;
import com.iot.test.vo.BoardVO;
import com.iot.test.vo.ImageVO;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Resource(name = "imageView")
	ImageView imageView;

	@Autowired
	BoardMapper bm;

	@Autowired
	ImageService imageService;

	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String boardPage() {

		return "board/board";
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writeBoard(@RequestBody BoardVO bv) {
		bm.insertBoard(bv);
		return "board/board";
	}

	@RequestMapping(value = "/imgupload", method = RequestMethod.POST)
	public String uploadImage(@RequestParam MultipartFile img, ModelMap modelMap) {
		ImageVO fileInfo = imageService.save(img);

		modelMap.put("imageFile", fileInfo);

		return "board/uploadComplete";
	}

	@RequestMapping(value = "/image/{imgId}", method = RequestMethod.POST)
	public String imagePage(@PathVariable String imageId, ModelMap modelMap) {
//mapper 써서 받아올거임		
//		ImageVO ImageVO = imageService.get(imageId);
//		modelMap.put("ImageVO", ImageVO);

		return "board/board";
	}
}
