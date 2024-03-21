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
@RequestMapping(value = "/salary/*")
public class SalaryController {
	
	@Inject
	private SalaryService sService;
	
	private static final Logger logger = LoggerFactory.getLogger(SalaryController.class);
	
	// http://localhost:8088/salary/salaryList
	// 급여 리스트 GET : /salary/salaryList
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
	
	// http://localhost:8088/salary/salarySearch
	// http://localhost:8088/salary/salarySearch?keyword=0000-00
	// http://localhost:8088/salary/salarySearch?pay_yearmonth=0000-00
	// 급여년월 급여 조회 GET : /salary/salarySearch
	@RequestMapping(value = "/salarySearch", method = RequestMethod.GET)
	public void salarySeachGET(SalaryCriteria cri, Model model, HttpSession session) throws Exception {
		logger.debug("/salarySearch -> salarySearchGET() 호출");
		logger.debug("/salarySearch.jsp 뷰 연결");
		
		// 서비스 -> DAO 급여년월 급여 조회 가져오기
		List<Map<String, Object>> salarySearch = sService.getSalarySearch(cri);
		logger.debug(" list.size : "+salarySearch.size());
		
		// 연결된 뷰페이지로 전달(Model)
		model.addAttribute("salarySearch", salarySearch);
		
		model.addAttribute("cri", cri);
		
		//return "/salarySearch";
	}
	
	// http://localhost:8088/salary/salarySearchMonthly
	// http://localhost:8088/salary/salarySearchMonthly?keyword=0000-00
	// http://localhost:8088/salary/salarySearchMonthly?pay_yearmonth=0000-00
	// 월별 급여 조회 GET : /salary/salarySearchMonthly
	@RequestMapping(value = "/salarySearchMonthly", method = RequestMethod.GET)
	public void salarySearchMonthlyGET(SalaryCriteria cri, Model model, HttpSession session) throws Exception {
		logger.debug("/salarySearchMonthly -> salarySearchMonthlyGET() 호출");
		logger.debug("/salarySearchMonthly.jsp 뷰 연결");
		
		// 서비스 -> DAO 월별 급여 조회 가져오기
		List<Map<String, Object>> salarySearchMonthly = sService.getSalarySearchMonthly(cri);
		logger.debug(" list.size : "+salarySearchMonthly.size());
		
		// 연결된 뷰페이지로 전달(Model)
		model.addAttribute("salarySearchMonthly", salarySearchMonthly);
		
		model.addAttribute("cri", cri);
		
		//return "/salarySearchMonthly";
	}
	
	// http://localhost:8088/salary/salaryinfo
	// 급상여기본정보관리 GET : /salary/salaryinfo
	@RequestMapping(value = "/salaryinfo", method = RequestMethod.GET)
	public void salaryinfoGET(Model model, HttpSession session) throws Exception {
		logger.debug("/salaryinfo -> salaryinfoGET() 호출");
		logger.debug("/salaryinfo.jsp 뷰 연결");
		
		// 연결된 뷰페이지로 전달(Model)
		//model.addAttribute("salaryinfo", salaryinfo);
		
		//return "/salaryinfo";
	}
	
	// http://localhost:8088/salary/salaryEnter
	// 급여 입력 GET : /salary/salaryEnter
	@RequestMapping(value = "/salaryEnter", method = RequestMethod.GET)
	public void salaryEnterGET(Model model, HttpSession session) throws Exception {
		logger.debug("/salaryEnter -> salaryEnterGET() 호출");
		logger.debug("/salaryEnter.jsp 뷰 연결");
		
		// 연결된 뷰페이지로 전달(Model)
		//model.addAttribute("salaryEnter", salaryEnter);
		
		//return "/salaryEnter";
	}
}
