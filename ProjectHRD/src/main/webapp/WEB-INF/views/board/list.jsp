<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
</head>
<body>
	<h1>공지사항 목록(board/list.jsp)</h1>

	<div>
		<table border="1">
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>수정일</td>
				<td>조회수</td>
			</tr>
			<c:forEach var="bVO" items="${boardList }">
				<tr>
					<td>${bVO.board_no }</td>
					<td><a href="/board/read?board_no=${bVO.board_no }&page=${pageMaker.cri.page}&pageSize=${pageMaker.cri.pageSize}">${bVO.title }</a></td>
					<td>${bVO.employee_id }</td>
					<td>${bVO.regdate }</td>
					<td>${bVO.updatedate }</td>
					<td>${bVO.readcnt }</td>
				</tr>
			</c:forEach>
		</table>
		<div class="pageInfo_wrap">
			<div class="pageInfo_area">
				<ul id="pageInfo" class="pageInfo">
					<!-- 이전페이지 버튼 -->
					<c:if test="${pageMaker.prev}">
						<li class="pageInfo_btn previous"><a href="/board/list?page=${pageMaker.startPage-1}">Previous</a></li>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
						<li class="pageInfo_btn"><a href="/board/list?page=${num }">${num }</a></li>
					</c:forEach>
					<!-- 다음페이지 버튼 -->
					<c:if test="${pageMaker.next}">
						<li class="pageInfo_btn next"><a href="/board/list?page=${pageMaker.endPage + 1 }">Next</a></li>
					</c:if>
				</ul>
			</div>
		</div>

		<form id="moveForm" method="get">
			<input type="hidden" name="page" value="${pageMaker.cri.page}"> 
			<input type="hidden" name="pageSize" value="${pageMaker.cri.pageSize }">
		</form>
	</div>
	<a href="/board/register">글 쓰기</a>

</body>
</html>