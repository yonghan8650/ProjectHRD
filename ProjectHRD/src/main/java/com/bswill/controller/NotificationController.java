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
	public void listGet(@RequestParam("employee_id")int employee_id,Model model,HttpSession session) throws Exception{
		logger.debug(" /notifications -> listGet() 실행 ");
		logger.debug(" /notifications.jsp 이동 ");
	
		// 알림 목록 받기 -> DAO 
		List<NotificationVO> notiListSelect = nService.notiList(employee_id);	
		logger.debug(" list.size : "+ notiListSelect.size());
		// 알림 목록 값을 페이지에 전달(Model)
		model.addAttribute("notiListSelect",notiListSelect);
		
		// 세션에서 알림 개수 가져오기  -> 초기 값은 0으로 설정
        Integer notificationCount = (Integer) session.getAttribute("notificationCount");
        if (notificationCount == null) {
            notificationCount = 0;
        }
        
        // 모델에 알림 개수를 설정하여 뷰페이지로 전달
		model.addAttribute("notificationCount", notificationCount);
		
		// 알림 개수 가져오기
		int NotificationCounts = nService.getNotificationCount(employee_id); // 적절한 메서드명으로 변경해야 합니다.

		// 모델에 알림 개수 추가
		model.addAttribute("notificationCount", NotificationCounts);


	}
	
	// 알림 읽음
	@RequestMapping(value = "/readNoti",method = RequestMethod.GET)
	public String readNotification(RedirectAttributes rttr,@RequestParam("employee_id")int employee_id,Model model,HttpSession session)throws Exception {
		logger.debug(" /readNoti -> read 실행 ");
		
		
            
	    // 서비스에서 데이터 받기 -> 데이터 받은후 읽기 동작
	    nService.read(employee_id);



         
	    // 읽기 동작 이후 뷰페이지로 이동
        return "redirect:/noti/notifications";
		
		
		
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
}
