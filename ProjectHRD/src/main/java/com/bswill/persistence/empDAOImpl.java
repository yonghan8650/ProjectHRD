package com.bswill.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bswill.domain.empVO;

@Repository
public class empDAOImpl implements empDAO {

	private static final Logger logger = LoggerFactory.getLogger(empDAO.class);

	private static final String NAMESPACE = "com.bswill.mapper.EmpMapper";

	@Inject
	private SqlSession sqlSession;

	@Override
	public void insertEmp(empVO evo) throws Exception {
		logger.debug("insertEmp(empVO evo) 실행");

		sqlSession.insert(NAMESPACE + ".insertEmp", evo);

		logger.debug("success insertEmp");
	}

}
