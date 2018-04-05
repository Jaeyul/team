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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.iot.test.common.page.Paging;
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

	ModelAndView goBoard(ModelAndView mav, int page, int block) {
		int maxContent = boardService.selectBoardCount();
		Paging p = new Paging(maxContent);
		p.setCurrentPage(page);
		p.setCurrentBlock(block);
		List<BoardVO> boardList = boardService.boardList((page-1) * 20);
		mav.addObject("boardList", boardList);
		mav.addObject("page", p);
		mav.setViewName("board/board");
		return mav;
	}

	@RequestMapping
	public ModelAndView boardListPage(@RequestParam("page") int page, @RequestParam("block") int block,
			ModelAndView mav) {
		List<BoardVO> boardList = boardService.boardList(page);
		log.info("boardList={}", boardList);
		return goBoard(mav, page, block);
	}

	@RequestMapping("/write")
	public String writeBoard() {
		return "board/write";
	}

	@RequestMapping(value = "/complete", method = RequestMethod.POST)
	public ModelAndView uploadImage(@RequestParam("page") int page, @RequestParam("block") int block,
			@RequestParam("filedata") List<MultipartFile> images, BoardVO bv, HttpSession hs, ModelAndView mav) {
		UserInfoVO uiv = (UserInfoVO) hs.getAttribute("user");
		String uiNickName = uiv.getUiNickName();
		bv.setUiNickName(uiNickName);
		int bNo = boardService.insertBoard(bv);
		log.info("/complete bNo={}", bNo);
		for (MultipartFile img : images) {
			ImageVO ImageVO = imageService.save(img, bNo);
			imageService.insertImg(ImageVO);
		}
		return goBoard(mav, page, block);
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView updateBoard(int bNo, ModelAndView mav) {
		List<ImageVO> imageVOList = imageService.selectByBno(bNo);
		mav.addObject("imageVOList", imageVOList);
		mav.setViewName("board/update");
		return mav;
	}

	@RequestMapping(value = "/update/complete", method = RequestMethod.POST)
	public ModelAndView updateComplete(@RequestParam("page") int page, @RequestParam("block") int block,
			@RequestParam("filedata") List<MultipartFile> images, BoardVO bv, HttpSession hs, ModelAndView mav) {
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
		return goBoard(mav, page, block);
	}

	@RequestMapping(value = "/comment", method = RequestMethod.POST)
	public @ResponseBody void writeComent(@RequestBody BoardCommentVO bcv, HttpSession hs, ModelAndView mav) {
		log.info("BoardCommentVO={}", bcv);
		boardComentService.insertComent(bcv);
		boardService.updateBoardCCP(bcv.getbNo());
	}

	@RequestMapping(value = "/comment/delete", method = RequestMethod.POST)
	public @ResponseBody void deleteComent(@RequestBody BoardCommentVO bcv) {
		int bcNo = bcv.getBcNo();
		boardComentService.deleteComent(bcNo);
		boardService.updateBoardCCM(bcv.getbNo());
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public @ResponseBody void deleteBoard(@RequestBody BoardVO bv, ModelAndView mav) {
		int bNo = bv.getbNo();
		List<ImageVO> imageList = imageService.selectByBno(bNo);
		for (ImageVO image : imageList) {
			String imgId = image.getImgId();
			File imgF = new File(ImageServiceImpl.IMAGE_DIR, imgId);
			imgF.delete();
		}
		boardService.deleteBoard(bNo);
	}

	@RequestMapping(value = "/post", method = RequestMethod.GET)
	public ModelAndView boardPage(@RequestParam int bNo, String hSessionId, ModelAndView mav, HttpSession hs) {
		log.info("hSessionId{}", hSessionId);
		// session 확인후 조회수 증가
		List<String> hitrSessionIdList = boardHitService.hitSessionIdList(bNo);
		boolean isSessionId = false;
		if (hitrSessionIdList != null) {
			for (String sessionId : hitrSessionIdList) {
				if (hSessionId.equals(sessionId)) {
					isSessionId = true;
				}
			}
		}
		if (!isSessionId) {
			BoardHitVO bhv = new BoardHitVO();
			bhv.setbNo(bNo);
			bhv.sethSessionId(hSessionId);
			boardHitService.insertHit(bhv);
			boardService.updateBoardHit(bNo);
		}

		BoardVO boardVO = boardService.selectByNo(bNo);
		List<ImageVO> imageVOList = imageService.selectByBno(bNo);
		UserInfoVO uiv = (UserInfoVO) hs.getAttribute("user");
		List<BoardCommentVO> comentList = boardComentService.selectComentByBNo(bNo);
		log.info("boardVO{}", boardVO);
		log.info("imageVOList{}", imageVOList);
		mav.addObject("boardVO", boardVO);
		mav.addObject("imageVOList", imageVOList);
		mav.addObject("comentList", comentList);
		if (uiv != null) {
			mav.addObject("loginUserInfoVO", uiv);
		}
		mav.setViewName("board/post");
		return mav;
	}

	@RequestMapping("/recommand")
	public @ResponseBody void recommandBoard(@RequestBody BoardRecommandVO brv) {
		int uiNo = brv.getUiNo();
		List<Integer> recommandUiNoList = boardRecommandService.recommandUiIdList(brv.getbNo());
		for (int rUiNo : recommandUiNoList) {
			if (uiNo == rUiNo) {
				return;
			}
		}
		boardRecommandService.insertRecommand(brv);
		boardService.updateBoardRecommand(brv.getbNo());

	}
}
