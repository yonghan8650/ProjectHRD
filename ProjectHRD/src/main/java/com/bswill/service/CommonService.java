package com.bswill.service;

import java.util.Map;

public interface CommonService {
	public String getPass(int employee_id) throws Exception;
	
	public void changePass(Map<String, Object> loginInfo) throws Exception;
	
}
