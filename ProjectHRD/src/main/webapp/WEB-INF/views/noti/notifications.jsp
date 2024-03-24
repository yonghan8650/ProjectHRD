<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>알림 목록</title>
</head>
<body>
    <h1>알림 목록</h1>
    
    <!-- 알림 목록 출력 -->
    <table border="1">
        <tr>
            <th>알림 ID</th>
            <th>내용</th>
            <th>읽음 여부</th>
            <th>삭제</th>
        </tr>


		<c:forEach var="notification" items="${notiListSelect}">
			<tr>
				<td>${notification.employee_id}</td>
				<!-- 알림 내용을 클릭하여 특정 페이지로 이동 -->
				<td><a
					href="${pageContext.request.contextPath}/noti/readNoti?employee_id=${notification.employee_id}">${notification.content}</a></td>
				<td>${notification.read == 0 ? '읽지 않음' : '읽음'}</td>
				<td>
					<!-- 알림 삭제를 위한 체크박스 -->
					<form action="${pageContext.request.contextPath}/noti/deleteNoti"
						method="post">
						<input type="hidden" name="employee_id"
							value="${notification.employee_id}"> <input
							type="checkbox" name="deleteIds"
							value="${notification.employee_id}">
					</form>
				</td>
			</tr>
		</c:forEach>

	</table>
    
    <!-- 전체 삭제 버튼 -->
    <form action="${pageContext.request.contextPath}/noti/deleteAllNoti" method="post">
        <input type="submit" value="모두 확인">
    </form>
</body>
</html>
