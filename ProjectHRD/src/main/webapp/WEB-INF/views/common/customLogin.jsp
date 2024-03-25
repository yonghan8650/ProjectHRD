<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>customLogin.jsp</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
</head>
<body>

	<h1>customLogin.jsp</h1>

	<h2>bswill 로그인 페이지</h2>

	<fieldset>
		<form action="/login" method="post">
			아이디 : <input type="text" name="username"> <br> 비밀번호 : <input type="password" name="password"> <br> <input type="submit" value="로그인"> <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		</form>
	</fieldset>

	<script>
		// URL에서 "error" 파라미터의 값을 가져오기
		var error = new URLSearchParams(window.location.search).get('error');

		// "error" 파라미터의 값이 1인 경우에만 alert 창 표시
		if (error === '1') {
			alert('로그인 실패');
		}
	</script>

</body>
</html>