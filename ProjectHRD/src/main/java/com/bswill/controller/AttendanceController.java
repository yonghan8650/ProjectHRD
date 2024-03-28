package com.bswill.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bswill.domain.AttendanceCri;
import com.bswill.domain.AttendanceVO;
import com.bswill.domain.DepartmentVO;
import com.bswill.domain.SearchCriteria;
import com.bswill.service.AttendanceService;

@Controller
@RequestMapping(value = "/attendance/*")
public class AttendanceController {

	private static final Logger logger = LoggerFactory.getLogger(AttendanceController.class);

	@Inject
	private AttendanceService aService;

	// 출퇴근 목록 조회 검색
	// http://localhost:8090/attendance/list
	@GetMapping(value = "/list")
	public void attendanceListGET(@RequestParam(required = false) String searchDate,
			@RequestParam(required = false) String department, Model model) throws Exception {
		logger.debug(" === attendanceListGET() 실행 === ");

		// 부서 목록 가져오기
		List<DepartmentVO> depList = aService.departmentList();
		logger.debug(" depList.size : " + depList.size());

		SearchCriteria cri = new SearchCriteria();
		cri.setSearchDate(searchDate);
		cri.setApproval(department);

		// 오늘 날짜 불러오기
		LocalDate today = LocalDate.now();
		// 날짜 형식 변환
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String formattedDate = today.format(formatter);

		// 출퇴근 목록 가져오기
		List<AttendanceVO> attendanceList = aService.selectAttendanceList(cri);
		logger.debug(" attendanceList.size : " + attendanceList.size());

		for (AttendanceVO vo : attendanceList) {
			switch (vo.getWork_type()) {
			case "1":
				vo.setWork_type("정상근무");
				break;
			case "2":
				vo.setWork_type("외근");
				break;
			case "3":
				vo.setWork_type("출장");
				break;
			case "4":
				vo.setWork_type("연차");
				break;
			case "5":
				vo.setWork_type("휴가");
				break;
			case "6":
				vo.setWork_type("조퇴");
				break;
			case "7":
				vo.setWork_type("결근");
				break;
			}
		}
		// 뷰페이지 전달
		model.addAttribute("attendanceList", attendanceList);
		model.addAttribute("depList", depList);
		model.addAttribute("formattedDate", formattedDate);

	}

	// 출퇴근 목록 행삭제
	@PostMapping(value = "/delete")
	public String attendanceDeletePOST(@RequestParam("checkList") String[] strCheckList) throws Exception {

		int[] checkList = new int[strCheckList.length];
		for (int i = 0; i < strCheckList.length; i++) {
			checkList[i] = Integer.parseInt(strCheckList[i]);
			logger.debug(" checkList " + checkList[i]);
			aService.deleteAttendance(checkList[i]);

		}
		return "redirect:/attendance/list";
	}

}
