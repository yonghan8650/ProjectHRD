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
	
	// http://localhost:8088/salary/salarySearch
	// 급여조회 GET : /salary/salarySearch
	@RequestMapping(value = "/salarySearch", method = RequestMethod.GET)
	public void salarySeachGET(SalaryCriteria cri, Model model, HttpSession session) throws Exception {
		logger.debug("/salarySearch -> salarySearchGET() 호출");
		logger.debug("/salarySearch.jsp 뷰 연결");
		
		List<Map<String, Object>> salarySearchEmp;
		List<Map<String, Object>> salarySearchMore;
		
		// 서비스 -> DAO 급여조회 급여목록 가져오기
		if(cri.getStartDate() != null)
		{
			salarySearchEmp = sService.getSalarySearchEmp(cri);
			logger.debug(" emplist.size : "+salarySearchEmp.size());
			
			// 연결된 뷰페이지로 전달(Model)
			model.addAttribute("salarySearchEmp", salarySearchEmp);
			
			model.addAttribute("cri", cri);
		}
		
		// 서비스 -> DAO 급여조회 급여명세서 가져오기
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
	// 월별 급여 조회 GET : /salary/salarySearchMonthly
	@RequestMapping(value = "/salarySearchMonthly", method = RequestMethod.GET)
	public void salarySearchMonthlyGET(SalaryCriteria cri, Model model, HttpSession session) throws Exception {
		logger.debug("/salarySearchMonthly -> salarySearchMonthlyGET() 호출");
		logger.debug("/salarySearchMonthly.jsp 뷰 연결");
		
		/*
		// 사용자가 입력한 시작일과 종료일을 받아옴
	    String startDate = cri.getKeyword();
	    String endDate = cri.getKeyword2();
	    
	    // 날짜 형식 지정
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
	    Date startDate = sdf.parse(startDateStr);
	    Date endDate = sdf.parse(endDateStr);

	    Calendar startCalendar = Calendar.getInstance();
	    startCalendar.setTime(startDate);

	    Calendar endCalendar = Calendar.getInstance();
	    endCalendar.setTime(endDate);

	    List<Map<String, Object>> searchedSalaryList = new ArrayList<Map<String,Object>>();
	    List<Map<String, Object>> salarySearchMonthly;
	    
	    while (!startCalendar.after(endCalendar)) {
	    	 // "yyyy-MM" 형식으로 변환
	        String yearMonth = sdf.format(startCalendar.getTime()).substring(0, 7);
	        
	        // 서비스 -> DAO 월별 급여 조회 가져오기
	        salarySearchMonthly = sService.getSalarySearchMonthly(yearMonth);
	        searchedSalaryList.addAll(salarySearchMonthly);
	        startCalendar.add(Calendar.MONTH, 1);
	    }
	    
	    // 조회된 월별 급여 정보를 모델에 추가
	    model.addAttribute("salarySearchMonthly", salarySearchMonthly);
	    model.addAttribute("cri", cri);
	    */
	    // View 페이지 반환
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
		
		// 서비스 -> DAO 급상여기본정보관리 기본정보 가져오기
		if(cri.getStartDate() != null)
		{
			salaryInfoEmp = sService.getSalaryInfoEmp(cri);
			logger.debug(" emplist.size : "+salaryInfoEmp.size());
			
			// 연결된 뷰페이지로 전달(Model)
			model.addAttribute("salaryInfoEmp", salaryInfoEmp);
			
			model.addAttribute("cri", cri);
		}
		
		// 서비스 -> DAO 급상여기본정보관리 상세정보 가져오기
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
		return "redirect:/salary/salaryInfo?keyword="+cri.getStartDate()+"&employee_id="+svo.getEmployee_id();
	}
	
	// http://localhost:8088/salary/salaryEnter
	// 급여 입력 GET : /salary/salaryEnter
	@RequestMapping(value = "/salaryEnter", method = RequestMethod.GET)
	public void salaryEnterGET(SalaryCriteria cri, Model model, HttpSession session) throws Exception {
		logger.debug("/salaryEnter -> salaryEnterGET() 호출");
		logger.debug("/salaryEnter.jsp 뷰 연결");
		
		List<Map<String, Object>> salaryEnterEmp;
		List<Map<String, Object>> salaryEnterMore;
		List<Map<String, Object>> salaryEnterSalary;
		
		// 서비스 -> DAO 급여입력 사원정보 가져오기
		if(cri.getStartDate() != null)
		{
			salaryEnterEmp = sService.getSalaryEnterEmp(cri);
			logger.debug(" emplist.size : "+salaryEnterEmp.size());
			
			// 연결된 뷰페이지로 전달(Model)
			model.addAttribute("salaryEnterEmp", salaryEnterEmp);
			
			model.addAttribute("cri", cri);
		}
		
		// 서비스 -> DAO 급여입력 기본금 입력
		if(cri.getEmployee_id() != null) {
			
			salaryEnterMore = sService.getSalaryEnterMore(cri);
			logger.debug(" morelist.size : "+salaryEnterMore.size());
			
			// 연결된 뷰페이지로 전달(Model)
			model.addAttribute("salaryEnterMore", salaryEnterMore);
			
			model.addAttribute("cri", cri);
		}
		
		// 서비스 -> DAO 급여입력 계산하기
		if(cri.getSalary() != null) {
			
			salaryEnterSalary = sService.getSalaryEnter(cri);
			logger.debug(" morelist.size : "+salaryEnterSalary.size());
			
			// 연결된 뷰페이지로 전달(Model)
			model.addAttribute("salaryEnterSalary", salaryEnterSalary);
			
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
		
		// 서비스 -> DAO 급여입력 급여정보 생성 동작
		sService.insertSalaryEnter(slvo);
	
		// 수정 완료 후  salaryEnter 페이지로 이동 (redirect)
		//return "/salaryEnter";
		return "redirect:/salary/salaryEnter?keyword="+cri.getStartDate()+"&employee_id="+slvo.getEmployee_id();
	}
}
