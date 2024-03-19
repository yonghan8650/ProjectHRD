package com.bswill.domain;

import java.sql.Timestamp;

import lombok.Data;
@Data
public class BoardVO {
	private int board_no;
	private String title;
	private int employee_id;
	private String content;
	private Timestamp regdate;
	private Timestamp updatedate; 
	private int readcnt;
	

}
