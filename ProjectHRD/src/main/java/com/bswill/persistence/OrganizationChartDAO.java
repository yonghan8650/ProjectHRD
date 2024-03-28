package com.bswill.persistence;

import java.util.List;

import com.bswill.domain.OrganizationChartVO;

public interface OrganizationChartDAO {
    
	// 사용자 ID를 기반으로 사용자 정보 가져오기
    public OrganizationChartVO getUserById(int employeeId) throws Exception;
    
    // 조직도 전체 목록
    public List<OrganizationChartVO> allEmployees() throws Exception;
    
    // 부서 전체 목록
    public List<OrganizationChartVO> getDepartmentList() throws Exception;

    // 즐겨찾기 목록
    public List<OrganizationChartVO> favoriteEmployees(int employeeId) throws Exception;
    
    // 즐겨찾기에 추가
    public void addToFavorites(int employeeId, String favors) throws Exception;
    
    // 즐겨찾기에서 제거
    public void removeFromFavorites(int employee_id, String userId) throws Exception;

    // 부서 별 조직도 
    public List<OrganizationChartVO> getEmployeesByDept(int deptId) throws Exception;
}
