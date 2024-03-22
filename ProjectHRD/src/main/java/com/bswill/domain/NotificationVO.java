package com.bswill.domain;

import java.sql.Timestamp;

import lombok.Data;


@Data
public class NotificationVO {

	private int employee_id;
	private String noti_title;
	private Timestamp noti_time;
	private String noti_check;
	private Timestamp read_time;
	private String noti_link;
	private String noti_print;

}
