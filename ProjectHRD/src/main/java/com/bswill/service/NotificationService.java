package com.bswill.service;

import java.sql.Timestamp;
import java.util.List;

import com.bswill.domain.NotificationVO;

public interface NotificationService {

	
	// 알림 목록 조회 동작
	public List<NotificationVO> notiList(int employee_id) throws Exception;
	
	// 알림 개수 카운트 동작
	public int getNotificationCount(int employee_id) throws Exception;
	
	// 알림 읽기 동작
	public void read(int employee_id,String noti_title,Timestamp noti_time) throws Exception;
	
	// 알림 전체 읽기 동작
	public void readAll(int employee_id) throws Exception;
	
	// 알림 삭제 동작
	public void delete(int employee_id) throws Exception;
	
	// 알림 출력 여부 확인 동작
	public void send(NotificationVO vo) throws Exception;	
	
	// 알림 전체 삭제 동작
	public void deleteAll() throws Exception;
	
	// 알림 링크 이동 동작
	public void moveLink(String noti_link) throws Exception;
	
	// 알림을 읽은 상태로 표시하는 메서드 추가
    public void markAsRead(String noti_Link) throws Exception;
    
    // 알림 출력 여부 업데이트
    public void updatePrintStatus(int employee_id, String noti_title, Timestamp noti_time, String noti_print) throws Exception;
}

