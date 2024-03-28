<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<body>
	${username }
	<h1>글 작성</h1>
	<form role="form" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<div class="box-body">
			<div class="form-group">
				<label>제 목</label> <input type="text" class="form-control" name="title" placeholder="제목을 입력하세요 (최대 50자)" maxlength="50" required>
			</div>
			<div class="form-group">
				<label>작성자</label> <input type="text" class="form-control" name="employee_id" value="${sessionScope['SPRING_SECURITY_CONTEXT'].authentication.name }" placeholder="작성자를 입력하세요" readonly>
			</div>
			<div class="form-group">
				<label>내 용</label>
				<textarea class="form-control" rows="20" name="content" placeholder="내용을 입력하세요 (최대 5000자)" maxlength="5000" required></textarea>
			</div>
			<h4 id="txtLength">5000</h4>

			<div class="box-footer">
				<button type="submit" class="btn btn-default">글 작성</button>
				<button type="button" class="btn btn-default" onclick="location.href='/board/list'">작성 취소</button>
			</div>
		</div>
	</form>

	<script>
		$("#txtLength");

		$('textarea').keyup(function() {
			// alert("키보드입력");
			// 입력된 글자수 체크
			// .val : value의 값을 가져오는 함수 // .text : value값이 없는것만 가져올 수 있음

			//입력된 글 내용
			var txt = $('textarea').val();
			// alert(txt.length);					
			// 200 - 입력된 글자 길이(txt.length)값을 txtLength 아이디의 h2태그에 작성

			$("#txtLength").html(5000 - txt.length);

		});
	</script>


	<%@ include file="../include/footer.jsp"%>