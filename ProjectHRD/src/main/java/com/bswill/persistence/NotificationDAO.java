package com.bswill.persistence;

import java.sql.Timestamp;
import java.util.List;

import com.bswill.domain.NotificationVO;

public interface NotificationDAO {

	
	
	// 알림 목록 조회
	public List<NotificationVO> notiListSelect(int employee_id) throws Exception;
	
	// 알림 개수
	public int notificationCount(int employee_id) throws Exception;
	
	// 알림 읽음
	public void readNoti(int employee_id,String noti_title,Timestamp noti_time) throws Exception;
	
	// 알림 전체 읽음
	public void readAllNoti(int employee_id) throws Exception;
	
	// 알림 삭제
	public void deleteNoti(int employee_id) throws Exception;
	
	// 알림 출력 확인
	public void sendNoti(NotificationVO vo) throws Exception;
	
	// 알림 전체 삭제
	public void deleteAllNoti() throws Exception;
	
	// 알림 링크
	public void link(String noti_link) throws Exception;
	
	// 알림을 읽은 상태로 표시하는 메서드 추가
    void markAsRead(String noti_Link) throws Exception;
}
