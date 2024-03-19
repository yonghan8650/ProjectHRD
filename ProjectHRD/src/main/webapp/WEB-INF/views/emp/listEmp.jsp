<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 목록 조회</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>사원번호</td>
			<td>사원명</td>
			<td>직급</td>
			<td>부서</td>
			<td>입사일</td>
			<td>재직상태</td>
		</tr>
		<c:forEach var="list" items="${listEmp }">
			<tr>
				<td><a href="/emp/viewEmp?employee_id=${list.employee_id }">${list.employee_id }</a></td>
				<td>${list.emp_name }</td>
				<td>${list.JOB }</td>
				<td>${list.DEPTNM }</td>
				<td>${list.start_date }</td>
				<td>${list.STATUS }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>