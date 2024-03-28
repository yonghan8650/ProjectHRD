<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>계좌 정보 조회</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>사원번호</td>
			<td>${viewSalary.employee_id }</td>
			<td>연락처</td>
			<td>${viewSalary.emp_tel }</td>
		</tr>
		<tr>
			<td>사원명</td>
			<td>${viewSalary.emp_name }</td>
			<td>연락처</td>
			<td>${viewSalary.emp_mail }</td>
		</tr>
		<tr>
			<td>부서</td>
			<td>${viewSalary.DEPTNM }</td>
			<td>성별</td>

			<td>
				<c:choose>
					<c:when test="${viewSalary.gender eq 1}">남성</c:when>
					<c:when test="${viewSalary.gender eq 2}">여성</c:when>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td>직급</td>
			<td>${viewSalary.JOB }</td>
			<td>재직상태</td>
			<td>
				<c:choose>
					<c:when test="${viewSalary.STATUS eq 1}">재직</c:when>
					<c:when test="${viewSalary.STATUS eq 2}">휴직</c:when>
					<c:when test="${viewSalary.STATUS eq 3}">퇴직</c:when>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td>은행</td>
			<td>${viewSalary.bank }</td>
			<td>기본급</td>
			<td>${viewSalary.salary }</td>
		</tr>
		<tr>
			<td>예금주</td>
			<td>${viewSalary.account_holder }</td>
			<td>계좌</td>
			<td>${viewSalary.account }</td>
		</tr>
	</table>
</body>
</html>
