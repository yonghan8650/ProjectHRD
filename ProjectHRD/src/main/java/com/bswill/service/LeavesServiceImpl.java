package com.bswill.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bswill.domain.LeaveVO;
import com.bswill.domain.ReqLeavesVO;
import com.bswill.domain.SearchCriteria;
import com.bswill.persistence.LeavesDAO;

@Service
public class LeavesServiceImpl implements LeavesService {

	@Inject
	private LeavesDAO ldao;

	private static final Logger logger = LoggerFactory.getLogger(LeavesServiceImpl.class);

	// 휴가 신청 목록
	@Override
	public List<ReqLeavesVO> leaveReqList(SearchCriteria cri) throws Exception {
		logger.debug(" === S :  leaveReqList(SearchCriteria cri) 실행 === ");
		return ldao.leaveReqList(cri);
	}

	// 휴가 승인
	@Override
	public void leaveApproval(int req_leave_no) throws Exception {
		logger.debug(" === S :  leaveApproval(int req_leave_no) 실행 === ");
		ldao.leaveApproval(req_leave_no);
	}

	// 휴가 반려
	@Override
	public void leaveRejection(int req_leave_no) throws Exception {
		logger.debug(" === S :  leaveRejection(int req_leave_no) 실행 === ");
		ldao.leaveRejection(req_leave_no);
	}

}
