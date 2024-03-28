package com.bswill.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bswill.domain.OrganizationChartVO;

@Repository
public class OrganizationChartDAOImpl implements OrganizationChartDAO {

    @Inject
    private SqlSession sqlSession;

    private static final Logger logger = LoggerFactory.getLogger(OrganizationChartDAOImpl.class);
    private static final String NAMESPACE = "com.bswill.mapper.OrganizationChartMapper";

    @Override
    public OrganizationChartVO getUserById(int employeeId) throws Exception {
        return sqlSession.selectOne(NAMESPACE + ".getUserById", employeeId);
    }
    
    @Override
    public List<OrganizationChartVO> allEmployees() throws Exception {
        logger.debug(" allEmployees() 호출 ");
        return sqlSession.selectList(NAMESPACE + ".allEmployees");
    }

    @Override
    public List<OrganizationChartVO> getDepartmentList() throws Exception {
        logger.debug(" getDepartmentList() 호출 ");
        return sqlSession.selectList(NAMESPACE + ".getDepartmentList");
    }

    @Override
    public List<OrganizationChartVO> favoriteEmployees(int employeeId) throws Exception {
        logger.debug(" favoriteEmployees() 호출 ");
        return sqlSession.selectList(NAMESPACE + ".selectFavorList", employeeId);
    }

    @Override
    public void addToFavorites(int employeeId, String favors) throws Exception {
        Map<String, Object> params = new HashMap<>();
        params.put("employeeId", employeeId);
        params.put("favors", favors);
        sqlSession.update(NAMESPACE + ".updateFavor", params);
    }

    @Override
    public void removeFromFavorites(int employee_id, String userId) throws Exception {
        logger.debug(" removeFromFavorites() 호출");
        Map<String, Object> params = new HashMap<>();
        params.put("employee_id", employee_id);
        params.put("userId", userId);
        sqlSession.update(NAMESPACE + ".removeFavor", params);
    }

    @Override
    public List<OrganizationChartVO> getEmployeesByDept(int deptId) throws Exception {
        logger.debug(" getEmployeesByDept() 호출");
        return sqlSession.selectList(NAMESPACE + ".getEmployeesByDept", deptId);
    }
}
