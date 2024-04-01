package com.bswill.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class LeaveVO {

	private int leave_no;				// 휴가번호
	private int employee_id;			// 사원번호
	private String creation_date;		// 휴가 생성일
	private String leave_type;			// 휴가 종류
	private int leave_days;				// 휴가 일수

	private String emp_name;			// 사원명
	private int deptid;					// 부서 번호
	private String deptnm;				// 부서명
	private String start_date;			// 입사일

	private int years_of_service;		// 근속연수
	
	// 휴가 사용기간
	private String beginDate;			// 휴가 사용기간 시작일
	private String finishDate;			// 휴가 사용기간 종료일
}

