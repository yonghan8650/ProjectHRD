<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
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

		<div class="search_wrap">
			<div class="search_area">
				<input type="text" name="keyword" value="${pageMaker.cri.keyword }">
				<button>Search</button>
			</div>
		</div>
		<div class="pageInfo_wrap">
			<div class="pageInfo_area">
				<ul id="pageInfo" class="pageInfo">
					<!-- 이전페이지 버튼 -->
					<c:if test="${pageMaker.prev}">
						<li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
						<li class="pageInfo_btn"><a href="${num }">${num }</a></li>
					</c:forEach>
					<!-- 다음페이지 버튼 -->
					<c:if test="${pageMaker.next}">
						<li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }">Next</a></li>
					</c:if>
				</ul>
			</div>
		</div>

		<form id="moveForm" method="get">
			<input type="hidden" name="page" value="${pageMaker.cri.page}"> <input type="hidden" name="pageSize" value="${pageMaker.cri.pageSize }"> <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
		</form>
	</div>
	
	<!-- 매니저, 관리자만 글쓰기 버튼 보임 -->
	<sec:authorize access="hasAnyRole('ROLE_MANAGER', 'ROLE_ADMIN')">
	<a href="/board/register">글 쓰기</a>
	</sec:authorize>
	
	<a href="/common/main">메인으로</a>
	<script type="text/javascript">
		$(".pageInfo a").on("click", function(e) {

			e.preventDefault();
			moveForm.find("input[name='page']").val($(this).attr("href"));
			moveForm.attr("action", "/board/list");
			moveForm.submit();

		});

		let moveForm = $("#moveForm");

		$(".search_area button").on("click", function(e) {
			e.preventDefault();
			let val = $("input[name='keyword']").val();
			moveForm.find("input[name='keyword']").val(val);
			moveForm.find("input[name='pageNum']").val(1);
			moveForm.submit();
		});
	</script>
</body>
</html>