package com.bswill.service;

import java.util.List;

import com.bswill.domain.NotificationVO;

public interface NotificationService {

	
	// 알림 목록 조회 동작
	public List<NotificationVO> notiList(int employee_id) throws Exception;
	
	// 알림 개수 카운트 동작
	public int getNotificationCount(int employee_id) throws Exception;
	
	// 알림 읽기 동작
	public void read(int employee_id) throws Exception;
	
	// 알림 삭제 동작
	public void delete(int employee_id) throws Exception;
	
	// 알림 출력 여부 확인 동작
	public void send(NotificationVO vo) throws Exception;
	

	
	// 알림 전체 삭제 동작
	public void deleteAll() throws Exception;
	
}
