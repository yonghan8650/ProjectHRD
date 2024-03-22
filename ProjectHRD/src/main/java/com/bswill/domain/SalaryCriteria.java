package com.bswill.domain;

public class SalaryCriteria {
	private String keyword;
	
	private String pay_yearmonth;
	private String employee_id;
	
	public String getKeyword() {	
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String getPay_yearmonth() {
		return pay_yearmonth;
	}

	public String getEmployee_id() {
		return employee_id;
	}

	public void setPay_yearmonth(String pay_yearmonth) {
		this.pay_yearmonth = pay_yearmonth;
	}

	public void setEmployee_id(String emp_id) {
		this.employee_id = emp_id;
	}

}
