<%@page import="com.bswill.domain.OrganizationChartVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>부서별 직원 목록</title>
</head>
<body>
    <h2>부서별 직원 목록</h2>
    <table border="1">
        <tr>
            <th>직원 ID</th>
            <th>이름</th>
            <th>프로필 사진</th>
            <th>부서</th>
            <th>직책</th>
            <th>연락처</th>
            <th>이메일</th>
            <th>재직 상태</th>
        </tr>
        <c:forEach var="employee" items="${employees}">
            <tr>
                <td>${employee.getEmployee_id()}</td>
                <td>${employee.getEmp_name()}</td>
                <td><img src="${employee.getProfil()}" alt="프로필 사진"></td>
                <td>${employee.getDEPTID()}</td>
                <td>${employee.getJOB_ID()}</td>
                <td>${employee.getEmp_tel()}</td>
                <td>${employee.getEmp_mail()}</td>
                <td>${employee.getSTATUS()}</td>
            </tr>
        </c:forEach>
    </table>
    <button type="button" onclick="location.href='/org/orgDept';">조직도 목록</button>
</body>
</html>
