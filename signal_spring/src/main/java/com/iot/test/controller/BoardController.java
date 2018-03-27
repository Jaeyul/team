package com.iot.test.controller;

import java.util.List;

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
	public String uploadImage(@RequestParam("imgFile") MultipartFile img, BoardVO bv, HttpSession hs) {
		UserInfoVO uiv = (UserInfoVO) hs.getAttribute("user");
		String uiName = uiv.getUiId();
		bv.setUiId(uiName);
		Integer bNo = boardService.insertBoard(bv);
		ImageVO ImageVO = imageService.save(img, bNo);
		imageService.insertImg(ImageVO);
		return "board/board";
	}

	@RequestMapping(value = "/post", method = RequestMethod.GET)
	public String boardPage(@RequestParam("bNo") int bNo, Model model) {
		BoardVO boardVO = boardService.selectByNo(bNo);
		ImageVO imageVO = imageService.selectByBno(bNo);
		System.out.println(boardVO);
		System.out.println(imageVO);
		log.info("{}", boardVO);
		log.info("{}", imageVO);
		model.addAttribute("boardVO", boardVO);
		model.addAttribute("imageVO", imageVO);

		return "board/post";
	}
}
