package com.bswill.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bswill.domain.AppointmentVO;
import com.bswill.domain.EmployeeVO;
import com.bswill.domain.LicenseVO;

@Controller
@RequestMapping(value = "/emp/*")
public class EmpController {

	private static final Logger logger = LoggerFactory.getLogger(EmpController.class);

	@RequestMapping(value = "/registEmp", method = RequestMethod.GET)
	public void registEmpGET() throws Exception {
		logger.debug("registEmpGET() 호출");
	}

	@RequestMapping(value = "/registEmp", method = RequestMethod.POST)
	public String registEmpPOST() throws Exception {
		logger.debug("registEmpPOST() 호출");

		return "viewEmp";
	}
	
	@RequestMapping(value = "viewEmp", method = RequestMethod.GET)
	public void viewEmpGET() throws Exception {
		logger.debug("viewEmpGET()");
	}
}
