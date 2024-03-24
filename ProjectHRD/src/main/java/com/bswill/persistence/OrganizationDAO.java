package com.bswill.persistence;

import java.util.List;

import com.bswill.domain.OrganizationChartVO;

public interface OrganizationDAO {
	
	// 조직도 전체 목록
	public List<OrganizationChartVO> organizationListSelect() throws Exception;
	
	// 즐겨찾기 체크
	public void checkFavorites(int employee_id) throws Exception;
}
