package com.bswill.service;

import java.util.List;

import com.bswill.domain.BoardCri;
import com.bswill.domain.BoardVO;

public interface BoardService {
	// 글 목록 조회
	public List<BoardVO> getList() throws Exception;

	// 글 본문 조회
	public BoardVO read(int board_no) throws Exception;

	// 글 작성
	public void regist(BoardVO vo) throws Exception;

	// 글 수정
	public void modify(BoardVO vo) throws Exception;

	public void remove(int board_no) throws Exception;

	// 글 목록 조회 (Cri)
	public List<BoardVO> getListCri(BoardCri cri) throws Exception;

	// 글 총 갯수
	public int getTotal(BoardCri cri) throws Exception;

	// 글 조회수 1증가 동작
	public void updateReadcnt(int board_no) throws Exception;

}
