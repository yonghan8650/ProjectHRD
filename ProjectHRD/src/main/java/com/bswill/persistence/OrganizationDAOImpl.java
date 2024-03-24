package com.bswill.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bswill.domain.OrganizationChartVO;

@Repository
public class OrganizationDAOImpl implements OrganizationDAO {

	// mapper 접근 가능한 객체 sql실행객체 주입
	@Inject
	private SqlSession sqlSession;

	private static final Logger logger = LoggerFactory.getLogger(OrganizationDAOImpl.class);

	private static final String NAMESPACE = "com.bswill.mapper.OrganizationMapper";

	@Override
	public List<OrganizationChartVO> organizationListSelect() throws Exception{
		logger.debug(" organizationListSelect() 호출");

		return sqlSession.selectList(NAMESPACE + ".orgList");
	}

}
