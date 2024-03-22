package com.bswill.service;

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

}
