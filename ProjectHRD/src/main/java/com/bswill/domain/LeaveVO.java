package com.bswill.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class LeaveVO {

	private int leave_no;
	private int employee_id;
	private Timestamp creation_date;
	private String leave_type;
	private int leave_days;

}
