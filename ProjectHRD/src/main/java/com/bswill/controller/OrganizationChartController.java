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
	@RequestMapping(value = "/orgList", method = RequestMethod.GET)
	public String orgListGET(Model model) throws Exception {
		logger.debug("orgListGET() 호출");

		String uri = "";

		// 사용자 인증 정보 가져오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		if (authentication != null && authentication.isAuthenticated()) {
			int employee_id = Integer.parseInt(authentication.getName());
			logger.debug("employeeId : " + employee_id);

			// 조직도 목록 조회
			List<OrganizationChartVO> orgList = oService.orgList();
			logger.debug(" orgList.size : " + orgList.size());
			model.addAttribute("orgList", orgList);

			model.addAttribute("getEmpFavors", oService.getEmpFavors(employee_id));

			uri = "/org/orgList";
		} else {
			uri = "/common/accessErr";
		}

		return uri;
	}

	// 즐겨찾기 추가
	@RequestMapping(value = "/updateFavors", method = RequestMethod.POST)
	public String updateFavorsPOST(@RequestParam(name = "favors", required = false) String[] favors,
			@RequestParam(name = "orgFavor", required = false) String orgFavor) throws Exception {
		logger.debug("updateFavorsPOST() 호출");

		String uri = "";

		// 사용자 인증 정보 가져오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		if (authentication != null && authentication.isAuthenticated()) {
			int employee_id = Integer.parseInt(authentication.getName());

			logger.debug("employee_id:" + employee_id);

			String FAVORS = "";

			if (favors != null) {
				for (String favor : favors) {
					FAVORS += favor + ",";
				}

				if (FAVORS.endsWith(",")) {
					FAVORS = FAVORS.substring(0, FAVORS.length() - 1);
				}

				logger.debug("FAVORS:" + FAVORS);
			}
			oService.modifyFavors(employee_id, FAVORS);

			uri = "redirect:/org/orgList";

			if (orgFavor != null) {
				uri = "redirect:/org/orgFavor";
			}
		} else {
			uri = "/common/accessErr";
		}

		return uri;
	}

	// 즐겨찾기 목록
	@RequestMapping(value = "/orgFavor", method = RequestMethod.GET)
	public String orgFavorGET(Model model) throws Exception {
		logger.debug("orgFavorGET() 호출");

		String uri = "";

		// 사용자 인증 정보 가져오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		if (authentication != null && authentication.isAuthenticated()) {

			int employee_id = Integer.parseInt(authentication.getName());
			logger.debug("employee_id : " + employee_id);

			// 즐겨찾기 목록 조회
			List<OrganizationChartVO> getEmpFavorsList = oService.getEmpFavorsList(employee_id);
			logger.debug("getEmpFavorsList: " + getEmpFavorsList);

			model.addAttribute("getEmpFavorsList", getEmpFavorsList);

			model.addAttribute("getEmpFavors", oService.getEmpFavors(employee_id));

			uri = "/org/orgFavor";
		} else {
			uri = "/common/accessErr";
		}

		return uri;
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
		} else {
			return "/org/orgList";
		}
	}

	// 즐겨찾기 해제
	@RequestMapping(value = "/removeFavor", method = RequestMethod.POST)
	public String removeFavor(@RequestParam("employeeId") int employeeId, RedirectAttributes redirectAttributes) throws Exception {
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
