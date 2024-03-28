package com.bswill.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bswill.domain.EventVO;
import com.bswill.domain.NotificationVO;
import com.bswill.persistence.EventDAO;

@Service
public class EventServiceImpl implements EventService {

	private static final Logger logger = LoggerFactory.getLogger(EventServiceImpl.class);

	@Inject
	EventDAO vdao;

	@Override
	public void applyEvent(EventVO vvo) throws Exception {
		logger.debug("applyEvent(EventVO vvo) 호출");

		vdao.insertEvent(vvo);
	}

	@Override
	public List<EventVO> viewEmpEventList(Integer employee_id, String searchType, String keyword) throws Exception {
		logger.debug("viewEmpEventList(Integer employee_id, String searchType, String keyword) 호출");

		return vdao.selectEmpEvent(employee_id, searchType, keyword);
	}

	@Override
	public List<EventVO> listAllEvent(String searchType, String keyword) throws Exception {
		logger.debug("listEvent(String searchType, String keyword) 호출");

		return vdao.selectEventList(searchType, keyword);
	}

	@Override
	public Map<String, Object> viewEmpSalary(Integer employee_id) throws Exception {
		logger.debug("viewEmpSalary(Integer employee_id) 호출");

		return vdao.selectEmpSalary(employee_id);
	}

	@Override
	public void modifyEventAuthApprove(EventVO vvo) throws Exception {
		logger.debug("modifyEventAuthApprove(EventVO vvo) 호출");

		vdao.updateEventAuthApprove(vvo);
	}

	@Override
	public void modifyEventAuthReject(EventVO vvo) throws Exception {
		logger.debug("modifyEventAuthReject(EventVO vvo) 호출");

		vdao.updateEventAuthReject(vvo);
	}

	@Override
	public void notifyModification(NotificationVO nvo) throws Exception {
		logger.debug("notifyModification(NotificationVO nvo) 호출");

		vdao.insertNotiEventAuth(nvo);
	}

}
