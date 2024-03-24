package com.bswill.persistence;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository
public class CommonDAOImpl implements CommonDAO{
	@Inject
	private SqlSession sqlSession;

	private static final Logger logger = LoggerFactory.getLogger(BoardDAOImpl.class);

	private static final String NAMESPACE = "com.bswill.mappers.CommonMapper";

	@Override
	public String passwdSelect(int employee_id) throws Exception {
		logger.debug(" passwdSelect(int employee_id) 호출 ");
		return sqlSession.selectOne(NAMESPACE+".selectPass", employee_id);
	}

	@Override
	public void passwdUpdate(Map<String, Object> loginInfo) throws Exception {
		logger.debug(" passwdUpdate(int employee_id, String newPw) 호출 ");
		sqlSession.update(NAMESPACE+".updatePass", loginInfo);
	}
	
	
}
