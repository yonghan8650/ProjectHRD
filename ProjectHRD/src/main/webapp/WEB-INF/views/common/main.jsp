<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>
</head>
<body>
		<h2>${username }님 환영합니다</h2>
		<h1>main.jsp</h1>
		
		<a href="/board/list">공지사항</a>
		<a href="/common/customLogout">로그아웃</a>
		<a href="/common/changePw">비밀번호 변경</a>
</body>
</html>