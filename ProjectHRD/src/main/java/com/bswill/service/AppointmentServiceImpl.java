package com.bswill.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bswill.domain.AppointmentVO;
import com.bswill.persistence.AppointmentDAO;

@Service
public class AppointmentServiceImpl implements AppointmentService {

	private static final Logger logger = LoggerFactory.getLogger(EmployeeServiceImpl.class);

	@Inject
	private AppointmentDAO adao;

	@Override
	public void registAppointment(AppointmentVO avo) throws Exception {
		logger.debug("registAppointment(AppointmentVO avo) 호출");

		adao.insertAppointment(avo);
	}

	@Override
	public List<AppointmentVO> viewEmpAppointment(int employee_id) throws Exception {
		logger.debug("viewEmpAppointment(int employee_id) 호출");

		return adao.selectEmpAppointment(employee_id);
	}

	@Override
	public void addEmpAppointment(AppointmentVO avo) throws Exception {
		logger.debug("addEmpAppointment(AppointmentVO avo) 호출");

		adao.insertEmpAppointment(avo);
	}

	@Override
	public void subEmpAppointment(AppointmentVO avo) throws Exception {
		logger.debug("subEmpAppointment(AppointmentVO avo) 호출");

		adao.deleteEmpAppointment(avo);
	}

}
