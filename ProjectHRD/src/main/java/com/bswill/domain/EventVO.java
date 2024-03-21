package com.bswill.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class EventVO {

	private int employee_id;
	private int eve_class;
	private String eve_subject;
	private Timestamp eve_date;
	private Timestamp req_date;
	private int eve_amount;
	private int eve_auth;

}
