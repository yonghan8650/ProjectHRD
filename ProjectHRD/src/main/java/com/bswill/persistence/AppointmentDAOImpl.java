package com.bswill.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bswill.domain.AppointmentVO;

@Repository
public class AppointmentDAOImpl implements AppointmentDAO {

	private static final Logger logger = LoggerFactory.getLogger(LicenseDAOImpl.class);

	private static final String NAMESPACE = "com.bswill.mapper.AppointmentMapper";

	@Inject
	SqlSession sqlSession;

	@Override
	public void insertAppointment(AppointmentVO avo) throws Exception {
		logger.debug("insertAppointment(AppointmentVO avo) 호출");

		sqlSession.insert(NAMESPACE + ".insertAppointment", avo);
	}

	@Override
	public List<AppointmentVO> selectEmpAppointment(int employee_id) throws Exception {
		logger.debug("selectEmpAppointment(int employee_id) 호출");
		
		return sqlSession.selectList(NAMESPACE + ".selectEmpAppointment", employee_id);
	}
}
