package com.bswill.persistence;

import java.util.List;

import com.bswill.domain.AppointmentVO;

public interface AppointmentDAO {

	public void insertAppointment(AppointmentVO avo) throws Exception;

	public List<AppointmentVO> selectEmpAppointment(int employee_id) throws Exception;

}
