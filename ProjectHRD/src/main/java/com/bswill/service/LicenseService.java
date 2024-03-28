package com.bswill.service;

import java.util.List;

import com.bswill.domain.LicenseVO;

public interface LicenseService {

	public void registLicense(LicenseVO lvo) throws Exception;

	public List<LicenseVO> viewEmpLicense(Integer employee_id) throws Exception;

	public void addEmpLicense(LicenseVO lvo) throws Exception;

	public void subEmpLicense(LicenseVO lvo) throws Exception;

}
