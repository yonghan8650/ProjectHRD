package com.bswill.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bswill.domain.AttendanceCri;
import com.bswill.domain.AttendanceVO;
import com.bswill.persistence.AttendanceDAO;

@Service
public class AttendanceServiceImpl implements AttendanceService {

	@Inject
	private AttendanceDAO adao;

	private static final Logger logger = LoggerFactory.getLogger(AttendanceServiceImpl.class);

	// 출퇴근 목록 조회 검색 + 페이징
	@Override
	public List<AttendanceVO> selectAttendanceList(AttendanceCri cri) throws Exception {
		logger.debug(" === selectAttendanceList() 실행 === ");

		return adao.attendanceList(cri);
	}

	// 행삭제
	@Override
	public void deleteAttendance(int att_no) throws Exception {
		logger.debug(" S : === deleteAttendance(int att_no) 실행 === ");

		adao.deleteAttendance(att_no);
	}

}
