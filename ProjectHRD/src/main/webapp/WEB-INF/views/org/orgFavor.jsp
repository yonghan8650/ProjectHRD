<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
button {
	padding: 8px 12px;
	font-size: 14px;
	background-color: #f44336;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s;
}

button:hover {
	background-color: #d32f2f;
}
</style>

<h4>조직도</h4>

<c:if test="${empty getEmpFavorsList }">
	<p>즐겨찾기 목록이 비어 있습니다.</p>
</c:if>


<c:if test="${not empty getEmpFavorsList }">
	<form action="/org/updateFavors" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="hidden" name="orgFavor" value="orgFavor">
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
			<c:forEach var="list" items="${getEmpFavorsList }">
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
		<button type="submit" onclick="alert('즐겨찾기 수정 성공');">즐겨찾기 수정</button>
		<button type="button" onclick="location.href='/org/orgList';">조직도 목록</button>
	</form>

	<script>
		function toggleAll(source) {
			checkboxes = document.getElementsByName('favors');
			for (var i = 0; i < checkboxes.length; i++) {
				checkboxes[i].checked = source.checked;
			}
		}
	</script>
</c:if>



<%@ include file="../include/footer.jsp"%>