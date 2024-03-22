package com.bswill.service;

import java.util.List;

import com.bswill.domain.AttendanceCri;
import com.bswill.domain.AttendanceVO;

public interface AttendanceService {

	// 출퇴근 목록 조회 검색 + 페이징<!-- 페이징 수정해야함 -->
	public List<AttendanceVO> selectAttendanceList(AttendanceCri cri) throws Exception;

	// 행삭제
	public void deleteAttendance(int att_no) throws Exception;

}
