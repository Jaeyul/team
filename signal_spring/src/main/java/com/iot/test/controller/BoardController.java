package com.iot.test.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.iot.test.service.impl.BoardCommentServiceImpl;
import com.iot.test.service.impl.BoardHitServiceImpl;
import com.iot.test.service.impl.BoardRecommandServiceImpl;
import com.iot.test.service.impl.BoardServiceImpl;
import com.iot.test.service.impl.ImageServiceImpl;
import com.iot.test.service.impl.UserInfoServiceImpl;
import com.iot.test.vo.BoardCommentVO;
import com.iot.test.vo.BoardHitVO;
import com.iot.test.vo.BoardRecommandVO;
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

	@Autowired
	BoardCommentServiceImpl boardComentService;
	
	@Autowired
	BoardHitServiceImpl boardHitService;
	
	@Autowired
	BoardRecommandServiceImpl boardRecommandService;

	@RequestMapping
	public ModelAndView boardListPage(ModelAndView mav) {
		List<BoardVO> boardList = boardService.boardList();
		log.info("boardList={}", boardList);
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
		String uiNickName = uiv.getUiNickName();
		bv.setUiNickName(uiNickName);;
		int bNo = boardService.insertBoard(bv);
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
		mav.addObject("imageVOList", imageVOList);
		mav.setViewName("board/update");
		return mav;
	}

	@RequestMapping(value = "/updateComplete", method = RequestMethod.POST)
	public ModelAndView updateComplete(@RequestParam("filedata") List<MultipartFile> images, BoardVO bv, HttpSession hs,
			ModelAndView mav) {
		int bNo = bv.getbNo();
		List<ImageVO> imageVOList = imageService.selectByBno(bNo);
		for (ImageVO iv : imageVOList) {
			for (MultipartFile mf : images) {
				if (iv.getImgName() == mf.getName()) {
					imageVOList.remove(iv);
					images.remove(mf);
				}
			}
		}
		for (ImageVO iv : imageVOList) {
			imageService.deleteImgByImgId(iv.getImgId());
		}
		for (MultipartFile img : images) {
			ImageVO ImageVO = imageService.save(img, bNo);
			imageService.insertImg(ImageVO);
		}
		boardService.updateBoard(bv);
		List<BoardVO> boardList = boardService.boardList();
		mav.addObject("boardList", boardList);
		mav.setViewName("board/board");
		return mav;
	}

	@RequestMapping(value = "/coment", method = RequestMethod.POST)
	public void writeComent(@RequestBody BoardCommentVO bcv, HttpSession hs, ModelAndView mav) {
		UserInfoVO uiv = (UserInfoVO) hs.getAttribute("user");
		String uiNickName = uiv.getUiNickName();
		bcv.setUiNickName(uiNickName);
		boardComentService.insertComent(bcv);
	}
	
	@RequestMapping(value = "/coment/delete", method = RequestMethod.POST)
	public void deleteComent(@RequestBody BoardCommentVO bcv, HttpSession hs, ModelAndView mav) {
		UserInfoVO uiv = (UserInfoVO) hs.getAttribute("user");
		String uiNickName = uiv.getUiNickName();
		bcv.setUiNickName(uiNickName);
		boardComentService.insertComent(bcv);
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ModelAndView deleteBoard(@RequestBody int bNo, ModelAndView mav) {
		List<ImageVO> imageList = imageService.selectByBno(bNo);
		for (ImageVO image : imageList) {
			String imgId = image.getImgId();
			File imgF = new File(ImageServiceImpl.IMAGE_DIR, imgId);
			imgF.delete();
			imageService.deleteImgByBNo(bNo);
		}
		boardService.deleteBoard(bNo);
		List<BoardVO> boardList = boardService.boardList();
		mav.addObject("boardList", boardList);
		mav.setViewName("board/board");
		return mav;
	}

	@RequestMapping(value = "/post", method = RequestMethod.GET)
	public ModelAndView boardPage(@RequestParam("bNo") int bNo, ModelAndView mav, HttpSession hs) {
		BoardVO boardVO = boardService.selectByNo(bNo);
		List<ImageVO> imageVOList = imageService.selectByBno(bNo);
		UserInfoVO uiv = (UserInfoVO) hs.getAttribute("user");
		List<BoardCommentVO> comentList = boardComentService.selectComentByBNo(bNo);
		log.info("{}", boardVO);
		log.info("{}", imageVOList);
		mav.addObject("boardVO", boardVO);
		mav.addObject("imageVOList", imageVOList);
		mav.addObject("comentList", comentList);
		mav.addObject("UserInfoVO", uiv);
		if (uiv != null) {
			mav.addObject("loginUiNickName", uiv.getUiNickName());
		}
		mav.setViewName("board/post");
		return mav;
	}

	@RequestMapping("/hit")
	public void hitBoard(BoardHitVO bhv) {
		String rSessionId = bhv.gethSessionId();
		List<String> hitrSessionIdList = boardHitService.hitSessionIdList(bhv.getbNo());
		for(String sessionId : hitrSessionIdList) {
			if(rSessionId.equals(sessionId)) {
				return;
			}
		}
		boardHitService.insertHit(bhv);
		boardService.updateBoardHit(bhv.getbNo());

	}

	@RequestMapping("/recommand")
	public void recommandBoard(BoardRecommandVO brv) {
		int uiNo = brv.getUiNo();
		List<Integer> recommandUiNoList = boardRecommandService.recommandUiIdList(brv.getbNo());
		for(int rUiNo : recommandUiNoList) {
			if(uiNo==rUiNo) {
				return;
			}
		}
		boardRecommandService.insertRecommand(brv);
		boardService.updateBoardRecommand(brv.getbNo());

	}
}
