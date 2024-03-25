package com.bswill.persistence;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		return sqlSession.selectList(NAMESPACE+".notiListSelect", employee_id);
	}
	
	@Override
    public int notificationCount(int employee_id) throws Exception {
        logger.debug(" notificationCount(int employee_id) 호출");
        Integer count = sqlSession.selectOne(NAMESPACE + ".notiCount", employee_id);
        return count != null ? count : 0; // null일 경우 0으로 처리
    }

	@Override
	public void readNoti(int employee_id, String noti_title, Timestamp noti_time) throws Exception {
	    logger.debug("readNoti(int employee_id, String noti_title, Timestamp noti_time) 호출 ");

	    // 매개변수를 Map에 담아서 넘겨줌
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("employee_id", employee_id);
	    paramMap.put("noti_title", noti_title);
	    paramMap.put("noti_time", noti_time);

	    sqlSession.update(NAMESPACE + ".readNoti", paramMap);
	}
	
	
	@Override
	public void readAllNoti(int employee_id) throws Exception {
		logger.debug(" readAllNoti(int employee_id) 호출 ");
		sqlSession.update(NAMESPACE+".readAllNoti", employee_id);
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

	@Override
	public void link(String noti_link) throws Exception {
		logger.debug(" link(String link) 호출 ");
		sqlSession.update(NAMESPACE+".link");
	}

	@Override
	public void markAsRead(String noti_Link) throws Exception {
		logger.debug(" markAsRead(String noti_Link) 호출 ");
		 sqlSession.update(NAMESPACE + ".markAsRead", noti_Link);
		
	}

	
}
