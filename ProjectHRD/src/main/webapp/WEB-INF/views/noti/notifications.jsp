<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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



<h1>알림 목록</h1>



<!-- 알림 목록 테이블 -->
<table border="1">
	<tr>
		<th>알림 ID</th>
		<th>내용</th>
		<th>읽음 여부</th>
		<th>확인</th>
		<th>출력 여부</th>
	</tr>
	<form action="${pageContext.request.contextPath}/noti/readAllNoti"
		method="post">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}">
		<button type="submit">모두 확인</button>
	</form>
	<form action="<%=request.getContextPath()%>/noti/deleteAllNoti"
		method="post">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}">
		<button type="submit">모두삭제</button>
	</form>
	<!-- 알림 목록 출력 -->
	<c:forEach var="notification" items="${notiListSelect}">
		<tr>
			<td>${notification.employee_id}</td>
			<td><a href="${notification.noti_link}">${notification.noti_title}</a></td>
			<td>${notification.noti_check == 0 ? '읽지 않음' : '읽음'}</td>
			<td>
				<!-- 알림 확인을 위한 폼 -->
				<form action="${pageContext.request.contextPath}/noti/readNoti"
					method="post">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}"> <input type="hidden"
						name="employee_id" value="${notification.employee_id}"> <input
						type="hidden" name="noti_title" value="${notification.noti_title}">
					<input type="hidden" name="noti_time"
						value="${notification.noti_time}">
					<button type="submit">확인</button>
				</form>
			</td>
			<td>
				<!-- 출력 여부 변경을 위한 폼 -->
				<form
					action="${pageContext.request.contextPath}/noti/updatePrintStatus"
					method="post">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}"> <input type="hidden"
						name="employee_id" value="${notification.employee_id}"> <input
						type="hidden" name="noti_title" value="${notification.noti_title}">
					<input type="hidden" name="noti_time"
						value="${notification.noti_time}"> <select
						name="noti_print">
						<option value="Y"
							${notification.noti_print == 'Y' ? 'selected' : ''}>출력함</option>
						<option value="N"
							${notification.noti_print == 'N' ? 'selected' : ''}>출력하지
							않음</option>
					</select>
					<button type="submit">변경</button>
				</form>
			</td>
		</tr>
	</c:forEach>

</table>


<%@ include file="../include/footer.jsp"%>
