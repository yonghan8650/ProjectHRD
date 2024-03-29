package com.bswill.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bswill.domain.SalaryCri;
import com.bswill.domain.SalarylistVO;
import com.bswill.domain.SalaryVO;

@Repository
public class SalaryDAOImpl implements SalaryDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(SalaryDAOImpl.class);
	
	private static final String NAMESPACE = "com.bswill.mapper.SalaryMapper";

	@Override
	public List<Map<String, Object>> salarySearchEmpSelect(SalaryCri cri) throws Exception {
		logger.debug(" salarySearchEmpSelect() -> mapper 호출");
		
		return sqlSession.selectList(NAMESPACE + ".selectSalarySearchEmp", cri);
	}
	
	@Override
	public List<Map<String, Object>> salarySearchMeSelect(SalaryCri cri, Integer emp_id) throws Exception {
		logger.debug(" salarySearchEmpSelect() -> mapper 호출");
		
		cri.setEmployee_id(Integer.toString(emp_id));
		
		return sqlSession.selectList(NAMESPACE + ".selectSalarySearchMe", cri);
	}
	
	@Override
	public List<Map<String, Object>> salarySearchMoreSelect(SalaryCri cri) throws Exception {
		logger.debug(" salarySearchMoreSelect() -> mapper 호출");
		
		return sqlSession.selectList(NAMESPACE + ".selectSalarySearchMore", cri);
	}

	@Override
	public List<Map<String, Object>> salaryInfoEmpSelect(SalaryCri cri) throws Exception {
		logger.debug(" salaryInfoEmpSelect() -> mapper 호출");
		
		return sqlSession.selectList(NAMESPACE + ".selectSalaryInfoEmp", cri);
	}
	
	@Override
	public List<Map<String, Object>> salaryInfoMoreSelect(SalaryCri cri) throws Exception {
		logger.debug(" salaryInfoMoreSelect() -> mapper 호출");
		
		return sqlSession.selectList(NAMESPACE + ".selectSalaryInfoMore", cri);
	}
	
	@Override
	public List<Map<String, Object>> salaryInfoNewSelect(SalaryCri cri) throws Exception {
		logger.debug(" salaryInfoMoreSelect() -> mapper 호출");
		
		return sqlSession.selectList(NAMESPACE + ".selectSalaryInfoNew", cri);
	}

	@Override
	public void salaryInfoMoreUpdate(SalaryVO svo) throws Exception {
		logger.debug(" salaryInfoMoreSelect() -> mapper 호출");
		
		sqlSession.update(NAMESPACE + ".updateSalaryInfo", svo);
	}

	@Override
	public List<Map<String, Object>> salaryEnterEmpSelect(SalaryCri cri) throws Exception {
		logger.debug(" salaryEnterEmpSelect() -> mapper 호출");
		
		return sqlSession.selectList(NAMESPACE + ".selectSalaryEnterEmp", cri);
	}

	@Override
	public List<Map<String, Object>> salaryEnterMoreSelect(SalaryCri cri) throws Exception {
		logger.debug(" salaryEnterMoreSelect() -> mapper 호출");
		
		return sqlSession.selectList(NAMESPACE + ".selectSalaryEnterMore", cri);
	}
	
	@Override
	public List<Map<String, Object>> salaryEnterSelect(SalaryCri cri) throws Exception {
		logger.debug(" salaryEnterSelect() -> mapper 호출");
		
		return sqlSession.selectList(NAMESPACE + ".selectSalaryEnter", cri);
	}
	
	@Override
	public void salaryEnterInsert(SalarylistVO slvo) throws Exception {
		logger.debug(" salaryEnterInsert() -> mapper 호출");
		
		sqlSession.insert(NAMESPACE + ".insertSalaryEnter", slvo);
	}
}
