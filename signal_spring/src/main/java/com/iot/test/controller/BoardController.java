package com.iot.test.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.iot.test.common.mybatis.ImageView;
import com.iot.test.mapper.BoardMapper;
import com.iot.test.mapper.ImgMapper;
import com.iot.test.service.impl.ImageService;
import com.iot.test.vo.BoardVO;
import com.iot.test.vo.ImageVO;
import com.iot.test.vo.UserInfoVO;

@Controller
@RequestMapping("/board")
public class BoardController {

	private static final Logger log = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	ImageView imageView;

	@Autowired
	BoardMapper bm;
	
	@Autowired
	ImgMapper im;
	
	@Autowired
	ImageService imageService;

	@RequestMapping
	public String boardListPage() {

		return "board/board";
	}

	@RequestMapping("/write")
	public String writeBoard() {
		return "board/write";
	}

	@RequestMapping(value = "/complete", method = RequestMethod.POST)
	public String uploadImage(@RequestParam("imgFile") MultipartFile img, BoardVO bv, HttpSession hs) {
		UserInfoVO uiv = (UserInfoVO) hs.getAttribute("user");
		Integer uiNo = uiv.getUiNo();
		bv.setUiNo(uiNo);
		Integer bNo = bm.insertBoard(bv);
		ImageVO ImageVO = imageService.save(img, bNo);
		im.insertImg(ImageVO);
		log.info("ImageVO = {}", bNo);
		return "board/board";
	}

	@RequestMapping(value = "/post", method = RequestMethod.GET)
	public String boardPage(Model model) {
		int bNo = 15;
		BoardVO boardVO = bm.selectByNo(bNo);
		ImageVO imageVO = im.selectByBno(bNo);
		System.out.println(boardVO);
		System.out.println(imageVO);
		log.info("[]", boardVO);
		log.info("[]", imageVO);
		model.addAttribute("boardVO", boardVO);
		model.addAttribute("imageVO", imageVO);

		return "board/post";
	}
}
