<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림 목록</title>
</head>
<body>
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
					<form action="${pageContext.request.contextPath}/noti/readAllNoti" method="post">			
 						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<button type="submit">모두 확인</button> 
					</form>
        <!-- 알림 목록 출력 -->
        <c:forEach var="notification" items="${notiListSelect}">
            <tr>
                <td>${notification.employee_id}</td>
                <td><a href="${notification.noti_link}">${notification.noti_title}</a></td>
                <td>${notification.noti_check == 0 ? '읽지 않음' : '읽음'}</td>
                <td>
                    <!-- 알림 확인을 위한 폼 -->
                    <form action="${pageContext.request.contextPath}/noti/readNoti" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        <input type="hidden" name="employee_id" value="${notification.employee_id}">
                        <input type="hidden" name="noti_title" value="${notification.noti_title}">
                        <input type="hidden" name="noti_time" value="${notification.noti_time}">
                        <button type="submit">확인</button>
                    </form>
                </td>
                <td>
                    <!-- 출력 여부 변경을 위한 폼 -->
                    <form action="${pageContext.request.contextPath}/noti/updatePrintStatus" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        <input type="hidden" name="employee_id" value="${notification.employee_id}">
                        <input type="hidden" name="noti_title" value="${notification.noti_title}">
                        <input type="hidden" name="noti_time" value="${notification.noti_time}">
                        <select name="noti_print">
                            <option value="Y" ${notification.noti_print == 'Y' ? 'selected' : ''}>출력함</option>
                            <option value="N" ${notification.noti_print == 'N' ? 'selected' : ''}>출력하지 않음</option>
                        </select>
                        <button type="submit">변경</button>
                    </form>
                </td>
            </tr>
        </c:forEach>

    </table>

    <!-- 전체 삭제 버튼 -->
    <form action="<%=request.getContextPath()%>/noti/deleteAllNoti" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        <input type="submit" value="모두 삭제">
    </form>

</body>
</html>
