package com.bswill.controller;

import java.text.DecimalFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bswill.domain.DepartmentVO;
import com.bswill.domain.LeaveVO;
import com.bswill.domain.ReqLeavesVO;
import com.bswill.domain.SearchCriteria;
import com.bswill.service.AttendanceService;
import com.bswill.service.EmployeeService;
import com.bswill.service.LeavesService;

@Controller
@RequestMapping(value = "/leaves/*")
public class LeavesController {

	private static final Logger logger = LoggerFactory.getLogger(LeavesController.class);

	@Inject
	private LeavesService lService;

	@Inject
	private AttendanceService aService;

	@Inject
	private EmployeeService eService;

	// 휴가 신청 목록
	// http://localhost:8090/leaves/requests
	@GetMapping(value = "/requests")
	public void leaveReqListGET(@RequestParam(required = false) String startDate,
			@RequestParam(required = false) String endDate, @RequestParam(required = false) String department,
			@RequestParam(required = false) String approval, @RequestParam(required = false) String leaveType,
			Model model) throws Exception {
		logger.debug(" === leaveReqListGET() 실행 === ");

		// 부서 목록 가져오기
		List<DepartmentVO> depList = aService.departmentList();

		// 검색
		SearchCriteria cri = new SearchCriteria();
		cri.setStartDate(startDate);
		cri.setEndDate(endDate);
		cri.setDepartment(department);
		cri.setApproval(approval);
		cri.setLeaveType(leaveType);
		
		logger.debug("===startDate===:"+startDate);
		logger.debug("===endDate===:"+endDate);
		logger.debug("===department===:"+department);
		logger.debug("===approval===:"+approval);
		logger.debug("===leaveType===:"+leaveType);

		// 휴가 신청 목록 가져오기
		List<ReqLeavesVO> leaveReqList = lService.leaveReqList(cri);
		logger.debug(" leaveReqList.size : " + leaveReqList.size());

		for (ReqLeavesVO vo : leaveReqList) {
			switch (vo.getLeave_type()) {
			case "1":
				vo.setLeave_type("연차");
				break;
			case "2":
				vo.setLeave_type("병가");
				break;
			case "3":
				vo.setLeave_type("경조");
				break;
			case "4":
				vo.setLeave_type("결혼");
				break;
			case "5":
				vo.setLeave_type("긴급");
				break;
			}
		}
		// 뷰페이지 전달
		model.addAttribute("leaveReqList", leaveReqList);
		model.addAttribute("depList", depList);
	}

	// 휴가 승인
	@GetMapping(value = "/approval")
	public String leaveApproval(@RequestParam("req_leave_no") String no, HttpServletRequest request) throws Exception {
		// 신청 번호 가져오기
		int num = Integer.parseInt(no);

		// 승인
		lService.leaveApproval(num);

		return "redirect:" + request.getHeader("Referer");
	}

	// 휴가 반려
	@GetMapping(value = "/rejection")
	public String leaveRejection(@RequestParam("req_leave_no") String no, HttpServletRequest request) throws Exception {
		// 신청 번호 가져오기
		int num = Integer.parseInt(no);

		// 반려
		lService.leaveRejection(num);

		return "redirect:" + request.getHeader("Referer");
	}

	// 휴가 일괄 승인
	@PostMapping(value = "/batchApproval")
	public String leaveBatchApproval(@RequestParam("checkList") String[] strCheckList, HttpServletRequest request)
			throws Exception {
		// 정수 배열 생성
		int[] checkList = new int[strCheckList.length];
		for (int i = 0; i < strCheckList.length; i++) {
			// 신청번호 배열에 담기
			checkList[i] = Integer.parseInt(strCheckList[i]);
			logger.debug(" checkList " + checkList[i]);
			// 일괄 승인
			lService.leaveApproval(checkList[i]);
		}
		return "redirect:" + request.getHeader("Referer");
	}

	// 휴가 일괄 반려
	@PostMapping(value = "/batchRejection")
	public String leaveBatchRejection(@RequestParam("checkList") String[] strCheckList, HttpServletRequest request)
			throws Exception {
		// 정수 배열 생성
		int[] checkList = new int[strCheckList.length];
		for (int i = 0; i < strCheckList.length; i++) {
			// 신청번호 배열에 담기
			checkList[i] = Integer.parseInt(strCheckList[i]);
			logger.debug(" checkList " + checkList[i]);
			// 일괄 반려
			lService.leaveRejection(checkList[i]);
		}
		return "redirect:" + request.getHeader("Referer");
	}

	// 연차목록 조회
	// http://localhost:8090/leaves/annualLeave
	@GetMapping(value = "/annualLeave")
	public void annualLeaveList(@RequestParam(required = false) String baseYear,
			@RequestParam(required = false) String department, @RequestParam(required = false) String keyword,
			Model model) throws Exception {

		// 부서 목록 가져오기
		List<DepartmentVO> depList = aService.departmentList();

		// 검색
		SearchCriteria cri = new SearchCriteria();
		cri.setBaseYear(baseYear);
		cri.setDepartment(department);
		cri.setKeyword(keyword);
		
		logger.debug("===baseYear===:"+baseYear);
		logger.debug("===department===:"+department);
		logger.debug("===keyword===:"+keyword);

		// 목록 가져오기
		List<LeaveVO> annualLeaveList = lService.annualLeaveList(cri);
		logger.debug(" annualLeaveList.size : " + annualLeaveList.size());

		for (LeaveVO vo : annualLeaveList) {
			String creationYear = vo.getCreation_date().substring(0, 4);
			vo.setBeginDate(creationYear + "-01-01");
			vo.setFinishDate(creationYear + "-12-31");
		}

		model.addAttribute("annualLeaveList", annualLeaveList);
		model.addAttribute("depList", depList);

	}

	// 연차 일괄 삭제
	@PostMapping(value = "/batchDelete")
	public String deleteAnnualLeave(@RequestParam("checkList") String[] strCheckList) throws Exception {
		int[] checkList = new int[strCheckList.length];
		for (int i = 0; i < strCheckList.length; i++) {
			checkList[i] = Integer.parseInt(strCheckList[i]);
			logger.debug(" checkList " + checkList[i]);
			lService.deleteAnnualLeave(checkList[i]);
		}
		return "redirect:/leaves/annualLeave";
	}

	// 연차 생성 가능한 사원 목록
	// http://localhost:8090/leaves/annualLeaveAdd
	@GetMapping("/annualLeaveAdd")
	public void canAnnualLeaveAddGET(@RequestParam(required = false) String department,
			@RequestParam(required = false) String keyword, Model model) throws Exception {

		// 검색
		SearchCriteria cri = new SearchCriteria();
		cri.setDepartment(department);
		cri.setKeyword(keyword);
		logger.debug(" ===department=== : " + department);
		logger.debug(" ===keyword=== : " + keyword);
		
		// 부서 목록 가져오기
		List<DepartmentVO> depList = aService.departmentList();

		// 연차 생성 가능한 사원 목록
		List<LeaveVO> annualList = lService.canCreateAnnualLeaveList(cri);

		model.addAttribute("depList", depList);
		model.addAttribute("annualList", annualList);

	}

	// 연차생성
	@PostMapping(value = "/addAnnualLeave")
	public String annualLeavesAddPOST(@RequestParam("checkList") String[] strCheckList) throws Exception {

		// 오늘날짜 가져오기
		LocalDate now = LocalDate.now();
		// 포맷 정의
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		// 포맷 적용
		String today = now.format(formatter);
		// 년도만 자르기
		String nowYear = today.substring(0, 4);
		logger.debug("nowYear : " + nowYear);

		// 숫자 출력 서식 정하기
		DecimalFormat dc = new DecimalFormat("000");
		int[] checkList = new int[strCheckList.length];
		int num = 0;
		int num2 = 0;
		int one = 1;
		for (int i = 0; i < strCheckList.length; i++) {
			checkList[i] = Integer.parseInt(strCheckList[i]);
			logger.debug(" checkList " + checkList[i]);

			// 휴가 개수 가져오기
			LeaveVO voCount = lService.selectLeaveCount();
			// 연차 생성 가능한 사원 정보 불러오기
			LeaveVO vo = lService.canCreateAnnualLeave(checkList[i]);
			// 값 새로 넣기
			num = voCount.getLeave_count();
			num2 = num + one;
			logger.debug("=== num ===1 : " + num2);
			logger.debug("=== num + num2 === : " + num2);
			String formatNum = dc.format(num2);
			vo.setLeave_no(Integer.parseInt(nowYear + formatNum));
			logger.debug("=== nowYear+formatNum === : " + (nowYear + formatNum));
			vo.setEmployee_id(checkList[i]);
			vo.setLeave_days(vo.getLeave_days());
			logger.debug("=== vo === : " + vo.toString());
			lService.createAnnualLeave(vo);
		}

		return "redirect:/leaves/annualLeaveAdd";
	}
}
