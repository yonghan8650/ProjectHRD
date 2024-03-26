<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<body>
	<div class="box-header with-border">
		<h3 class="box-title">글 수정</h3>
	</div>
	<form role="form" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" name="board_no" value="${boardVO.board_no }" />
		<input type="hidden" name="keyword" value="${cri.keyword }">
		<div class="box-body">
			<div class="form-group">
				<label for="exampleInputEmail1">제 목</label> <input type="text" class="form-control" id="exampleInputEmail1" name="title" value="${boardVO.title }" placeholder="제목을 입력하세요 (최대 50자)" maxlength="50">
			</div>

			<div class="form-group">
				<label>작성자</label> <input type="text" class="form-control" name="employee_id" value="${boardVO.employee_id }" readonly/>
			</div>

			<div class="form-group">
				<label>내 용</label>
				<textarea class="form-control" rows="20" name="content">${boardVO.content }</textarea>
			</div>
			<h4 id="txtLength">5000</h4>
			<div class="box-footer">
				<button type="submit" class="btn btn-default">글 수정하기</button>
				<button type="button" class="btn btn-default" onclick="location.href='/board/list'">목록으로</button>				
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