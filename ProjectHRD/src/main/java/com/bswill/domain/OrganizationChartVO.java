package com.bswill.domain;

//import lombok.Data;
//
//@Data
public class OrganizationChartVO {

	private int employee_id; // 사원 id
	private String emp_name; // 사원 이름
	private String profil; // 사원 프로필 사진
	private int JOB_ID; // 직책 id
	private int DEPTID; // 부서 id
	private String DEPT_NAME; // 부서 이름
	private String emp_tel; // 사원 전화
	private String emp_mail;// 사원 이메일
	private int STATUS; // 재직 상태
	private String FAVORS; // 즐겨찾기
	
	public String getDEPT_NAME() {	
		return DEPT_NAME;
	}
	
	public void setDEPT_NAME(String dEPT_NAME) {
		DEPT_NAME = dEPT_NAME;
	}

	public int getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public String getProfil() {
		return profil;
	}

	public void setProfil(String profil) {
		this.profil = profil;
	}

	public int getJOB_ID() {
		return JOB_ID;
	}

	public void setJOB_ID(int jOB_ID) {
		JOB_ID = jOB_ID;
	}

	public int getDEPTID() {
		return DEPTID;
	}

	public void setDEPTID(int dEPTID) {
		DEPTID = dEPTID;
	}

	public String getEmp_tel() {
		return emp_tel;
	}

	public void setEmp_tel(String emp_tel) {
		this.emp_tel = emp_tel;
	}

	public String getEmp_mail() {
		return emp_mail;
	}

	public void setEmp_mail(String emp_mail) {
		this.emp_mail = emp_mail;
	}

	public int getSTATUS() {
		return STATUS;
	}

	public void setSTATUS(int sTATUS) {
		STATUS = sTATUS;
	}

	public String getFAVORS() {
		return FAVORS;
	}

	public void setFAVORS(String fAVORS) {
		FAVORS = fAVORS;
	}

}
