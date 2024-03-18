<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Notifications</title>
</head>
<body>
    <h1>Notifications</h1>
    <table border="1">
        <thead>
            <tr>
                <th>Message</th>
                <th>Date</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${notifications}" var="notification">
                <tr>
                    <td>${notification.message}</td>
                    <td>${notification.createdAt}</td>
                    <td>
                        <a href="#">Delete</a> <!-- 여기에 삭제 링크 추가 -->
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
