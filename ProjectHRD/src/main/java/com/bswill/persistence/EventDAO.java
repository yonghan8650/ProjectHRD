package com.bswill.persistence;

import java.util.List;
import java.util.Map;

import com.bswill.domain.EventVO;
import com.bswill.domain.NotificationVO;

public interface EventDAO {

	public void insertEvent(EventVO vvo) throws Exception;

	public List<EventVO> selectEmpEvent(Integer employee_id, String searchType, String keyword) throws Exception;

	public List<EventVO> selectEventList(String searchType, String keyword) throws Exception;

	public Map<String, Object> selectEmpSalary(Integer employee_id) throws Exception;

	public void updateEventAuthApprove(EventVO vvo) throws Exception;
	
	public void updateEventAuthReject(EventVO vvo) throws Exception;
	
	public void insertNotiEventAuth(NotificationVO nvo) throws Exception;

}
