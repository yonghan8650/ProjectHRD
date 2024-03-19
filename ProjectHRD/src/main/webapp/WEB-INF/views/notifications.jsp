<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Notifications</title>
</head>
<body>
    <h1>Notifications</h1>
    <table border="1">
        <tr>
            <th>Title</th>
            <th>Time</th>
            <th>Link</th>
            <th>Status</th>
        </tr>
        <c:forEach items="${notifications}" var="notification">
            <tr>
                <td>${notification.noti_title}</td>
                <td>${notification.noti_time}</td>
                <td><a href="${notification.noti_link}">${notification.noti_link}</a></td>
                <td>${notification.noti_check ? 'Read' : 'Unread'}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
