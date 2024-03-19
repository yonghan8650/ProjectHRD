package com.bswill.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class SalaryListVO {
	private Timestamp pay_yearmonth;
	private int employee_id;
	private int JOB_ID;
	private int salary;
	private int bonus;
	private int premium;
	private int sum;
}
