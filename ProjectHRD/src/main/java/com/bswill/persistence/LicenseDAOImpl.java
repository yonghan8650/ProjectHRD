package com.bswill.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bswill.domain.LicenseVO;

@Repository
public class LicenseDAOImpl implements LicenseDAO {

	private static final Logger logger = LoggerFactory.getLogger(LicenseDAOImpl.class);

	private static final String NAMESPACE = "com.bswill.mapper.LicenseMapper";

	@Inject
	SqlSession sqlSession;

	@Override
	public void insertLicense(LicenseVO lvo) throws Exception {
		logger.debug("insertLicense(Integer employee_id) 호출");

		sqlSession.insert(NAMESPACE + ".insertLicense", lvo);
	}

	@Override
	public List<LicenseVO> selectEmpLicense(Integer employee_id) throws Exception {
		logger.debug("selectEmpLicense(Integer employee_id) 호출");

		return sqlSession.selectList(NAMESPACE + ".selectEmpLicense", employee_id);
	}

	@Override
	public void insertEmpLicense(LicenseVO lvo) throws Exception {
		logger.debug("insertEmpLicense(LicenseVO lvo) 호출");

		sqlSession.insert(NAMESPACE + ".insertLicense", lvo);
	}

	@Override
	public void deleteEmpLicense(LicenseVO lvo) throws Exception {
		logger.debug("deleteEmpLicense(LicenseVO lvo) 호출");

		sqlSession.delete(NAMESPACE + ".deleteLicense", lvo);
	}

}
