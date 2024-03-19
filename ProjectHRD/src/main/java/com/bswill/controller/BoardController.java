package com.bswill.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bswill.controller.BoardController;
import com.bswill.domain.BoardCri;
import com.bswill.domain.BoardVO;
import com.bswill.service.BoardService;

@Controller
@RequestMapping(value = "/board/*")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private BoardService bService;

	// http://localhost:8088/board/list
//	@GetMapping(value = "/list")
//	public void ListGET(Model model, HttpSession session) throws Exception {
//		logger.debug(" listGET() 호출 ");
//		logger.debug(" /board/list.jsp 뷰페이지 연결 ");
//		List<BoardVO> boardList = bService.getList();
//		model.addAttribute("boardList", boardList);
//	}

	// 글 읽기
	@GetMapping(value = "/read")
	public void readGET(@RequestParam("board_no") int board_no, Model model, HttpSession session) throws Exception {
		logger.debug(" readGET() 호출 ");
		
		int status = (Integer)session.getAttribute("readUpdateStatus");
		
		if(status == 1) {
			// 서비스 -> DAO 게시판 글 조회수 1증가
			bService.updateReadcnt(board_no);
			// 조회수 상태 0 : 조회수 증가X   , 1 : 조회수 증가 O
			session.setAttribute("readUpdateStatus", 0);
		}
		
		BoardVO vo = bService.read(board_no);
		logger.debug("board_no : " + board_no);
		logger.debug("vo : " + vo);
		model.addAttribute("vo", vo);
	}

	// 글 작성 페이지 이동 (GET)
	@GetMapping(value = "/register")
	public void registerGET() throws Exception {
		logger.debug(" registerGET() 호출 ");
		logger.debug(" /board/register 뷰페이지 연결 ");
	}

	// 글 작성(POST)
	@PostMapping(value = "/register")
	public String registerPOST(BoardVO vo) throws Exception {
		logger.debug(" registerPOST() 호출 ");
		logger.debug(" 전달정보 : " + vo);
		bService.regist(vo);
		logger.debug(" 글쓰기 완료 ");
		logger.debug(" 리스트페이지로 이동 ");

		return "redirect:/board/list";
	}

	// 본문 수정(GET) : /board/modify?bno=000
	@GetMapping(value = "/modify")
	public void modifyGET(@RequestParam("board_no") int board_no, Model model) throws Exception {
		logger.debug(" /board/modify -> modifyGET() 호출 ");

		// 전달받은 정보 (bno) 저장
		logger.debug("board_no : " + board_no);
		// BoardVO vo = bService.read(board_no);
		// 연결된 뷰페이지에 전달(Model)
		model.addAttribute(bService.read(board_no));
		// 연결된 뷰페이지 (/board/modify.jsp);
	}

	// 본문 수정(POST) : /board/modify
	@PostMapping(value = "/modify")
	public String modifyPOST(BoardVO vo) throws Exception {
		logger.debug("/board/modify -> modifyPOST() 호출 ");

		// 전달 정보 저장(bno, title, writer, content)
		logger.debug("vo : " + vo);
		// 서비스 -> DAO 게시판 글 정보 수정
		bService.modify(vo);
		// 수정완료후에 list페이지로 이동(redirect)

		return "redirect:/board/list";
	}

	// 본문 삭제(POST) : /board/remove +(post)bno=000
	@PostMapping(value = "/remove")
	public String deletePOST(@RequestParam("board_no") int board_no) throws Exception {
		logger.debug(" /board/remove -> removePOST() 호출 ");

		// 전달 정보 저장
		logger.debug("board_no : " + board_no);

		// 서비스 -> DAO 게시판 글 삭제
		bService.remove(board_no);

		// 삭제후 list 페이지로 이동
		return "redirect:/board/list";
	}

	@GetMapping(value = "/list")
	public void ListCriGET(Model model, HttpSession session, BoardCri cri) throws Exception {
		logger.debug(" /board/listCri -> ListCriGET() 호출 ");
		logger.debug(" /board/listCri.jsp 연결");

		List<BoardVO> boardList = bService.getListCri(cri); // 페이징
		logger.debug(" list.size : " + boardList.size());
		// 연결된 뷰페이지에 정보 전달(Model)
		model.addAttribute("boardList", boardList);
		int total = bService.getTotal();
		PageMakerDTO pageMaker = new PageMakerDTO(cri,total);
//		model.addAttribute("cri", cri);
		model.addAttribute("pageMaker",pageMaker);

		session.setAttribute("readUpdateStatus", 1);
	}

}
