package com.bswill.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class SearchCriteria extends AttendanceCri {

	// 기간
	private String startDate;
	private String endDate;

	// 기준년도
	private String baseYear;

	// 일
	private String searchDate;
	
	// 부서
	private String department;

	// 승인여부
	private String approval;

	// 휴가항목
	private String leaveType;

	// 검색유형
	private String searchType;

	// 검색어
	private String keyword;

}
