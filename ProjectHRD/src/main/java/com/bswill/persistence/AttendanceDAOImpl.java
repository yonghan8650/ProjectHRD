package com.bswill.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bswill.domain.AttendanceCri;
import com.bswill.domain.AttendanceVO;
import com.bswill.domain.DepartmentVO;

@Repository
public class AttendanceDAOImpl implements AttendanceDAO {

	@Inject
	private SqlSession sqlSession;

	private static final Logger logger = LoggerFactory.getLogger(AttendanceDAOImpl.class);

	private static final String NAMESPACE = "com.bswill.mapper.AttendanceMapper";

	// 출퇴근 목록 조회 검색 + 페이징
	@Override
	public List<AttendanceVO> attendanceList(AttendanceCri cri) throws Exception {
		logger.debug(" === attendanceList(AttendanceCri cri) 실행 === ");
		return sqlSession.selectList(NAMESPACE + ".attendanceList");
	}

	// 행삭제
	@Override
	public void deleteAttendance(int att_no) throws Exception {
		logger.debug(" D : === deleteAttendance(int att_no) 실행 === ");
		sqlSession.delete(NAMESPACE + ".deleteAttendance", att_no);
	}

	// 부서 불러오기
	@Override
	public List<DepartmentVO> departmentList() throws Exception {
		logger.debug(" D : === departmentList() 실행 === ");
		return sqlSession.selectList(NAMESPACE + ".selectDep");
	}

}
