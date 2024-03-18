package com.bswill.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bswill.domain.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	// SQL실행객체 주입
	@Inject
	private SqlSession sqlSession;
	
	
	private static final Logger logger = LoggerFactory.getLogger(BoardDAOImpl.class);
	
	private static final String NAMESPACE = "com.bswill.mappers.BoardMapper";

	@Override
	public List<BoardVO> boardListSelect() throws Exception{
		logger.debug(" boardListSelect() 호출 ");
		return sqlSession.selectList(NAMESPACE+".selectBoardList");
	}

	@Override
	public BoardVO boardSelect(int board_no) throws Exception{
		logger.debug(" boardSelect() 호출 ");
		return sqlSession.selectOne(NAMESPACE+".selectBoard", board_no);
	}

	@Override
	public void boardCreate(BoardVO vo) throws Exception {
		logger.debug(" boardCreate() 호출 ");
		sqlSession.insert(NAMESPACE+".createBoard", vo);
	}

	@Override
	public void boardUpdate(BoardVO vo) throws Exception {
		logger.debug(" boardUpdate() 호출 ");
		sqlSession.update(NAMESPACE+".updateBoard", vo);
		
	}

	@Override
	public void boardDelete(int board_no) throws Exception {
		logger.debug(" boardDelete() 호출 ");
		sqlSession.delete(NAMESPACE+".deleteBoard", board_no);
		
	}
	
	
}
