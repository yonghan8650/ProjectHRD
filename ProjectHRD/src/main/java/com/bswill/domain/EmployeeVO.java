package com.bswill.domain;

import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class EmployeeVO {

	private int employee_id;
	private String PASSWD;
	private String emp_name;
	private String PROFIL;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String birth;
	private int gender;
	private String emp_tel;
	private String emp_mail;
	private String emp_addr;
	private int JOB_ID;
	private int DEPTID;
	private int STATUS;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String start_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Timestamp quit_date;
	private String FAVORS;
	private String enabled;

}