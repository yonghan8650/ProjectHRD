package com.bswill.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bswill.domain.DepartmentVO;
import com.bswill.domain.EmployeeVO;
import com.bswill.domain.JobVO;

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

	@Override
	public EmployeeVO EmpInfoSelect(int employee_id) throws Exception {
		logger.debug(" EmpInfoSelect(int employee_id) 호출 ");
		
		return sqlSession.selectOne(NAMESPACE+".selectEmpInfo", employee_id);
	}

	@Override
	public int currentEmpCountSelect() throws Exception {
		logger.debug(" currentEmpCountSelect() 호출 ");
		return sqlSession.selectOne(NAMESPACE+".selectCurrentEmpCnt");
	}

	@Override
	public List<DepartmentVO> deptInfoSelect() throws Exception {
		logger.debug(" deptInfoSelect() 호출 ");
		return sqlSession.selectList(NAMESPACE+".selectDeptInfo");
	}

	@Override
	public List<JobVO> jobInfoSelect() throws Exception {
		logger.debug(" jobInfoSelect() ");
		return sqlSession.selectList(NAMESPACE+".selectJobInfo");
	}
	
	@Override
	public int restEmpCountSelect() throws Exception {
		logger.debug(" restEmpCountSelect() 호출 ");
		return sqlSession.selectOne(NAMESPACE+".selectRestEmpCnt");
	}
	
	
	
}
