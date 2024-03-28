<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<style>
.content {
	text-align: center;
	margin-top: 50px;
}

.error-message {
	color: #f00;
	font-size: 24px;
	margin-bottom: 20px;
}

.button-container {
	margin-top: 20px;
}

.button-container a, .button-container input[type="button"] {
	padding: 10px 20px;
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 5px;
	text-decoration: none;
	cursor: pointer;
	transition: background-color 0.3s;
}

.button-container a:hover, .button-container input[type="button"]:hover
	{
	background-color: #0056b3;
}
</style>

<div class="content">
	<h2 class="error-message">접근권한이 없습니다. 관리자에게 문의하세요.</h2>
	<div class="text-center">
		<!-- col-xs-12 클래스 추가하고 텍스트 중앙 정렬 -->
		Manager E-mail : bshrdmanager@gmail.com <br>Manager tel : 010-XXXX-XXX
	</div>

	<div class="button-container">
		<a href="/common/main">메인페이지로 이동</a> <input type="button" value="이전페이지로" onclick="history.back();">
	</div>
</div>

<%@ include file="../include/footer.jsp"%>