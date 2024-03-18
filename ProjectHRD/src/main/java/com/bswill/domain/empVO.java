package com.bswill.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class empVO {
	private int employee_id;
	private String PASSWD;
	private String emp_name;
	private String PROFIL;
	private String birth;
	private int gender;
	private String emp_tel;
	private String emp_mail;
	private String emp_addr;
	private int JOB_ID;
	private int DEPTID;
	private int STATUS;
	private Timestamp start_date;
	private Timestamp quit_date;
	private String FAVORS;
}