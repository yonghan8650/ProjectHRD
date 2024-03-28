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

}
