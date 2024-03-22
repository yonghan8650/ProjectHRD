package com.bswill.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bswill.domain.AppointmentVO;
import com.bswill.domain.EmployeeVO;
import com.bswill.domain.LicenseVO;
import com.bswill.service.AppointmentService;
import com.bswill.service.EmployeeService;
import com.bswill.service.LicenseService;

@Controller
@RequestMapping(value = "/emp/*")
public class EmpController {

	private static final Logger logger = LoggerFactory.getLogger(EmpController.class);

	@Inject
	private EmployeeService eService;

	@Inject
	private LicenseService lService;

	@Inject
	private AppointmentService aService;

	// http://localhost:8088/emp/registEmp
	@RequestMapping(value = "/registEmp", method = RequestMethod.GET)
	public void registEmpGET(Model model) throws Exception {
		logger.debug("registEmpGET() 호출");

		model.addAttribute("empno", eService.countEmpNo());
	}

	@RequestMapping(value = "/emp/registEmp", method = RequestMethod.POST)
	public String registEmpPOST(EmployeeVO evo, MultipartFile profile, Model model) throws Exception {
		logger.debug("registEmpPOST() 호출");

		logger.debug("evo" + evo);

		/*
		 * 1. profile file, evo, lvo, avo를 전달 받는다.
		 * 2. profile 파일명을 사원번호로 변경하여 서버에 저장한다.
		 * 3. evo에 프로필 파일명을 사원번호.확장자로 입력한다.
		 * 4. evo와 lvo, avo를 DB에 입력한다.
		 * 5. 입력이 실패하면 profile 파일을 삭제한다.
		 * 6. 입력이 성공하면 emp/viewEmp 페이지로 이동하여 입력한 정보를 출력한다.
		 */

		model.addAttribute("employee_id", evo.getEmployee_id());

		return "redirect:/emp/viewEmp";
	}

	// http://localhost:8088/emp/listEmp
	@RequestMapping(value = "listEmp", method = RequestMethod.GET)
	public void listEmpGET(Model model, HttpSession session) throws Exception {
		logger.debug("listEmpGET()");

		model.addAttribute("listEmp", eService.listEmp());

	}

	// http://localhost:8088/emp/viewEmp
	@RequestMapping(value = "viewEmp", method = RequestMethod.GET)
	public void viewEmpGET(@RequestParam("employee_id") int employee_id, Model model) throws Exception {
		logger.debug("viewEmpGET()");

		logger.debug("vo" + eService.viewEmp(employee_id));

		model.addAttribute("viewEmpVO", eService.viewEmp(employee_id));
	}
}
