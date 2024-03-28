package com.bswill.domain;


import java.sql.Time;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AttendanceVO {


	private int att_no;				// 출퇴근번호
	private int employee_id;		// 사원번호
	private Timestamp att_date;		// 출근 날짜
	private Time start_time;		// 출근시각
	private Time finish_time;		// 퇴근시각
	private String work_type;		// 근무유형
	
	private Time break_time;		// 휴게시간
	private Time work_time;			// 근로시간
	
	private String emp_name;		// 사원이름
	private String job;				// 직책
	private String deptnm;			// 부서

	

}
