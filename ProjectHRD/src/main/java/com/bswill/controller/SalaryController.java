package com.bswill.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bswill.domain.SalaryCriteria;
import com.bswill.domain.SalaryListVO;
import com.bswill.domain.SalaryVO;
import com.bswill.service.SalaryService;

@Controller
//@RequestMapping(value = "/salary/*")
public class SalaryController {
	
	@Inject
	private SalaryService sService;
	
	private static final Logger logger = LoggerFactory.getLogger(SalaryController.class);
	
	// http://localhost:8088/salaryList
	// 급여 리스트 GET : /salaryList
	@RequestMapping(value = "/salaryList", method = RequestMethod.GET)
	public void salaryListGET(Model model, HttpSession session) throws Exception {
		logger.debug("/salaryList -> salaryListGET() 호출");
		logger.debug("/salaryList.jsp 뷰 연결");
		
		// 서비스 -> DAO 급여 리스트 가져오기
		List<SalaryVO> salaryList = sService.getSalaryList();
		logger.debug(" list.size : "+salaryList.size());
		
		// 연결된 뷰페이지로 전달(Model)
		model.addAttribute("salaryList", salaryList);
		
		//return "/salaryList";
	}
	
	// http://localhost:8088/salarySearch
	// http://localhost:8088/salarySearch?pay_yearmonth=0000-00-00
	// 급여년월 급여 조회 GET : /salarySearch
	@RequestMapping(value = "/salarySearch", method = RequestMethod.GET)
	public void salarySeachGET(SalaryCriteria cri, Model model, HttpSession session) throws Exception {
		logger.debug("/salarySearch -> salarySearchGET() 호출");
		logger.debug("/salarySearch.jsp 뷰 연결");
		
		// 서비스 -> DAO 급여년월 급여 조회 가져오기
		List<Map<String, Object>> salarySearch = sService.getSalarySearch(cri);
		logger.debug(" list.size : "+salarySearch.size());
		
		// 연결된 뷰페이지로 전달(Model)
		model.addAttribute("salarySearch", salarySearch);
		
		//return "/salarySearch";
	}
}
