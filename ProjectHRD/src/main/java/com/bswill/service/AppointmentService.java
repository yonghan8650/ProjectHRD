package com.bswill.service;

import java.util.List;

import com.bswill.domain.AppointmentVO;

public interface AppointmentService {

	public void registAppointment(AppointmentVO avo) throws Exception;

	public List<AppointmentVO> viewEmpAppointment(int employee_id) throws Exception;

}
