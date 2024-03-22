package com.bswill.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bswill.domain.NotificationVO;
import com.bswill.persistence.NotificationDAO;

@Service
public class NotificationServiceImpl implements NotificationService{

	// DAO 객체 주입
    @Inject
    private NotificationDAO ndao;
    
	private static final Logger logger = LoggerFactory.getLogger(NotificationServiceImpl.class);

	@Override
	public NotificationVO notiInfo(int employee_id) throws Exception{
		logger.debug(" notiInfo(int employee_id) 실행 ");
		return ndao.selectNoti(employee_id);
	}

	@Override
	public List<NotificationVO> notiList() throws Exception {
		logger.debug(" notiList() 실행 ");
	    return ndao.notiListSelect();
	}

	@Override
	public void read(int employee_id)throws Exception {
		logger.debug(" read(int employee_id) 실행 ");
		ndao.readNoti(employee_id);
	}

	@Override
	public void delete(int employee_id) throws Exception{
		logger.debug(" delete(int emplpyee_id) 실행 ");
		ndao.deleteNoti(employee_id);
	}

	@Override
	public void send(NotificationVO vo)throws Exception {
		logger.debug(" send(NotificationVO vo) 실행 ");
		ndao.sendNoti(vo);
	}


	@Override
	public void deleteAll() throws Exception{
		logger.debug(" deleteAll() 실행 ");
		ndao.deleteAllNoti();
	}
	
	
	
	
}
