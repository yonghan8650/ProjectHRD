package com.bswill.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AppointmentVO {

	private int employee_id;
	private int app_issue;
	private String app_content;
	private Timestamp app_date;

}
