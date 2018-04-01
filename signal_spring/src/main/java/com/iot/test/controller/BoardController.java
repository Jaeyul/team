package com.iot.test.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.iot.test.service.impl.BoardServiceImpl;
import com.iot.test.service.impl.ImageServiceImpl;
import com.iot.test.service.impl.UserInfoServiceImpl;
import com.iot.test.vo.BoardVO;
import com.iot.test.vo.ImageVO;
import com.iot.test.vo.UserInfoVO;

@Controller
@RequestMapping("/board")
public class BoardController {

	private static final Logger log = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	ImageServiceImpl imageService;

	@Autowired
	BoardServiceImpl boardService;

	@Autowired
	UserInfoServiceImpl userService;

	@RequestMapping
	public ModelAndView boardListPage(ModelAndView mav) {
		List<BoardVO> boardList = boardService.boardList();
		mav.addObject("boardList", boardList);
		mav.setViewName("board/board");
		return mav;
	}

	@RequestMapping("/write")
	public String writeBoard() {
		return "board/write";
	}

	@RequestMapping(value = "/complete", method = RequestMethod.POST)
	public ModelAndView uploadImage(@RequestParam("filedata") List<MultipartFile> images, BoardVO bv, HttpSession hs,
			ModelAndView mav) {
		UserInfoVO uiv = (UserInfoVO) hs.getAttribute("user");
		String uiName = uiv.getUiId();
		bv.setUiId(uiName);
		Integer bNo = boardService.insertBoard(bv);
		for (MultipartFile img : images) {
			ImageVO ImageVO = imageService.save(img, bNo);
			imageService.insertImg(ImageVO);
		}
		List<BoardVO> boardList = boardService.boardList();
		mav.addObject("boardList", boardList);
		mav.setViewName("board/board");
		return mav;
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView updateBoard(int bNo, ModelAndView mav) {
		List<ImageVO> imageVOList = imageService.selectByBno(bNo);
		mav.addObject("imageVOList",imageVOList);
		mav.setViewName("board/update");
		return mav;
	}
	@RequestMapping(value = "/updateComplete", method = RequestMethod.POST)
	public ModelAndView updateComplete(@RequestParam("filedata") List<MultipartFile> images, BoardVO bv, HttpSession hs,
			ModelAndView mav) {
		int bNo = bv.getbNo();
		List<ImageVO> imageVOList = imageService.selectByBno(bNo);
		List<BoardVO> boardList = boardService.boardList();
		mav.addObject("boardList", boardList);
		mav.setViewName("board/board");
		return mav;
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ModelAndView deleteBoard(@RequestBody ImageVO iv, ModelAndView mav) {
		int bNo = iv.getbNo();
		String imgId = iv.getImgId();
		log.info("{} {}", bNo, imgId);
		boardService.deleteBoard(bNo);
		File imgF = new File(ImageServiceImpl.IMAGE_DIR, imgId);
		imgF.delete();
		imageService.deleteImg(bNo);
		List<BoardVO> boardList = boardService.boardList();
		mav.addObject("boardList", boardList);
		mav.setViewName("board/board");
		return mav;
	}

	@RequestMapping(value = "/post", method = RequestMethod.GET)
	public ModelAndView boardPage(@RequestParam("bNo") Integer bNo, ModelAndView mav, HttpSession hs) {
		BoardVO boardVO = boardService.selectByNo(bNo);
		List<ImageVO> imageVOList = imageService.selectByBno(bNo);
		UserInfoVO uiv = (UserInfoVO) hs.getAttribute("user");
		log.info("{}", boardVO);
		log.info("{}", imageVOList);
		mav.addObject("boardVO", boardVO);
		mav.addObject("imageVOList", imageVOList);
		if (uiv != null) {
			mav.addObject("loginUiId", uiv.getUiId());
		}
		mav.setViewName("board/post");
		return mav;
	}
}
