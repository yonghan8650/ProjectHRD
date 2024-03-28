package com.bswill.service;

import java.util.List;


import com.bswill.domain.OrganizationChartVO;

public interface OrganizationChartService {
	
	
	// 조직도 전체 목록 동작
    public List<OrganizationChartVO> orgList() throws Exception;
        
    // 전체 부서 목록    
    public List<OrganizationChartVO> getDepartmentList() throws Exception;
    	
	// 즐겨찾기
    public List<OrganizationChartVO> orgFavor() throws Exception;
		
    // 즐겨찾기에 추가
    public void addToFavorites(int employee_id) throws Exception;
    
    // 즐겨찾기 해제
    public void removeFromFavorites(int employee_id) throws Exception;
    
    // 부서별 조직도
    public List<OrganizationChartVO> getEmployeesByDept(int deptId) throws Exception;
}