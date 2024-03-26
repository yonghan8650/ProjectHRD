package com.bswill.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bswill.domain.OrganizationChartVO;

@Repository
public class OrganizationChartDAOImpl implements OrganizationChartDAO {

	// mapper 접근 가능한 객체 sql실행객체 주입
	@Inject
	private SqlSession sqlSession;

	private static final Logger logger = LoggerFactory.getLogger(OrganizationChartDAOImpl.class);

	private static final String NAMESPACE = "com.bswill.mapper.OrganizationChartMapper";

	@Override
	public List<OrganizationChartVO> allEmployees() throws Exception {
		logger.debug(" allEmployees() 호출 ");
		return sqlSession.selectList(NAMESPACE+".allEmployees");
	}

	@Override
	public List<OrganizationChartVO> departmentEmployees(int DEPTID) throws Exception {
		logger.debug(" departmentEmployees() 호출 ");
		return sqlSession.selectList(NAMESPACE+".departmentEmployees",DEPTID);
	}

	@Override
	public List<OrganizationChartVO> favoriteEmployees() throws Exception {
		logger.debug(" favoriteEmployees() 호출 ");
		return sqlSession.selectList(NAMESPACE+".getFavoriteEmployees");
	}

	@Override
    public void addToFavorites(int employee_id) throws Exception {
        logger.debug(" addToFavorites() 호출");
        sqlSession.insert(NAMESPACE + ".addToFavorites", employee_id);
    }

	@Override
	public void removeFromFavorites(int employee_id) throws Exception {
		logger.debug(" removeFromFavorites() 호출");
		sqlSession.update(NAMESPACE + ".removeFromFavorites", employee_id);
	}


	
	
	
}
