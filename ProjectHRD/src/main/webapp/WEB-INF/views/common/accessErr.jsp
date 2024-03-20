<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>accessErr.jsp</title>
</head>
<body>
		<h1>accessErr.jsp</h1>
		
		<h2> 잘못된 접근입니다. 관리자에게 문의하세요. </h2>
		
		<a href="/main">메인페이지로 이동</a>
		
		<input type="button" value="이전페이지로" onclick="history.back(); ">
		
		<%
			//response.addHeader("Refresh", "3, url=/all");	// 3초후 새로고침 + 페이지 이동			
			
		%>
		
		
		
</body>
</html>