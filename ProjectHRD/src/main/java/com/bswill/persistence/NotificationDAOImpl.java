package com.bswill.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bswill.domain.NotificationVO;

@Repository
public class NotificationDAOImpl implements NotificationDAO{

	// mapper 접근 가능한 객체 sql실행객체 주입
	@Inject
	private SqlSession sqlSession;
	
	
	private static final Logger logger = LoggerFactory.getLogger(NotificationDAOImpl.class);
	
	private static final String NAMESPACE = "com.bswill.mapper.NotificationMapper";
	
	


	@Override
	public List<NotificationVO> notiListSelect(int employee_id) throws Exception{
		logger.debug(" notiListSelect() 호출");
		return sqlSession.selectList(NAMESPACE+".notiListSelect");
	}
	
	@Override
	public int notificationCount(int employee_id) throws Exception {
		logger.debug(" notificationCount(int employee_id) 호출");
		return sqlSession.selectOne(NAMESPACE+".notiCount");
	}

	@Override
	public void readNoti(int employee_id) throws Exception{
		logger.debug(" readNoti(int employee_id) 호출 ");
		
		sqlSession.update(NAMESPACE+".readNoti",employee_id);
		
	}

	@Override
	public void deleteNoti(int employee_id)throws Exception {
		logger.debug(" deleteNoti(int employee_id) ");
		sqlSession.delete(NAMESPACE+".deleteNoti",employee_id);
	}

	@Override
	public void sendNoti(NotificationVO vo)throws Exception {
		logger.debug(" sendNoti(NotificationVO vo) 호출 ");
		sqlSession.insert(NAMESPACE+".sendNoti",vo);
		
	}



	@Override
	public void deleteAllNoti() throws Exception{
		logger.debug(" deleteAllNoti() 호출 ");
		sqlSession.delete(NAMESPACE+".deleteAllNoti");
	}

}
