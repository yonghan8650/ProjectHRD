package com.bswill.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bswill.domain.NotificationVO;

@Repository
public class NotificationDAOImpl implements NotificationDAO{
    
	@Inject
	private SqlSession sqlSession;
	
	private static final String selectNoti = "NotificationMapper.selectNoti";

	@Override
	public NotificationVO selectNoti(int employee_id) {

		return (NotificationVO)sqlSession.selectOne(selectNoti,employee_id);
	}
	

}
