package com.bswill.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bswill.service.NotificationService;

@Controller
public class NotificationController {

	@Inject
	private NotificationService nService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(NotificationController.class);
	
	// 알림 조회
	// http://localhost:8088/notifications
	@RequestMapping(value = "/notifications",method = RequestMethod.GET)
	public void selectNoti(Model model,int employee_id,HttpSession session) throws Exception{
		logger.debug(" /notifications 실행");
		logger.debug(" /notifications.jsp 연결 ");
	
		
		
	}
	
}
