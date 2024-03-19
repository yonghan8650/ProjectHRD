package com.bswill.service;

import com.bswill.domain.NotificationVO;

public interface NotificationService {

	// 알림 조회
	public NotificationVO selectNoti(int employee_id);
	
}
