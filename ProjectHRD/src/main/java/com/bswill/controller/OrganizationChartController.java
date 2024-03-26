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

    // 서비스 객체 주입
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

    // http://localhost:8088/org/orgDept
    @RequestMapping(value = "/orgDept", method = RequestMethod.GET)
    public String orgDrpt(@RequestParam("DEPTID") int DEPTID, Model model) throws Exception {
        try {
            List<OrganizationChartVO> departmentEmployees = oService.orgDept(DEPTID);
            model.addAttribute("departmentEmployees", departmentEmployees);
            return "/org/orgDept"; // 뷰 페이지의 경로를 반환
        } catch (Exception e) {
            return "/org/orgDept";
        }
    }

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
}
