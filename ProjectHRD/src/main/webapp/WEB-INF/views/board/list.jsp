<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<style>
 .active{
      background-color: #cdd5ec;
  }
</style>
<body>
	<div class="box">
		<div class="box-header">
			<h3 class="box-title">공지사항</h3>
			<div class="box-tools">
				<div class="search_wrap input-group input-group-sm hidden-xs" style="width: 300px;">
					<input class="form-control pull-right" type="text" name="keyword" value="${pageMaker.cri.keyword }" placeholder="제목 검색">
					<div class="input-group-btn search_area">
						<button class="btn btn-default">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</div>
			</div>
		</div>
		<div class="box-body table-responsive no-padding">
			<table class="table table-hover">
				<tbody>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자(사번)</th>
						<th>작성일</th>
						<th>수정일</th>
						<th>조회수</th>
					</tr>
					<c:forEach var="bVO" items="${boardList }">
						<tr>
							<td>${bVO.board_no }</td>
							<td><a href="/board/read?board_no=${bVO.board_no }&page=${pageMaker.cri.page}&pageSize=${pageMaker.cri.pageSize}&keyword=${pageMaker.cri.keyword }">${bVO.title }</a></td>
							<td>${bVO.employee_id }</td>
							<td><fmt:formatDate value="${bVO.regdate }" pattern="yyyy-MM-dd" /></td>
							<td><fmt:formatDate value="${bVO.updatedate }" pattern="yyyy-MM-dd" /></td>
							<td>${bVO.readcnt }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="pageInfo_wrap">
			<div class="pageInfo_area text-center">
				<ul id="pageInfo" class="pageInfo pagination pagination-sm">
					<!-- 이전페이지 버튼 -->
					<c:if test="${pageMaker.prev}">
						<li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
					</c:if>
					<!-- 페이지 번호 -->
					<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
						<li class="pageInfo_btn ${pageMaker.cri.page == num ? 'active' : ''}"><a href="${num}">${num}</a>
</li>
					</c:forEach>
					<!-- 다음페이지 버튼 -->
					<c:if test="${pageMaker.next}">
						<li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }">Next</a></li>
					</c:if>
				</ul>
			</div>
			<div class="text-right">
				<!-- 매니저, 관리자만 글쓰기 버튼 보임 -->
				<sec:authorize access="hasAnyRole('ROLE_MANAGER', 'ROLE_ADMIN')">
					<button type="button" class="btn btn-default" onclick="location.href='/board/register'">글 쓰기</button>
				</sec:authorize>

				<button type="button" class="btn btn-default" onclick="location.href='/common/main'">메인으로</button>
			</div>
		</div>

		<form id="moveForm" method="get">
			<input type="hidden" name="page" value="${pageMaker.cri.page}"> 
			<input type="hidden" name="pageSize" value="${pageMaker.cri.pageSize }"> 
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
		</form>
	</div>
	
	
	<%-- ${sessionScope['SPRING_SECURITY_CONTEXT'].authentication.name} --%>
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
	<%@ include file="../include/footer.jsp"%>