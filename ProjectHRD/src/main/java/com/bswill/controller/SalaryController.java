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
import com.bswill.domain.SalarylistVO;
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
		
		List<Map<String, Object>> salarySearchEmp;
		List<Map<String, Object>> salarySearchMore;
		
		// 서비스 -> DAO 급여년월 급여 조회 가져오기
		
		if(cri.getKeyword() != null)
		{
			salarySearchEmp = sService.getSalarySearchEmp(cri);
			logger.debug(" emplist.size : "+salarySearchEmp.size());
			
			// 연결된 뷰페이지로 전달(Model)
			model.addAttribute("salarySearchEmp", salarySearchEmp);
			
			model.addAttribute("cri", cri);
		}
		
		if(cri.getEmployee_id() != null) {
			
			salarySearchMore = sService.getSalarySearchMore(cri);
			logger.debug(" morelist.size : "+salarySearchMore.size());
			
			// 연결된 뷰페이지로 전달(Model)
			model.addAttribute("salarySearchMore", salarySearchMore);
			
			model.addAttribute("cri", cri);
		}
		
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
	
	// http://localhost:8088/salary/salaryInfo
	// 급상여기본정보관리 GET : /salary/salaryInfo
	@RequestMapping(value = "/salaryInfo", method = RequestMethod.GET)
	public void salaryInfoGET(SalaryCriteria cri, Model model, HttpSession session) throws Exception {
		logger.debug("/salaryInfo -> salaryInfoGET() 호출");
		logger.debug("/salaryInfo.jsp 뷰 연결");
		
		List<Map<String, Object>> salaryInfoEmp;
		List<Map<String, Object>> salaryInfoMore;
		
		// 서비스 -> DAO 급상여기본정보관리 가져오기
		
		if(cri.getKeyword() != null)
		{
			salaryInfoEmp = sService.getSalaryInfoEmp(cri);
			logger.debug(" emplist.size : "+salaryInfoEmp.size());
			
			// 연결된 뷰페이지로 전달(Model)
			model.addAttribute("salaryInfoEmp", salaryInfoEmp);
			
			model.addAttribute("cri", cri);
		}
		
		if(cri.getEmployee_id() != null) {
			
			salaryInfoMore = sService.getSalaryInfoMore(cri);
			logger.debug(" morelist.size : "+salaryInfoMore.size());
			
			// 연결된 뷰페이지로 전달(Model)
			model.addAttribute("salaryInfoMore", salaryInfoMore);
			
			model.addAttribute("cri", cri);
		}

		//return "/salaryInfo";
	}
	
	// 급상여기본정보관리 POST : /salary/salaryInfo
	@RequestMapping(value = "/salaryInfo", method = RequestMethod.POST)
	public String salaryInfoPOST(SalaryCriteria cri, SalaryVO svo) throws Exception {
		logger.debug("/salaryInfo -> salaryInfoPOST() 호출");
		
		// 한글처리 인코딩
		// 전달정보 저장(bank, account, account_holder)
		logger.debug(" SalaryVO : "+svo);
		
		// 서비스 -> DAO 급상여 상세정보 수정 동작
		sService.updateSalaryInfoMore(svo);

		// 수정 완료 후 salaryInfo 페이지로 이동 (redirect)
		//return "/salaryInfo";
		return "redirect:/salary/salaryInfo?keyword="+cri.getKeyword()+"&employee_id="+svo.getEmployee_id();
	}
	
	// http://localhost:8088/salary/salaryEnter
	// 급여 입력 GET : /salary/salaryEnter
	@RequestMapping(value = "/salaryEnter", method = RequestMethod.GET)
	public void salaryEnterGET(SalaryCriteria cri, Model model, HttpSession session) throws Exception {
		logger.debug("/salaryEnter -> salaryEnterGET() 호출");
		logger.debug("/salaryEnter.jsp 뷰 연결");
		
		List<Map<String, Object>> salaryEnterEmp;
		List<Map<String, Object>> salaryEnterMore;
		
		// 서비스 -> DAO 급여입력 가져오기
		
		if(cri.getKeyword() != null)
		{
			salaryEnterEmp = sService.getSalaryEnterEmp(cri);
			logger.debug(" emplist.size : "+salaryEnterEmp.size());
			
			// 연결된 뷰페이지로 전달(Model)
			model.addAttribute("salaryEnterEmp", salaryEnterEmp);
			
			model.addAttribute("cri", cri);
		}
		
		if(cri.getEmployee_id() != null) {
			
			salaryEnterMore = sService.getSalaryEnterMore(cri);
			logger.debug(" morelist.size : "+salaryEnterMore.size());
			
			// 연결된 뷰페이지로 전달(Model)
			model.addAttribute("salaryEnterMore", salaryEnterMore);
			
			model.addAttribute("cri", cri);
		}
		
		// 연결된 뷰페이지로 전달(Model)
		//model.addAttribute("salaryEnter", salaryEnter);
		
		//return "/salaryEnter";
	}
	
	// 급여 입력 POST : /salary/salaryEnter
	@RequestMapping(value = "/salaryEnter", method = RequestMethod.POST)
	public String salaryEnterPOST(SalaryCriteria cri, SalarylistVO slvo) throws Exception {
		logger.debug("/salaryEnter -> salaryEnterPOST() 호출");
		
		// 한글처리 인코딩
		// 전달정보 저장(bank, account, account_holder)
		logger.debug(" SalarylistVO : "+slvo);
		
		// 서비스 -> DAO 급여 입력 수정 동작
		sService.insertSalaryEnter(slvo);

		// 수정 완료 후  salaryEnter 페이지로 이동 (redirect)
		//return "/salaryEnter";
		return "redirect:/salary/salaryEnter?keyword="+cri.getKeyword()+"&employee_id="+slvo.getEmployee_id();
	}
}
