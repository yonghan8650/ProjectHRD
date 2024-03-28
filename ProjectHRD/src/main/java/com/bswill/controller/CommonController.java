package com.bswill.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bswill.domain.EmployeeVO;
import com.bswill.service.CommonService;

@Controller
@RequestMapping(value = "/common/*")
public class CommonController {

	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);

	@Inject
	private CommonService cService;
	@Inject
	private PasswordEncoder pwEncoder;

	@RequestMapping(value = "/accessErr", method = RequestMethod.GET)
	public void accessDenied(Authentication auth) {
		logger.info(" accessDenied() 호출 ");
		logger.info(" 접근 권한없는 접근 발생 ");
		logger.info(" auth : " + auth);

	}

	// http://localhost:8088/common/customLogin
	@RequestMapping(value = "/customLogin", method = RequestMethod.GET)
	public void customLogin() {
		logger.debug(" customLogin() 호출 ");
	}

	// 커스텀 로그아웃 페이지 /customLogout
	@RequestMapping(value = "/customLogout", method = RequestMethod.GET)
	public void customLogout() {
		logger.debug(" customLogout() 호출 ");
		logger.debug(" 로그아웃 ");
	}

	// 로그인 후 메인페이지
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void mainPage(Model model, HttpSession session) throws Exception {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		try {
			int employee_id = Integer.parseInt(authentication.getName());
			model.addAttribute("employee_id", employee_id);
			logger.debug(" 메인페이지 ");

			EmployeeVO evo = cService.getEmpInfo(employee_id);
			session.setAttribute("evo", evo);
			logger.debug("evo : " + evo);
		} catch (NumberFormatException e) {
			// e.printStackTrace();
		}

		// 재직 사원 수
		model.addAttribute("currentEmpCnt", cService.getCurrentEmpCnt());
		// 전체 사원 수
		model.addAttribute("allEmpCnt", cService.getAllEmpCnt());
		// 올해 입사자 수
		model.addAttribute("newEmpCnt",cService.getNewEmptCnt());		
		// 부서 정보
		model.addAttribute("deptInfo", cService.getdeptInfo());
		// 직책 정보
		model.addAttribute("jobInfo", cService.getJobInfo());
	}

	// 비밀번호 변경 페이지
	// http://localhost:8088/common/chagePw
	@RequestMapping(value = "/changePw", method = RequestMethod.GET)
	public void changePasswdGET() {
		logger.debug(" changePasswdGET() 호출 ");
	}

	@RequestMapping(value = "/changePw", method = RequestMethod.POST)
	public String changePasswdPOST(@RequestParam("currentPw") String currentPw, @RequestParam("newPw") String newPw,
			@RequestParam("confirmNewPw") String confirmNewPw) throws Exception {
		logger.debug(" changePasswdPOST() 호출 ");
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		int employee_id = Integer.parseInt(authentication.getName()); // 현재 사용자의 사용자명 가져오기
		String passwd = cService.getPass(employee_id);

		Map<String, Object> loginInfo = new HashMap<>();
		loginInfo.put("employee_id", employee_id);
		loginInfo.put("newPw", pwEncoder.encode(newPw));

		logger.debug(" passwd : " + passwd);
		logger.debug(" employee_id : " + employee_id);
		logger.debug(" currentPw : " + currentPw);
		logger.debug(" confirmNewPw : " + confirmNewPw);
		logger.debug(" newPw : " + newPw);
		logger.debug(" pwEncoder.encode(currentPw) : " + pwEncoder.encode(currentPw));
		logger.debug(" pwEncoder.encode(newPw) : " + pwEncoder.encode(newPw));

		if (pwEncoder.matches(currentPw, passwd) && newPw.equals(confirmNewPw)) {
			cService.changePass(loginInfo);
			return "redirect:/common/main";
		} else {
			return "redirect:/common/changePw?error=1";
		}
	}

}
