<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register.jsp</title>
</head>
<body>
	<h1>글 작성 (register.jsp)</h1>
	<form role="form" method="post">
	<div>
		<div>
			<label>제 목</label> 
			<input type="text" name="title" placeholder="제목을 입력하세요">
		</div>
		<div>
			<label>작성자</label> 
			<input type="text" name="employee_id" placeholder="작성자를 입력하세요">
		</div>
		<div>
			<label>내 용</label>
			<textarea rows="10" name="content" placeholder="내용을 입력하세요"></textarea>
		</div>
	
		<div>
			<button type="submit">글쓰기</button>
		</div>
	</div>
</form>
</body>
</html>