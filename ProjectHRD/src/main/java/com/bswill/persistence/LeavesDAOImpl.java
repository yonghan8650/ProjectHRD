package com.bswill.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bswill.domain.LeaveVO;
import com.bswill.domain.ReqLeavesVO;
import com.bswill.domain.SearchCriteria;

@Repository
public class LeavesDAOImpl implements LeavesDAO {

	@Inject
	private SqlSession sqlSession;

	private static final Logger logger = LoggerFactory.getLogger(LeavesDAOImpl.class);

	private static final String NAMESPACE = "com.bswill.mapper.LeavesMapper";

	// 휴가 신청 목록
	@Override
	public List<ReqLeavesVO> leaveReqList(SearchCriteria cri) throws Exception {
		logger.debug(" D : === leaveReqList(SearchCriteria cri) 호출 === ");

		return sqlSession.selectList(NAMESPACE + ".leaveReqList", cri);
	}

	// 휴가 승인
	@Override
	public void leaveApproval(int req_leave_no) throws Exception {
		logger.debug(" D : === leaveApproval(int req_leave_no) 호출 === ");
		sqlSession.update(NAMESPACE + ".leaveApproval", req_leave_no);
	}

	// 휴가 반려
	@Override
	public void leaveRejection(int req_leave_no) throws Exception {
		logger.debug(" D : === leaveRejection(int req_leave_no) 호출 === ");
		sqlSession.update(NAMESPACE + ".leaveRejection", req_leave_no);

	}

	// 연차 목록 조회
	@Override
	public List<LeaveVO> annualLeaveList(SearchCriteria cri) throws Exception {
		logger.debug(" D : === annualLeaveList(SearchCriteria cri) 호출 === ");
		return sqlSession.selectList(NAMESPACE + ".annualLeaveList", cri);
	}

	// 연차삭제
	@Override
	public void deleteAnnualLeave(int leave_no) throws Exception {
		logger.debug(" D : === deleteAnnualLeave(int leave_no) 호출 === ");
		sqlSession.delete(NAMESPACE + ".deleteAnnualLeave", leave_no);
	}

	// 연차 생성 가능 사원 목록
	@Override
	public List<LeaveVO> canCreateAnnualLeaveList(SearchCriteria cri) throws Exception {
		logger.debug(" D : === canCreateAnnualLeaveList() 호출 === ");
		return sqlSession.selectList(NAMESPACE + ".canCreateLeaveList",cri);
	}
	
	// 연차 생성 가능 사원 정보 가져오기
	@Override
	public LeaveVO canCreateAnnualLeave(int employee_id) throws Exception {
		logger.debug(" D : === canCreateAnnualLeave(int employee_id) 호출 === ");
		return sqlSession.selectOne(NAMESPACE + ".canCreateLeaveOne",employee_id);
	}

	// 해당년도 휴가 갯수 세어오기
	@Override
	public LeaveVO selectLeaveCount() throws Exception {
		logger.debug(" D : === selectLeaveCount() 호출 === ");
		return sqlSession.selectOne(NAMESPACE + ".selectLeaveCount");
	}

	// 연차 생성
	@Override
	public void createAnnualLeave(LeaveVO vo) throws Exception {
		logger.debug(" D : === createAnnualLeave() 호출 === ");
		sqlSession.selectOne(NAMESPACE + ".createAnnualLeave", vo);
	}

	

}
