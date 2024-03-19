package com.bswill.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bswill.domain.EmployeeVO;

@Repository
public class empDAOImpl implements empDAO {

	private static final Logger logger = LoggerFactory.getLogger(empDAO.class);

	private static final String NAMESPACE = "com.bswill.mapper.EmpMapper";

	@Inject
	private SqlSession sqlSession;

	@Override
	public void insertEmp(EmployeeVO evo) throws Exception {
		logger.debug("insertEmp(empVO evo) 실행");

		sqlSession.insert(NAMESPACE + ".insertEmp", evo);

		logger.debug("success insertEmp");
	}

	@Override
	public List<Map<String, Object>> selectEmpList() throws Exception {
		logger.debug("selectEmpList() 호출");

		return sqlSession.selectList(NAMESPACE + ".selectEmpList");
	}

	@Override
	public Map<String, Object> selectEmp(Integer employee_id) throws Exception {
		logger.debug("selectEmp(Integer employee_id) 호출");

		return sqlSession.selectOne(NAMESPACE + ".selectEmp", employee_id);
	}

}
