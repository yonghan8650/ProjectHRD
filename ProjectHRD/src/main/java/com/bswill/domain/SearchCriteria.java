package com.bswill.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class SearchCriteria extends AttendanceCri{

	// 기간
	private Timestamp startDate;
	private Timestamp endDate;
	
	// 일
	private Timestamp searchDate;
	
	// 검색유형
	private String searchType;
	
	// 검색어
	private String keyword;
}
