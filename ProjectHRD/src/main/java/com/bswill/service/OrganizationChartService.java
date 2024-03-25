package com.bswill.service;

import java.util.List;

import com.bswill.domain.OrganizationChartVO;

public interface OrganizationChartService {
	
	
	// 조직도 전체 목록 동작
    public List<OrganizationChartVO> orgList() throws Exception;
        
    // 부서별 조직도    
    public List<OrganizationChartVO> orgDept(int DEPTID) throws Exception;
    	
	// 즐겨찾기
    public List<OrganizationChartVO> orgFavor() throws Exception;
		
}
