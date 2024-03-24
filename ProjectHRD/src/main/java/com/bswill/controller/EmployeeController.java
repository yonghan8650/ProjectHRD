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
import com.bswill.domain.EventVO;
import com.bswill.domain.LicenseVO;
import com.bswill.domain.NotificationVO;
import com.bswill.service.AppointmentService;
import com.bswill.service.EmployeeService;
import com.bswill.service.EventService;
import com.bswill.service.LicenseService;

@Controller
@RequestMapping(value = "/emp/*")
public class EmployeeController {

	private static final Logger logger = LoggerFactory.getLogger(EmployeeController.class);

	@Inject
	private EmployeeService eService;

	@Inject
	private LicenseService lService;

	@Inject
	private AppointmentService aService;

	@Inject
	private EventService vService;

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
		 * 1. profile file, evo, lvo, avo를 전달 받는다. 2. profile 파일명을 사원번호로 변경하여 서버에 저장한다.
		 * 3. evo에 프로필 파일명을 사원번호.확장자로 입력한다. 4. evo와 lvo, avo를 DB에 입력한다. 5. 입력이 실패하면
		 * profile 파일을 삭제한다. 6. 입력이 성공하면 emp/viewEmp 페이지로 이동하여 입력한 정보를 출력한다.
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

	////////////////////////////////////////////////////////////////////////////////////
	// http://localhost:8088/emp/applyEvent
	@RequestMapping(value = "/applyEvent", method = RequestMethod.GET)
	public void applyEventGET(Model model, HttpSession session) throws Exception {
		logger.debug("applyEventGET() 호출");

		// 임시로 세션 생성
		session.setAttribute("employee_id", 4000);

		int employee_id = (int) session.getAttribute("employee_id");

		logger.debug("employee_id: " + employee_id);

		model.addAttribute("employee_id", employee_id);
	}

	@RequestMapping(value = "/applyEvent", method = RequestMethod.POST)
	public String applyEventPOST(EventVO vvo) throws Exception {
		logger.debug("applyEventPOST() 호출");

		logger.debug("evo: " + vvo);

		vService.applyEvent(vvo);

		logger.debug("evo: " + vvo);

		return "redirect:/emp/viewEvent?&searchType=eve_class&keyword=";
	}

	// http://localhost:8088/emp/viewEvent?searchType=eve_class&keyword=
	@RequestMapping(value = "viewEvent", method = RequestMethod.GET)
	public void viewEventGET(HttpSession session, Model model,
			@RequestParam(name = "searchType", required = false) String searchType,
			@RequestParam(name = "keyword", required = false) String keyword) throws Exception {
		logger.debug("viewEventGET() 호출");

		int employee_id = (int) session.getAttribute("employee_id");

		if (searchType == null) {
			searchType = "''";
		}

		if (keyword == null) {
			keyword = "''";
		}

		logger.debug("searchType: " + searchType);
		logger.debug("keyword: " + keyword);

		model.addAttribute("listEmpEvent", vService.viewEmpEventList(employee_id, searchType, keyword));
	}

	// http://localhost:8088/emp/listEvent?searchType=eve_class&keyword=
	@RequestMapping(value = "/listEvent", method = RequestMethod.GET)
	public void listEventGET(Model model, @RequestParam(name = "searchType", required = false) String searchType,
			@RequestParam(name = "keyword", required = false) String keyword) throws Exception {
		logger.debug("listEventGET() 호출");

		if (searchType == null) {
			searchType = "''";
		}

		if (keyword == null) {
			keyword = "''";
		}

		model.addAttribute("listEvent", vService.listAllEvent(searchType, keyword));
	}

	@RequestMapping(value = "/viewEmpAccountInfo", method = RequestMethod.GET)
	public void viewEmpAccountInfoGET(Model model, @RequestParam("employee_id") int employee_id) throws Exception {
		logger.debug("viewEmpAccountInfoGET() 호출");

		logger.debug("employee_id: " + employee_id);
		logger.debug("employee_id: " + vService.viewEmpSalary(employee_id));

		model.addAttribute("viewSalary", vService.viewEmpSalary(employee_id));
	}

	@RequestMapping(value = "/approveEmpEvent", method = RequestMethod.POST)
	public String approveEmpEvent(EventVO vvo) throws Exception {
		logger.debug("approveEmpEvent() 호출");

		logger.debug("vvo:" + vvo);

		vService.modifyEventAuthApprove(vvo);

		NotificationVO nvo = new NotificationVO();
		nvo.setEmployee_id(vvo.getEmployee_id());
		nvo.setNoti_title("요청하신 " + vvo.getEve_subject() + "씨의 " + vvo.getEve_class() + " 경조비 신청이 승인되었습니다.");
		nvo.setNoti_link("http://localhost:8088/emp/viewEvent?searchType=eve_auth&keyword=%EC%8A%B9%EC%9D%B8");

		vService.notifyModification(nvo);

		return "redirect:/emp/listEvent?searchType=employee_id&keyword=";
	}

	@RequestMapping(value = "/rejectEmpEvent", method = RequestMethod.POST)
	public String rejectEmpEvent(EventVO vvo) throws Exception {
		logger.debug("rejectEmpEvent() 호출");

		logger.debug("vvo:" + vvo);

		vService.modifyEventAuthReject(vvo);

		NotificationVO nvo = new NotificationVO();
		nvo.setEmployee_id(vvo.getEmployee_id());
		nvo.setNoti_title("요청하신 " + vvo.getEve_subject() + "씨의 " + vvo.getEve_class() + " 경조비 신청이 거부되었습니다.");
		nvo.setNoti_link("http://localhost:8088/emp/viewEvent?searchType=eve_auth&keyword=%EA%B1%B0%EB%B6%80");

		vService.notifyModification(nvo);

		return "redirect:/emp/listEvent?searchType=employee_id&keyword=";
	}

}
