<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
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

<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
</head>
<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<a href="../../index2.html">BSWILL</a>
		</div>
		<div class="login-box-body">
			<p class="login-box-msg">비밀번호 변경</p>
			<form role="form" method="post">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
				<div class="form-group has-feedback">
					<label for="currentPassword">현재 비밀번호 </label> <input class="form-control" maxlength='16' type="password" id="currentPw" name="currentPw" placeholder="영문/숫자 최대 8-16자" required><span class="glyphicon glyphicon-lock form-control-feedback"></span><br>
				</div>
				<div class="form-group has-feedback">
					<label for="newPassword">새로운 비밀번호 </label> <input class="form-control" maxlength='16' type="password" id="newPw" name="newPw" placeholder="영문/숫자 최대 8-16자" required><span class="glyphicon glyphicon-lock form-control-feedback"></span><br>
				</div>
				<div class="form-group has-feedback">
					<label for="confirmNewPassword">새로운 비밀번호 확인 </label> <input class="form-control" maxlength='16' type="password" id="confirmNewPw" name="confirmNewPw" placeholder="영문/숫자 최대 8-16자" required><span class="glyphicon glyphicon-lock form-control-feedback"></span><br>
				</div>
				<div class="button-container">
					<div class="row">
						<div class="col-xs-6">
							<button class="btn btn-primary btn-block btn-flat" onclick="location.href='/common/main'">메인으로</button>
						</div>
						<div class="col-xs-6">
							<button id="submitBtn" type="submit" class="btn btn-primary btn-block btn-flat">변경하기</button>
						</div>						
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
			alert('비밀번호 변경 실패 : 비밀번호를 확인해주세요.');
		}
		
		$("#currentPw, #newPw, #confirmNewPw").keyup(function() {
		    chk_input_filter("AlphaNum", $(this));
		});

		function chk_input_filter(type, obj) {
		    var str = $(obj).val();

		    if (type == 'AlphaNum') {
		        // 영문, 숫자만 허용
		        var filteredStr = str.replace(/[^a-z0-9]/gi, "");
		        
		        if (filteredStr !== str) {
		            // 입력된 값에 영문, 숫자 이외의 문자가 포함되어 있다면
		            $(obj).val(filteredStr); // 필터링된 문자열로 입력값을 대체
		            alert("영문자와 숫자만 입력하세요.");
		        }
		    }
		}
		
		$("#submitBtn").click(function() {
		    var currentPw = $("#currentPw").val();
		    var newPw = $("#newPw").val();
		    var confirmNewPw = $("#confirmNewPw").val();
		    
		    if (currentPw.length < 8 || newPw.length < 8 || confirmNewPw.length < 8) {
		        alert("8자 이상의 비밀번호를 입력하세요.");		        
		        return false; // 폼 제출 방지
		    }
		});
		
	</script>

</body>
</html>