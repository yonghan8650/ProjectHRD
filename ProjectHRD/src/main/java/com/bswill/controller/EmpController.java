package com.bswill.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bswill.domain.AppointmentVO;
import com.bswill.domain.EmployeeVO;
import com.bswill.domain.LicenseVO;
import com.bswill.service.EmployeeService;

@Controller
@RequestMapping(value = "/emp/*")
public class EmpController {

	private static final Logger logger = LoggerFactory.getLogger(EmpController.class);

	@Inject
	private EmployeeService eService;

	// http://localhost:8088/emp/registEmp
	@RequestMapping(value = "/registEmp", method = RequestMethod.GET)
	public void registEmpGET(Model model) throws Exception {
		logger.debug("registEmpGET() 호출");

		model.addAttribute("empno", eService.countEmpNo());
	}

	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String registEmpPOST(EmployeeVO evo/*, LicenseVO lvo, AppointmentVO avo*/, MultipartFile profileImage) throws Exception {
		logger.debug("registEmpPOST() 호출");

		logger.debug("evo" + evo);
		// logger.debug("lvo" + lvo);
		// logger.debug("avo" + avo);
		
		// 이미지 파일을 서버에 저장
		// String uploadedFileName = saveProfileImage(profileImage);

		// 사원 정보에 이미지 파일명 설정
		// evo.setPROFIL(uploadedFileName);

		// 사원 정보와 이미지 파일명을 데이터베이스에 저장
		// eService.registerEmployee(evo);

		return "redirect:/emp/viewEmp?employee_id=" + evo.getEmployee_id();
	}

	private String saveProfileImage(MultipartFile profileImage) throws Exception {
		if (profileImage.isEmpty()) {
			throw new Exception("이미지를 선택하세요.");
		}

		try {
			// 이미지를 서버에 저장
			String fileName = UUID.randomUUID().toString() + "_" + profileImage.getOriginalFilename();
			String uploadDir = "D:/upload/temp/";
			Path uploadPath = Paths.get(uploadDir);
			if (!Files.exists(uploadPath)) {
				Files.createDirectories(uploadPath);
			}
			Path filePath = uploadPath.resolve(fileName);
			Files.copy(profileImage.getInputStream(), filePath);

			// 이미지 파일 이름만 반환
			return fileName;
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("이미지 업로드 실패: " + e.getMessage());
		}
	}

	@RequestMapping(value = "/registEmp", method = RequestMethod.POST)
	public String registEmpPOST(@RequestParam("license") String[] liarr) throws Exception {
		logger.debug("registEmpPOST() 호출");

		return "listEmp";
	}

	// http://localhost:8088/emp/listEmp
	@RequestMapping(value = "listEmp", method = RequestMethod.GET)
	public void listEmpGET(Model model, HttpSession session) throws Exception {
		logger.debug("listEmpGET()");

		model.addAttribute("listEmp", eService.listEmp());

	}

	// http://localhost:8088/emp/viewEmp
	@RequestMapping(value = "viewEmp", method = RequestMethod.GET)
	public void viewEmpGET(@RequestParam("employee_id") int employee_id, Model model) throws Exception {
		logger.debug("viewEmpGET()");

		logger.debug("vo" + eService.viewEmp(employee_id));

		model.addAttribute("viewEmpVO", eService.viewEmp(employee_id));
	}
}
