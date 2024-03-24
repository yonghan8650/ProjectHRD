package com.bswill.domain;

import lombok.Data;

@Data
public class OrganizationChartVO {
	
	private int employee_id; // 사원 id
	private String profil;  // 사원 프로필 사진
 	private int JOB_ID;      // 직책 id
	private int DEPTID;      // 부서 id
	private String emp_tel;  // 사원 전화
	private String emp_mail;// 사원 이메일
	private int STATUS;      // 재직 상태
	private String FAVORS;    // 즐겨찾기
	
	
	
}
