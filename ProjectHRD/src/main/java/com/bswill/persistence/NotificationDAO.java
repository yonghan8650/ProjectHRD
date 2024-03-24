package com.bswill.persistence;

import java.util.List;

import com.bswill.domain.NotificationVO;

public interface NotificationDAO {

	
	
	// 알림 목록 조회
	public List<NotificationVO> notiListSelect(int employee_id) throws Exception;
	
	// 알림 개수
	public int notificationCount(int employee_id)throws Exception;
	
	// 알림 읽음
	public void readNoti(int employee_id)throws Exception;
	
	// 알림 삭제
	public void deleteNoti(int employee_id)throws Exception;
	
	// 알림 출력 확인
	public void sendNoti(NotificationVO vo)throws Exception;
	
	
	// 알림 전체 삭제
	public void deleteAllNoti()throws Exception;
	
	
}
