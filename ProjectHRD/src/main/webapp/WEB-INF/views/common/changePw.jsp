<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>
<body>
<h1>changePw.jsp</h1>
	<form role="form" method="post">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
	    <label for="currentPassword">현재 비밀번호 : </label>
	    <input type="password" id="currentPw" name="currentPw"><br>
	    
	    <label for="newPassword">새로운 비밀번호 : </label>
	    <input type="password" id="newPw" name="newPw"><br>
	    
	    <label for="confirmNewPassword">새로운 비밀번호 확인 : </label>
	    <input type="password" id="confirmNewPw" name="confirmNewPw"><br>
	    
	    <input type="submit" value="비밀번호 변경하기">
	</form>

</body>
</html>