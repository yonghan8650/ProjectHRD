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

    @Inject
    private OrganizationChartService oService;

    private static final Logger logger = LoggerFactory.getLogger(OrganizationChartController.class);

    // http://localhost:8088/common/customLogin
    // http://localhost:8088/org/orgList
    // 조직도 목록 페이지 이동 및 데이터 전달
    @RequestMapping(value = "/orgList", method = RequestMethod.GET)
    public String orgList(Model model, HttpSession session) throws Exception {
        logger.debug(" /orgList -> orgList() 실행 ");
        logger.debug(" /orgList.jsp 이동 ");

        // 사용자 인증 정보 가져오기
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication != null && authentication.isAuthenticated()) {
            int employeeId = Integer.parseInt(authentication.getName());
            logger.debug("employeeId : " + employeeId);
            
            // 조직도 목록 조회
            List<OrganizationChartVO> orgList = oService.orgList();
            logger.debug(" orgList.size : " + orgList.size());
            model.addAttribute("orgList", orgList);
      

            return "/org/orgList"; // 조직도 목록 페이지로 이동
        } else {
            return "/org/orgList";
        }
    }

    // 부서 목록 페이지 이동 및 데이터 전달
    @RequestMapping(value = "/orgDept", method = RequestMethod.GET)
    public String orgDeptList(Model model) throws Exception {
        // 사용자 인증 정보 가져오기
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        
        if (authentication != null && authentication.isAuthenticated()) {
            int employeeId = Integer.parseInt(authentication.getName());
            logger.debug("employeeId : " + employeeId);
            
            // 부서 목록 조회
            List<OrganizationChartVO> departmentList = oService.getDepartmentList();
            model.addAttribute("departmentList", departmentList);
            
            return "/org/orgDept"; // 부서 목록 페이지로 이동
        }  else {
            return "/org/orgList"; 
        }
    }

 // 즐겨찾기 목록 페이지 이동 및 데이터 전달
    @RequestMapping(value = "/orgFavor", method = RequestMethod.GET)
    public String orgFavor(Model model) throws Exception {
        // 사용자 인증 정보 가져오기
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        
        if (authentication != null && authentication.isAuthenticated()) {
            int employeeId = Integer.parseInt(authentication.getName());
            logger.debug("employeeId : " + employeeId);
            
            // 즐겨찾기 목록 조회
            List<OrganizationChartVO> selectFavorList = oService.orgFavor(employeeId);
            model.addAttribute("getFavoriteEmployees", selectFavorList);
            
            // 현재 사용자의 즐겨찾기 목록 가져오기
            OrganizationChartVO currentUser = oService.getUserById(employeeId);
            String userFavorites = currentUser.getFAVORS();
            
            if (userFavorites != null) {
                model.addAttribute("userFavorites", userFavorites);
                logger.debug(" userFavorites : "+ userFavorites.indexOf(userFavorites));
            } else {
                // 즐겨찾기된 사원이 없는 경우 빈 문자열을 전달
                model.addAttribute("userFavorites", "");
            }
            
            logger.debug(" orgFavor 이동 ");
            return "/org/orgFavor"; // 즐겨찾기 목록 페이지로 이동
        } else {
            return "/org/orgList"; 
        }
    }

    // 즐겨찾기 추가
    @RequestMapping(value = "/addToFavorites", method = RequestMethod.POST)
    public String addToFavorites(@RequestParam("employeeId") int employeeId, HttpSession session, Model model)
            throws Exception {
        // 사용자 인증 정보 가져오기
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication != null && authentication.isAuthenticated()) {
            String userId = authentication.getName(); // 사용자 ID 가져오기
            oService.addToFavorites(employeeId, userId); // 즐겨찾기 추가
            logger.debug(" 즐겨찾기 추가 성공 ");

            // 즐겨찾기 목록 페이지로 이동
            return "redirect:/org/orgFavor"; 
        } else {
            logger.debug(" 즐겨찾기 추가 실패 ");
            return "redirect:/org/orgList"; 
        }
    }


 // 즐겨찾기 해제
    @RequestMapping(value = "/removeFavor", method = RequestMethod.POST)
    public String removeFavor(@RequestParam("employeeId") int employeeId,
            RedirectAttributes redirectAttributes) throws Exception {
        // 사용자 인증 정보 가져오기
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        
        if (authentication != null && authentication.isAuthenticated()) {
            String userId = authentication.getName(); // 사용자 ID 가져오기
            // 즐겨찾기 해제
            oService.removeFromFavorites(employeeId, userId);
            logger.debug(" 즐겨찾기 해제 성공 ");
            // 즐겨찾기 목록 페이지로 이동
            return "redirect:/org/orgFavor"; 
        } else {
            logger.debug(" 즐겨찾기 해제 실패 ");
            return "redirect:/org/orgFavor"; 
        }
    }



    // 부서별 직원 목록 페이지 이동 및 데이터 전달
    @RequestMapping(value = "/employeesByDept", method = RequestMethod.GET)
    public String getEmployeesByDept(@RequestParam("deptId") int deptId, Model model) {
        try {
            // 해당 부서의 직원 목록 조회
            List<OrganizationChartVO> employees = oService.getEmployeesByDept(deptId);
            model.addAttribute("employees", employees);
            return "/org/employeesByDept"; // 부서별 직원 목록 페이지로 이동
        } catch (Exception e) {
            e.printStackTrace();
            return "/common/accessErr"; // 에러 페이지로 이동
        }
    }
}
