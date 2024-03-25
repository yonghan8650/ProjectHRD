package com.bswill.controller;


import java.sql.Timestamp;
import java.util.ArrayList;
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

import com.bswill.domain.NotificationVO;
import com.bswill.service.NotificationService;


@Controller
@RequestMapping(value = "/noti/*")
public class NotificationController {

	// 서비스 객체주입
	@Inject
	private NotificationService nService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(NotificationController.class);
	
	// 알림 목록
	// http://localhost:8088/noti/notifications
	@RequestMapping(value = "/notifications",method = RequestMethod.GET)
	public void listGet(Model model,HttpSession session) throws Exception{
		logger.debug(" /notifications -> listGet() 실행 ");
		logger.debug(" /notifications.jsp 이동 ");

		// security 사용해서 로그인 처리 후 -> 로그인 확인
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		if (authentication != null && authentication.isAuthenticated()) {
			// 인증된 사용자인 경우에만 알림 목록을 가져옴
			int employee_id = Integer.parseInt(authentication.getName());
			logger.debug("employee_id : " + employee_id);
			// 알림 목록 받기 -> DAO
			List<NotificationVO> notiListSelect = nService.notiList(employee_id);
			logger.debug(" list.size : " + notiListSelect.size());
			// 알림 목록 값을 페이지에 전달(Model)
			model.addAttribute("notiListSelect", notiListSelect);

			// 각 알림의 읽음 여부를 확인하여 모델에 추가합니다.
	        List<String> readStatusList = new ArrayList<>();
	        for (NotificationVO notification : notiListSelect) {
	            readStatusList.add(notification.getNoti_check());
	        }
	        model.addAttribute("readStatusList", readStatusList);
			
			// 세션에서 알림 개수 가져오기 -> 초기 값은 0으로 설정
			Integer notificationCount = (Integer) session.getAttribute("notificationCount");
			if (notificationCount == null) {
				notificationCount = 0;
			}

			// 모델에 알림 개수를 설정하여 뷰페이지로 전달
			model.addAttribute("notificationCount", notificationCount);

			// 알림 개수 가져오기
			int notificationCounts = nService.getNotificationCount(employee_id);

			// 모델에 알림 개수 추가
			model.addAttribute("notificationCount", notificationCounts);
		} else {
			// 인증되지 않은 사용자는 로그인 페이지로 리다이렉트 또는 다른 처리를 수행할 수 있음
			// 여기서는 로깅만 수행
			logger.debug("사용자가 인증되지 않았습니다.");
		}
    

	}
	
	// 알림 전체 확인
	@RequestMapping(value = "/readAllNoti", method = RequestMethod.POST)
	public String readAllNotification(RedirectAttributes rttr,/* @RequestParam(value = "employee_id", required = false) Integer employee_id,*/ Model model, HttpSession session) throws Exception {
	    logger.debug(" /readAllNoti -> readAll 실행 ");

	    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    if (authentication != null && authentication.isAuthenticated()) {
	        int employee_id = Integer.parseInt(authentication.getName());
	        nService.readAll(employee_id); // 알림 모두 읽기 동작 호출
	    }
	    return "redirect:/noti/notifications"; // 알림 목록 페이지로 리다이렉트
	}

	// 알림 읽음
	@RequestMapping(value = "/readNoti", method = RequestMethod.POST)
	public String readNotification(RedirectAttributes rttr, @RequestParam("employee_id") int employee_id, @RequestParam("noti_title") String noti_title, @RequestParam("noti_time") Timestamp noti_time, Model model, HttpSession session) throws Exception {
	    logger.debug(" /readNoti -> read 실행 ");

	    try {
	        // 서비스를 통해 알림을 읽음
	        nService.read(employee_id, noti_title, noti_time); 
	        
	        // 읽기 동작 이후 알림 목록 페이지로 리다이렉트
	        return "redirect:/noti/notifications";
	    } catch(Exception e) {
	        // 예외 발생 시 알림 목록 페이지로 리다이렉트
	        return "redirect:/noti/notifications";
	    }
	}

	
	// 알림 삭제
	@RequestMapping(value = "/deleteNoti",method = RequestMethod.POST)
	public String deleteNotification(RedirectAttributes rttr,@RequestParam("employee_id")int employee_id,HttpSession session)throws Exception {
	
		logger.debug(" /deleteNoti -> deleteNotification() 실행 ");
		
		
		
			// 서비스에서 데이터 받기 -> 삭제 동작
			nService.delete(employee_id);
			
			
			// 삭제 이후 뷰페이지로 이동
			return "redirect:/noti/notifications";
	
		
		
	}
	
	// 알림 전체 삭제
	@RequestMapping(value = "/deleteAllNoti",method = RequestMethod.POST)
	public String deleteAllNotifications(RedirectAttributes rttr ,HttpSession session) throws Exception{
		logger.debug(" /deleteNoti -> deleteAllNotification() 실행 ");
		
		// 서비스에서 데이터 받기 -> 전체 삭제 동작
		nService.deleteAll();
		
		// 전체 삭제후 뷰페이지로 이동
		return "redirect:/noti/notifications";
	}
	
	@RequestMapping(value = "/notiLink", method = RequestMethod.GET)
	public String notiLink(@RequestParam("link") String link, Model model) throws Exception {
	    // 링크에 따른 처리를 수행 (예: 데이터베이스에서 추가 정보를 가져오거나, 다른 작업 수행)
	    // 여기서는 해당 링크가 있는 알림을 읽음 상태로 변경하는 작업을 수행하고, 그 후에 해당 링크로 이동합니다.
	    nService.moveLink(link); // 링크에 해당하는 알림을 읽음 상태로 변경하는 작업 호출
	    return "redirect:" + link; // 링크로 리다이렉트
	}
}