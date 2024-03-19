package com.bswill.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bswill.service.empService;

@Controller
@RequestMapping(value = "/emp/*")
public class EmpController {

	private static final Logger logger = LoggerFactory.getLogger(EmpController.class);

	@Inject
	private empService eService;

	@RequestMapping(value = "/registEmp", method = RequestMethod.GET)
	public void registEmpGET() throws Exception {
		logger.debug("registEmpGET() 호출");
	}

	@RequestMapping(value = "/registEmp", method = RequestMethod.POST)
	public String registEmpPOST() throws Exception {
		logger.debug("registEmpPOST() 호출");

		return "listEmp";
	}

	@RequestMapping(value = "listEmp", method = RequestMethod.GET)
	public void listEmpGET(Model model, HttpSession session) throws Exception {
		logger.debug("listEmpGET()");

		model.addAttribute("listEmp", eService.listEmp());

	}

	@RequestMapping(value = "viewEmp", method = RequestMethod.GET)
	public void viewEmpGET() throws Exception {
		logger.debug("viewEmpGET()");
	}
}
