package com.bswill.controller;

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
import com.bswill.service.AttendanceService;

@Controller
@RequestMapping(value = "/attendance/*")
public class AttendanceController {

	private static final Logger logger = LoggerFactory.getLogger(AttendanceController.class);

	@Inject
	private AttendanceService aService;

	// 출퇴근 목록 조회 검색 + 페이징<!-- 페이징 수정해야함 -->
	@GetMapping(value = "/list")
	public void attendanceListGET(@ModelAttribute("cri") AttendanceCri cri, Model model) throws Exception {
		logger.debug(" === attendanceListGET() 실행 === ");

		// 출퇴근 목록 가져오기
		List<AttendanceVO> attendanceList = aService.selectAttendanceList(cri);
		logger.debug(" attendanceList.size : " + attendanceList.size());

		// 뷰페이지 전달
		model.addAttribute("attendanceList", attendanceList);
		model.addAttribute("cri", cri); // 페이징
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
