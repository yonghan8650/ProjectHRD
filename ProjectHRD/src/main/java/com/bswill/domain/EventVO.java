package com.bswill.domain;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class EventVO {

	private int employee_id;
	private String eve_class;
	private String eve_subject;
	private Date eve_date;
	private Timestamp req_date;
	private int eve_amount;
	private String eve_auth;

}
