package com.bswill.service;

import java.util.List;

import com.bswill.domain.OrganizationChartVO;

public interface OrganizationService {
	
	
	// 조직도 전체 목록 동작
	public List<OrganizationChartVO> organizationList() throws Exception;
		
		
	// 조직도 즐겨찾기 동작
	public void checkFavors(int employee_id) throws Exception;
		
		
		
}
