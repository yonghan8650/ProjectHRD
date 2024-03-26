<%@page import="com.bswill.domain.OrganizationChartVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>부서 목록</title>
</head>
<body>
    <h1>부서 목록</h1>
    <table border="1">
        <thead>
            <tr>
                <th>부서</th>
                <th>부서 이름</th>
                
            </tr>
        </thead>
        <tbody>
            <% 
            List<OrganizationChartVO> departmentList = (List<OrganizationChartVO>) request.getAttribute("departmentList");
            if (departmentList != null) {
                for (OrganizationChartVO department : departmentList) {
            %>
            <tr>
                <td><a href="/org/getEmployeesByDept?deptId=<%= department.getDEPTID() %>"><%= department.getDEPTID() %></a></td>
                <td><%= department.getDEPT_NAME() %></td>
                
            </tr>
            <% 
                }
            }
            %>
        </tbody>
    </table>
    <button type="button" onclick="location.href='/org/orgList';">조직도 목록</button>
</body>
</html>
