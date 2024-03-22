package com.bswill.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository
public class AuthDAOImpl implements AuthDAO {

	private static final Logger logger = LoggerFactory.getLogger(AuthDAOImpl.class);

	@Inject
	SqlSession sqlSession;

}
