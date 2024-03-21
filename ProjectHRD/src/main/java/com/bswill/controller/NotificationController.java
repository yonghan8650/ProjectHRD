package com.bswill.controller;


import java.util.List;

import javax.inject.Inject;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bswill.domain.NotificationVO;
import com.bswill.service.NotificationService;
import com.bswill.service.NotificationServiceImpl;

@Controller
@RequestMapping(value = "/*")
public class NotificationController {

	// 서비스 객체 주입
	@Inject
	private NotificationService nService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(NotificationController.class);
	
	// 알림 목록 조회
	// http://localhost:8088/notifications
	@RequestMapping(value = "/notifications",method = RequestMethod.GET)
	public void listGet(Model model) throws Exception{
		logger.debug(" /notifications -> listGet() 실행");
		logger.debug(" /notifications.jsp 연결 ");
		// 서비스 -> DAO 알림 목록 가져오기
		List<NotificationVO> notiList = nService.notiList();
	
		logger.debug(" list.size : "+ notiList.size());
		// 연결된 뷰페이지에 정보 정달(Model)
		model.addAttribute("notiList",notiList);
	}
	
	// 알림 읽음
	// 
	@RequestMapping(value = "/readNoti",method = RequestMethod.GET)
	public String readNotification(@RequestParam("employee_id")int employee_id,Model model)throws Exception {
		logger.debug(" /readNoti -> read 실행 ");
		logger.debug(" /readNoti.jsp 연결 ");
		// 서비스 -> DAO 알림 읽음
		try {
            // 알림을 읽음
            nService.read(employee_id);
            
		} catch (Exception e) {
            // 예외 처리
            e.printStackTrace();
            // 예외 상황에 따른 처리를 할 수 있음
        }
        return "readNoti";
		
		
		
	}
	
	
	
	
}
