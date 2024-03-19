package com.bswill.persistence;

import java.util.List;

import com.bswill.domain.BoardCri;
import com.bswill.domain.BoardVO;

public interface BoardDAO {
	// 글 목록 조회
	public List<BoardVO> boardListSelect() throws Exception;
	
	// 글 조회
	public BoardVO boardSelect(int board_no) throws Exception;
	
	// 글 작성
	public void boardCreate(BoardVO vo) throws Exception;
	
	// 글 수정
	public void boardUpdate(BoardVO vo) throws Exception;
	
	// 글 삭제
	public void boardDelete(int board_no) throws Exception;
	
	// 글 목록 조회 (Cri)
	public List<BoardVO> boardListCriSelect(BoardCri cri) throws Exception;
	
	// 전체 글 갯수
	public int getTotal() throws Exception;
	
	// 글 조회수 증가
	public void boardReadcntUpdate(int board_no) throws Exception;
}
