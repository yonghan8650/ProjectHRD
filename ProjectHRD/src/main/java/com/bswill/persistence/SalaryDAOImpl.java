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
	public List<Map<String, Object>> salarySeachSelect(SalaryCriteria cri) throws Exception {
		logger.debug(" salarySeachSelect() -> mapper 호출");
		
		return sqlSession.selectList(NAMESPACE + ".selectSalarySeach", cri);
	}
	
	
}
