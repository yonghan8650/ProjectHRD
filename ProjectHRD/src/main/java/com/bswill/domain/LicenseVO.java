package com.bswill.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class LicenseVO {
	private int employee_id;
	private String license;
	private String li_org;
	private Timestamp li_date;
}
