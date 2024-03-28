package com.bswill.domain;

// 급여 검색을 위한 클래스
public class SalaryCri {
	private String startDate;
	private String endDate;
	
	private String pay_yearmonth;
	private String employee_id;
	private String JOB_ID;
	private String salary;
	
	public String getStartDate() {
		return startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getPay_yearmonth() {
		return pay_yearmonth;
	}
	
	public void setPay_yearmonth(String pay_yearmonth) {
		this.pay_yearmonth = pay_yearmonth;
	}
	
	public String getEmployee_id() {
		return employee_id;
	}
	
	public void setEmployee_id(String emp_id) {
		this.employee_id = emp_id;
	}
	
	public String getJOB_ID() {
		return JOB_ID;
	}
	
	public void setJOB_ID(String jOB_ID) {
		JOB_ID = jOB_ID;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}
	

}
