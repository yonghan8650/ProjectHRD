package com.bswill.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bswill.domain.OrganizationChartVO;
import com.bswill.service.OrganizationService;

@Controller
@RequestMapping(value = "/org/*")
public class OrganizationController {

	// 서비스 객체 주입
	@Inject
	private OrganizationService oService;
	
	private static final Logger logger = LoggerFactory.getLogger(OrganizationController.class);
	
	// 조직도 목록
	// http://localhost:8088/org/organization
	@RequestMapping(value = "/organization", method = RequestMethod.GET)
	public void orgList(Model model,HttpSession session) throws Exception{
		logger.debug(" /organization -> orgList() 실행 ");
		logger.debug(" /organization.jsp 이동 ");
		
		// 조직도 목록 받기 -> DAO
		List<OrganizationChartVO> orgList = oService.organizationList();
		logger.debug(" list.size : "+ orgList.size());
		// 조직도 목록을 페이지에 전달(Model)
		model.addAttribute("orgList", orgList);
	}
	
	@RequestMapping(value = "/orgFavors", method = RequestMethod.POST)
	public String checkFavors(RedirectAttributes rttr,HttpSession session,@RequestParam("employee_id")int employee_id) throws Exception{
		try {
            oService.checkFavors(employee_id);
            return "redirect:/org/organization";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/org/organization";
        }
		
	}
	


}
