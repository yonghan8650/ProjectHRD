package com.bswill.controller;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bswill.domain.EmployeeVO;
import com.bswill.persistence.empDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class RegistEmpTest {

	private static final Logger logger = LoggerFactory.getLogger(RegistEmpTest.class);

	@Inject
	private empDAO edao;

	@Test
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
}
