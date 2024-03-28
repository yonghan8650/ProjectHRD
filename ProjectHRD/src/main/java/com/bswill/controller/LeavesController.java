package com.bswill.controller;

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
	@GetMapping(value = "/requests")
	public void leaveReqListGET(
			@RequestParam(required = false) String startDate,
			@RequestParam(required = false) String endDate,
			@RequestParam(required = false) String department,
			@RequestParam(required = false) String approval, 
			@RequestParam(required = false) String leaveType,
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
			
		// 휴가 신청 목록 가져오기
		List<ReqLeavesVO> leaveReqList = lService.leaveReqList(cri);
		logger.debug(" leaveReqList.size : " + leaveReqList.size());
		
		for(ReqLeavesVO vo : leaveReqList) {
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
		
		return "redirect:"+request.getHeader("Referer");
	}

	// 휴가 반려
	@GetMapping(value = "/rejection")
	public String leaveRejection(@RequestParam("req_leave_no") String no, HttpServletRequest request) throws Exception {
		// 신청 번호 가져오기
		int num = Integer.parseInt(no);

		//반려
		lService.leaveRejection(num);
		
		return "redirect:"+request.getHeader("Referer");
	}

	// 휴가 일괄 승인
	@PostMapping(value = "/batchApproval")
	public String leaveBatchApproval(@RequestParam("checkList") String[] strCheckList,HttpServletRequest request) throws Exception {
		// 정수 배열 생성
		int[] checkList = new int[strCheckList.length];
		for (int i = 0; i < strCheckList.length; i++) {
			// 신청번호 배열에 담기
			checkList[i] = Integer.parseInt(strCheckList[i]);
			logger.debug(" checkList " + checkList[i]);
			// 일괄 승인
			lService.leaveApproval(checkList[i]);
		}
		return "redirect:"+request.getHeader("Referer");
	}

	// 휴가 일괄 반려
	@PostMapping(value = "/batchRejection")
	public String leaveBatchRejection(@RequestParam("checkList") String[] strCheckList,HttpServletRequest request) throws Exception {
		// 정수 배열 생성
		int[] checkList = new int[strCheckList.length];
		for (int i = 0; i < strCheckList.length; i++) {
			// 신청번호 배열에 담기
			checkList[i] = Integer.parseInt(strCheckList[i]);
			logger.debug(" checkList " + checkList[i]);
			// 일괄 반려
			lService.leaveRejection(checkList[i]);
		}
		return "redirect:"+request.getHeader("Referer");
	}
}
