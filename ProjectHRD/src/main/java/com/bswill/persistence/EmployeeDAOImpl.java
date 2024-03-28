package com.bswill.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bswill.domain.EmployeeVO;
import com.bswill.domain.NotificationVO;

@Repository
public class EmployeeDAOImpl implements EmployeeDAO {

	private static final Logger logger = LoggerFactory.getLogger(EmployeeDAO.class);

	private static final String NAMESPACE = "com.bswill.mapper.EmployeeMapper";

	@Inject
	private SqlSession sqlSession;

	@Override
	public int selectEmpCount(String year) throws Exception {
		logger.debug("selectEmpNo() 호출");

		return sqlSession.selectOne(NAMESPACE + ".selectEmpCount", year);
	}

	@Override
	public void insertEmp(EmployeeVO evo) throws Exception {
		logger.debug("insertEmp(empVO evo) 호출");

		sqlSession.insert(NAMESPACE + ".insertEmp", evo);

		logger.debug("success insertEmp");
	}

	@Override
	public List<Map<String, Object>> selectEmpList(String searchType, String keyword) throws Exception {
		logger.debug("selectEmpList() 호출");

		Map<String, Object> paramMap = new HashMap<>();

		paramMap.put("searchType", searchType);
		paramMap.put("keyword", keyword);

		return sqlSession.selectList(NAMESPACE + ".selectEmpList", paramMap);
	}

	@Override
	public Map<String, Object> selectEmp(Integer employee_id) throws Exception {
		logger.debug("selectEmp(Integer employee_id) 호출");

		return sqlSession.selectOne(NAMESPACE + ".selectEmp", employee_id);
	}

	@Override
	public void insertNotiEmp(NotificationVO nvo) throws Exception {
		logger.debug("insertNotiEventAuth(NotificationVO nvo) 호출");

		sqlSession.insert(NAMESPACE + ".insertNotiEmpAuth", nvo);
	}

	@Override
	public void updateEmpTelAndEmail(Integer employee_id, String emp_tel, String emp_mail) throws Exception {
		logger.debug("updateEmpTelAndEmail(Integer employee_id, String emp_tel, String emp_mail) 호출");

		Map<String, Object> paramMap = new HashMap<>();

		paramMap.put("employee_id", employee_id);
		paramMap.put("emp_tel", emp_tel);
		paramMap.put("emp_mail", emp_mail);

		sqlSession.update(NAMESPACE + ".updateEmpTelAndEmail", paramMap);
	}

	@Override
	public void updateEmp(EmployeeVO evo) throws Exception {
		logger.debug("updateEmp(Integer employee_id) 호출");

		sqlSession.update(NAMESPACE + ".updateEmp", evo);
	}

	@Override
	public int empListCount(String searchType, String keyword) throws Exception {
		logger.debug("empListCount() 호출");

		Map<String, Object> paramMap = new HashMap<>();

		paramMap.put("searchType", searchType);
		paramMap.put("keyword", keyword);

		return sqlSession.selectOne(NAMESPACE + ".totalCountEmpList", paramMap);
	}

}
