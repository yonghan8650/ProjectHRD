<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BSWILL 로그인</title>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<script src="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/js/adminlte.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<!-- Bootstrap 3.3.4 -->
<link href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- Font Awesome Icons -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
<link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
<script src="https://kit.fontawesome.com/ce16b4434b.js" crossorigin="anonymous"></script>
</head>
<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<a href="../../index2.html">BSWILL</a>
		</div>

		<div class="login-box-body">
			<p class="login-box-msg">BSWILL HRD</p>
			<form action="/login" method="post">
				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="username" placeholder="사원번호"> <span class="glyphicon glyphicon glyphicon-user form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" class="form-control" name="password" placeholder="비밀번호"> <span class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
				<div class="row">
					<div class="col-xs-4 col-xs-offset-4">
						<!-- col-xs-offset-4 클래스 추가 -->
						<button type="submit" class="btn btn-primary btn-block btn-flat">Login</button>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-xs-12 text-center">
						<!-- col-xs-12 클래스 추가하고 텍스트 중앙 정렬 -->
						Manager E-mail :  bshrdmanager@gmail.com
						Manager tel :  010-XXXX-XXX
					</div>
				</div>
			</form>
		</div>

	</div>

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