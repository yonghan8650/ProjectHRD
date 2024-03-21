package com.bswill.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AttendanceVO {
	
	private int att_no;
	private int employee_id;
	private Timestamp att_date;
	private Timestamp start_time;
	private Timestamp finish_time;
	private Timestamp break_time;
	private String work_type;

}
