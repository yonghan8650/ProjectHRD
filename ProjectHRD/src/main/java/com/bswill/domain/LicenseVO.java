package com.bswill.domain;

import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class LicenseVO {

	private int employee_id;
	private String license;
	private String li_org;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Timestamp li_date;

}
