package com.bswill.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class LeaveVO {

	private int leave_no;				// 휴가번호
	private int employee_id;			// 사원번호
	private Timestamp creation_date;	// 휴가 생성일
	private String leave_type;			// 휴가 종류
	private int leave_days;				// 휴가 일수

	private String emp_name;			// 사원명
	private String deptnm;				// 부서명

}
