package com.bswill.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class LicenseVO {

	private int employee_id;
	private String license;
	private String li_org;
	private Date li_date;

}
