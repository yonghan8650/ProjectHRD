<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../include/header.jsp"%>
<style>
table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 8px;
	border: 1px solid #ddd;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

/* 체크박스 선택 시 배경색 변경 */
tr.selected {
	background-color: #e0e0e0;
}

button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 10px 24px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	border-radius: 12px;
}

button:hover {
	background-color: #45a049;
}
</style>

<h4>조직도</h4>

<form action="/org/updateFavors" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<table>
		<tr>
			<th><input type="checkbox" onclick="toggleAll(this)"></th>
			<th>사원번호</th>
			<th>사원명</th>
			<th>부서명</th>
			<th>직책</th>
			<th>연락처</th>
			<th>이메일</th>
			<th>재직상태</th>
		</tr>
		<c:forEach var="list" items="${orgList }">
			<tr>
				<td><input type="checkbox" name="favors" value="${list.employee_id}" <c:if test="${fn:indexOf(getEmpFavors, list.employee_id) ne -1 }">checked</c:if>></td>
				<td>${list.employee_id }</td>
				<td>${list.emp_name }</td>
				<td>${list.DEPTNM }</td>
				<td>${list.JOB }</td>
				<td>${list.emp_tel }</td>
				<td>${list.emp_mail }</td>
				<td>${list.STATUS }</td>
			</tr>
		</c:forEach>
	</table>
	<button type="submit" onclick="alert('즐겨찾기 추가 성공');">즐겨찾기 추가</button>
</form>

<script>
	function toggleAll(source) {
		checkboxes = document.getElementsByName('favors');
		for (var i = 0; i < checkboxes.length; i++) {
			checkboxes[i].checked = source.checked;
		}
	}
</script>

<%@ include file="../include/footer.jsp"%>