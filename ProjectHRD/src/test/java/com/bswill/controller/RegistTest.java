package com.bswill.controller;

import java.sql.Date;
import java.sql.Timestamp;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bswill.domain.AppointmentVO;
import com.bswill.domain.EmployeeVO;
import com.bswill.domain.LicenseVO;
import com.bswill.persistence.AppointmentDAO;
import com.bswill.persistence.EmployeeDAO;
import com.bswill.persistence.LicenseDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class RegistTest {

	private static final Logger logger = LoggerFactory.getLogger(RegistTest.class);

	@Inject
	private EmployeeDAO edao;

	// @Test
	public void registEmpTest() throws Exception {
		logger.debug("registEmpTest() 호출");

		EmployeeVO evo = new EmployeeVO();

		evo.setEmployee_id(1000000123);
		evo.setPASSWD("1234");
		evo.setEmp_name("kim");
		evo.setPROFIL("0000000000.png");
		evo.setBirth("함호화된 입력값");
		evo.setGender(1);
		evo.setEmp_tel("000-0000-0000");
		evo.setEmp_mail("12유일한@이메일.값");
		evo.setEmp_addr("가나구 가나동");
		evo.setJOB_ID(906);
		evo.setDEPTID(101);

		edao.insertEmp(evo);

		logger.debug("사원등록 테스트 종료");
	}

	@Inject
	private AppointmentDAO adao;

	// @Test
	public void registAppointmentTest() throws Exception {

		AppointmentVO avo = new AppointmentVO();

		avo.setEmployee_id(1000000123);
		avo.setApp_issue("승진");
		avo.setApp_content("대리 승진");
		avo.setApp_date(Date.valueOf("2024-03-21"));

		adao.insertAppointment(avo);

		logger.debug("발령등록 테스트 종료");
	}
	
	@Inject
	private LicenseDAO ldao;
	
	@Test
	public void registLicenseTest() throws Exception {
		
		LicenseVO lvo = new LicenseVO();
		
		lvo.setEmployee_id(1000000123);
		lvo.setLicense("정보처리기사");
		lvo.setLi_org("큐넷");
		lvo.setLi_date(Date.valueOf("2024-03-21"));
		
		ldao.insertLicense(lvo);
		
		logger.debug("자격등록 테스트 종료");
	}
}
