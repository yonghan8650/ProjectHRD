package com.bswill.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bswill.domain.SalaryCriteria;
import com.bswill.domain.SalaryListVO;
import com.bswill.domain.SalaryVO;

@Repository
public class SalaryDAOImpl implements SalaryDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(SalaryDAOImpl.class);
	
	private static final String NAMESPACE = "com.bswill.mapper.SalaryMapper";

	@Override
	public List<SalaryVO> salaryListSelect() throws Exception {
		logger.debug(" salaryListSelect() -> mapper 호출");
		
		return sqlSession.selectList(NAMESPACE + ".selectSalaryList");
	}

	@Override
	public List<Map<String, Object>> salarySearchSelect(SalaryCriteria cri) throws Exception {
		logger.debug(" salarySearchSelect() -> mapper 호출");
		
		return sqlSession.selectList(NAMESPACE + ".selectSalaryEmpSearch", cri);
	}

	@Override
	public List<Map<String, Object>> salarySearchMonthlySelect(SalaryCriteria cri) throws Exception {
		logger.debug(" salarySearchMonthlySelect() -> mapper 호출");
		
		return sqlSession.selectList(NAMESPACE + ".selectSalarySearchMonthly", cri);
	}

	@Override
	public List<Map<String, Object>> salaryInfoEmpSelect(SalaryCriteria cri) throws Exception {
		logger.debug(" salaryInfoEmpSelect() -> mapper 호출");
		
		return sqlSession.selectList(NAMESPACE + ".selectSalaryInfoEmp", cri);
	}
	
	@Override
	public List<Map<String, Object>> salaryInfoMoreSelect(SalaryCriteria cri) throws Exception {
		logger.debug(" salaryInfoMoreSelect() -> mapper 호출");
		
		return sqlSession.selectList(NAMESPACE + ".selectSalaryInfoMore", cri);
	}

	@Override
	public void salaryInfoMoreUpdate(SalaryVO svo) throws Exception {
		logger.debug(" salaryInfoMoreSelect() -> mapper 호출");
		
		sqlSession.update(NAMESPACE + ".updateSalaryInfo", svo);
		
	}
	
	
	
}
