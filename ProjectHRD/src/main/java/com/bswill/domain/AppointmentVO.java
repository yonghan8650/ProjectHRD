package com.bswill.domain;

import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class AppointmentVO {

	private int employee_id;
	private int app_issue;
	private String app_content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Timestamp app_date;

}
