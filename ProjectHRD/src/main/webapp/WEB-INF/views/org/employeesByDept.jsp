<%@page import="com.bswill.domain.OrganizationChartVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>

<style>
/* 테이블 스타일링 */
table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}

/* 이미지 스타일링 */
img {
	max-width: 100px;
	height: auto;
}

/* 버튼 스타일링 */
.button-container {
	text-align: center;
	margin-top: 20px;
}

.button-container button {
	padding: 10px 20px;
	font-size: 16px;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.button-container button:hover {
	background-color: #45a049;
}
</style>

<h2>부서별 직원 목록</h2>

<table>
	<thead>
		<tr>
			<th>사원번호</th>
			<th>사원명</th>
			<th>부서명</th>
			<th>직책</th>
			<th>연락처</th>
			<th>이메일</th>
			<th>재직상태</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="employee" items="${employees}">
			<tr>
				<td>${employee.employee_id }</td>
				<td>${employee.emp_name }</td>
				<td>${employee.DEPTNM }</td>
				<td>${employee.JOB }</td>
				<td>${employee.emp_tel }</td>
				<td>${employee.emp_mail }</td>
				<td>${employee.STATUS }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<div class="button-container">
	<button type="button" onclick="location.href='/org/orgDept';">부서 목록</button>
</div>

<%@ include file="../include/footer.jsp"%>
