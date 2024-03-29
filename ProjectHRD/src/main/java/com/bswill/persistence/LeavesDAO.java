package com.bswill.persistence;

import java.util.List;

import com.bswill.domain.LeaveVO;
import com.bswill.domain.ReqLeavesVO;
import com.bswill.domain.SearchCriteria;

public interface LeavesDAO {

	// 휴가 신청 목록
	public List<ReqLeavesVO> leaveReqList(SearchCriteria cri) throws Exception;

	// 휴가 승인
	public void leaveApproval(int req_leave_no) throws Exception;

	// 휴가 반려
	public void leaveRejection(int req_leave_no) throws Exception;

	// 연차 목록 조회
	public List<LeaveVO> annualLeaveList(SearchCriteria cri) throws Exception;

	// 연차 삭제
	public void deleteAnnualLeave(int leave_no) throws Exception;

	// 연차 생성 가능 사원 목록
	public List<LeaveVO> canCreateAnnualLeaveList(SearchCriteria cri) throws Exception;
	
	// 연차 생성 가능 사원 정보 가져오기
	public LeaveVO canCreateAnnualLeave(int employee_id) throws Exception;

	// 해당년도 휴가 갯수 세어오기
	public LeaveVO selectLeaveCount() throws Exception;

	// 연차 생성
	public void createAnnualLeave(LeaveVO vo) throws Exception;

}
