package com.bswill.persistence;

import java.util.List;

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
}
