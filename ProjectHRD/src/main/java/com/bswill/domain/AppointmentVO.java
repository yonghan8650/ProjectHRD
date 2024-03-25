package com.bswill.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class AppointmentVO {

	private int employee_id;
	private String app_issue;
	private String app_content;
	private Date app_date;

}
