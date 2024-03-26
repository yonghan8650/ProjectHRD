package com.bswill.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReqLeavesVO {

	private int Req_leave_no;			// 휴가 신청 번호
	private int employee_id;			// 사원 번호
	private String req_leave_date;		// 휴가 신청일
	private String leave_type;			// 휴가 종류
	private String start_date;			// 휴가 시작일
	private String end_date;			// 휴가 종료일
	private int leave_days;				// 휴가 일수
	private String reason;				// 휴가 사유
	private String approval;			// 휴가 승인여부

	private String emp_name;			// 사원명
	private String deptnm;				// 부서명

	
	
}
