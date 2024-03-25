<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
</head>
<body>
	<h1>changePw.jsp</h1>
	<form role="form" method="post">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"> <label for="currentPassword">현재 비밀번호 : </label> <input type="password" id="currentPw" name="currentPw"><br> <label for="newPassword">새로운 비밀번호 : </label> <input type="password" id="newPw" name="newPw"><br> <label for="confirmNewPassword">새로운 비밀번호 확인 : </label> <input type="password" id="confirmNewPw" name="confirmNewPw"><br> <input type="submit" value="비밀번호 변경하기">
	</form>

	<script>
		// URL에서 "error" 파라미터의 값을 가져오기
		var error = new URLSearchParams(window.location.search).get('error');

		// "error" 파라미터의 값이 1인 경우에만 alert 창 표시
		if (error === '1') {
			alert('비밀번호 변경 실패 : 비밀번호를 확인해주세요.');
		}
	</script>

</body>
</html>