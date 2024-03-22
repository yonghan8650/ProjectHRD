package com.bswill.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Req_leavesVO {

	private int Req_leave_no;
	private int employee_id;
	private Timestamp req_leave_date;
	private String leave_type;
	private Timestamp start_date;
	private Timestamp end_date;
	private int leave_days;
	private String reason;
	// approval
	
}
