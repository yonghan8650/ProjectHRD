package com.bswill.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bswill.domain.OrganizationChartVO;
import com.bswill.service.OrganizationChartService;

@Controller
@RequestMapping(value = "/org/*")
public class OrganizationChartController {

    //  서비스 객체 주입
    @Inject
    private OrganizationChartService oService;

    private static final Logger logger = LoggerFactory.getLogger(OrganizationChartController.class);

    
    
    // http://localhost:8088/common/customLogin
    // http://localhost:8088/org/orgList
    // 조직도 목록
    @RequestMapping(value = "/orgList", method = RequestMethod.GET)
    public String orgList(Model model, HttpSession session) throws Exception {
        logger.debug(" /orgList -> orgList() 실행 ");
        logger.debug(" /orgList.jsp 이동 ");

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        
        if (authentication != null && authentication.isAuthenticated()) {
            // 인증된 사용자인 경우에만 알림 목록을 가져옴
            int employee_id = Integer.parseInt(authentication.getName());
            logger.debug("employee_id : " + employee_id);
            // 조직도 목록 받기 -> DAO
            List<OrganizationChartVO> orgList = oService.orgList();
            logger.debug(" orgList.size : " + orgList.size());
            // 알림 목록 값을 페이지에 전달(Model)
            model.addAttribute("orgList", orgList);
            return "/org/orgList";
        } else {
            return "/org/orgList";
        }
    }

    // 조직도 부서 목록
    // http://localhost:8088/org/orgDept
    @RequestMapping(value = "/orgDept", method = RequestMethod.GET)
    public String orgDeptList(Model model) throws Exception {
    	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    	 if (authentication != null && authentication.isAuthenticated()) {
        	int employee_id = Integer.parseInt(authentication.getName());
        	logger.debug("employee_id : " + employee_id);
            List<OrganizationChartVO> departmentList = oService.getDepartmentList();
            model.addAttribute("departmentList", departmentList);
            return "/org/orgDept"; // 부서 목록 페이지로 이동
        }  else {
            return "/org/orgList";
        }
    }

    // 즐겨 찾기 목록
    // http://localhost:8088/org/orgFavor
    @RequestMapping(value = "/orgFavor", method = RequestMethod.GET)
    public String orgFavor(Model model) throws Exception {
    	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    	if (authentication != null && authentication.isAuthenticated()) {
    		// 인증된 사용자인 경우에만 즐겨찾기 목록을 가져옴
            int employee_id = Integer.parseInt(authentication.getName());
            logger.debug("employee_id : " + employee_id);
            List<OrganizationChartVO> getFavoriteEmployees = oService.orgFavor();
            model.addAttribute("getFavoriteEmployees", getFavoriteEmployees);
            logger.debug(" orgFavor 이동 ");
            return "/org/orgFavor";
        }  else {
            return "/org/orgList";
        }
    }
    
    // 즐겨찾기 추가 기능
    @RequestMapping(value = "/addToFavorites", method = RequestMethod.POST)
    public String addToFavorites(@RequestParam("employee_id") int employee_id, RedirectAttributes redirectAttributes) {
        // 즐겨찾기 추가 기능 구현
        try {
            oService.addToFavorites(employee_id);
            logger.debug(" employee_id "+employee_id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 즐겨찾기가 추가된 후에 적절한 페이지로 리다이렉트
        return "redirect:/org/orgList";
    }
    
    // 즐겨찾기 해제 기능
    @RequestMapping(value = "/removeFromFavorites", method = RequestMethod.POST)
    public String removeFromFavorites(@RequestParam("employee_id") int employee_id, RedirectAttributes redirectAttributes) {
        try {
            // 즐겨찾기 해제 기능 구현
            oService.removeFromFavorites(employee_id);
            logger.debug(" employee_id " + employee_id);
        } catch (Exception e) {
            e.printStackTrace();
            // 에러 처리
        }
        // 적절한 페이지로 리다이렉트
        return "redirect:/org/orgFavor";
    }
    
    // 부서별 직원 목록 가져오기
    @RequestMapping(value = "/getEmployeesByDept", method = RequestMethod.GET)
    public String getEmployeesByDept(@RequestParam("deptId") int deptId, Model model) {
        try {
            // 해당 부서의 직원 목록을 가져옴
            List<OrganizationChartVO> employees = oService.getEmployeesByDept(deptId);
            // 가져온 직원 목록을 모델에 담아서 뷰 페이지로 전달
            model.addAttribute("employees", employees);
            return "/org/employeesByDept"; // 직원 목록 페이지로 이동
        } catch (Exception e) {
            e.printStackTrace();
            // 에러 처리
            return "/common/accessErr";
        }
    }

    
}