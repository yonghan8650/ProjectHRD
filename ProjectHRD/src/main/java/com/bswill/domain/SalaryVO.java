package com.bswill.domain;

import lombok.Data;

@Data
public class SalaryVO {

	private int employee_id;
	private int salary;
	private String bank;
	private String account;
	private String account_holder;

}
