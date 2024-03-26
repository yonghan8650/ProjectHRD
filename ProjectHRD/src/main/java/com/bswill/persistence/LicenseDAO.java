package com.bswill.persistence;

import java.util.List;

import com.bswill.domain.LicenseVO;

public interface LicenseDAO {

	public void insertLicense(LicenseVO lvo) throws Exception;
	
	public List<LicenseVO> selectEmpLicense(Integer employee_id) throws Exception;

}
