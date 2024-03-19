package com.bswill.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bswill.domain.BoardCri;
import com.bswill.domain.BoardVO;
import com.bswill.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{
	@Inject
	private BoardDAO bdao;
	
	
	private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);


	@Override
	public List<BoardVO> getList() throws Exception {
		logger.debug(" S : getList()실행 ");
		return bdao.boardListSelect();
	}


	@Override
	public BoardVO read(int board_no) throws Exception {
		logger.debug(" S : read()실행 ");
		return bdao.boardSelect(board_no);
	}


	@Override
	public void regist(BoardVO vo) throws Exception {
		logger.debug(" S : regist() 실행 ");
		bdao.boardCreate(vo);
	}


	@Override
	public void modify(BoardVO vo) throws Exception {
		logger.debug(" S : modify()　실행 ");
		bdao.boardUpdate(vo);
		
	}


	@Override
	public void remove(int board_no) throws Exception {
		logger.debug(" S : remove() 실행 ");
		bdao.boardDelete(board_no);
		
	}


	@Override
	public List<BoardVO> getListCri(BoardCri cri) throws Exception {
		logger.debug(" S : getListCri(BoardCri cri) 호출 ");
		return bdao.boardListCriSelect(cri);
	}


	@Override
	public int getTotal() throws Exception {
		
		return bdao.getTotal();
	}


	@Override
	public void updateReadcnt(int board_no) throws Exception {
		logger.debug(" S : updateReadcnt(int board_no) 실행 ");
		
		bdao.boardReadcntUpdate(board_no);
	}
	
	
	
	
	
	
}
