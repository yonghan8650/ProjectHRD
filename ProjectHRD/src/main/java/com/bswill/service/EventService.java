package com.bswill.service;

import java.util.List;
import java.util.Map;

import com.bswill.domain.EventVO;
import com.bswill.domain.NotificationVO;

public interface EventService {

	public void applyEvent(EventVO vvo) throws Exception;

	public List<EventVO> viewEmpEventList(Integer employee_id, String searchType, String keyword) throws Exception;

	public List<EventVO> listAllEvent(String searchType, String keyword) throws Exception;

	public Map<String, Object> viewEmpSalary(Integer employee_id) throws Exception;

	public void modifyEventAuthApprove(EventVO vvo) throws Exception;

	public void modifyEventAuthReject(EventVO vvo) throws Exception;

	public void notifyModification(NotificationVO nvo) throws Exception;

}
