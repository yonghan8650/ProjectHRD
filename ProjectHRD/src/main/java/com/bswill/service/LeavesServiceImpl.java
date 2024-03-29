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

	// 연차 목록 조회
	@Override
	public List<LeaveVO> annualLeaveList(SearchCriteria cri) throws Exception {
		logger.debug(" === S :  annualLeaveList(SearchCriteria cri) 실행 === ");
		return ldao.annualLeaveList(cri);
	}

	// 연차 삭제
	@Override
	public void deleteAnnualLeave(int leave_no) throws Exception {
		logger.debug(" === S :  deleteAnnualLeave(int leave_no) 실행 === ");
		ldao.deleteAnnualLeave(leave_no);
	}

	// 연차 생성 가능 사원 목록
	@Override
	public List<LeaveVO> canCreateAnnualLeaveList(SearchCriteria cri) throws Exception {
		logger.debug(" === S :  canCreateAnnualLeaveList() 실행 === ");
		return ldao.canCreateAnnualLeaveList(cri);
	}

	// 연차 생성 가능 사원 정보 가져오기
	@Override
	public LeaveVO canCreateAnnualLeave(int employee_id) throws Exception {
		logger.debug(" === S :  canCreateAnnualLeave(int employee_id) 실행 === ");
		return ldao.canCreateAnnualLeave(employee_id);
	}

	// 해당년도 휴가 갯수 세어오기
	@Override
	public LeaveVO selectLeaveCount() throws Exception {
		logger.debug(" === S :  selectLeaveCount() 실행 === ");
		return ldao.selectLeaveCount();
	}

	// 연차 생성
	@Override
	public void createAnnualLeave(LeaveVO vo) throws Exception {
		logger.debug(" === S :  createAnnualLeave() 실행 === ");
		ldao.createAnnualLeave(vo);
	}

}
