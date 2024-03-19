package com.bswill.service;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.bswill.domain.NotificationVO;
import com.bswill.persistence.NotificationDAO;

@Repository
public class NotificationServiceImpl implements NotificationService{

	@Inject
	private NotificationDAO ndao;
	
	@Override
	public NotificationVO selectNoti(int employee_id) {
		
			
		return null;
	}

}
