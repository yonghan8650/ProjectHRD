<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jsp"%>

<div class="content">
	<div class="box" style="min-height: 600px;">
		<div class="box-header">
			<h3 class="box-title">경조비 신청 목록</h3>
		</div>

		<form action="" method="get">
			<label for="searchType">검색 유형:</label> <select id="searchType" name="searchType">
				<option value="eve_class">경조구분</option>
				<option value="eve_subject">대상자명</option>
				<option value="eve_date">경조일자</option>
				<option value="req_date">신청일자</option>
				<option value="eve_auth">신청상태</option>
			</select>
			<input type="hidden" value="${employee_id }">
			<input type="text" id="keyword" name="keyword">
			<button type="submit">검색</button>
		</form>

		<table class="table">
			<tbody>
				<tr>
					<th style="width: 10px">#</th>
					<th style="width: 50px">경조구분</th>
					<th style="width: 50px">대상자명</th>
					<th style="width: 50px">경조일자</th>
					<th style="width: 50px">신청일자</th>
					<th style="width: 50px">신청금액</th>
					<th style="width: 50px">신청상태</th>
				</tr>

				<c:forEach var="list" items="${listEmpEvent }" varStatus="stat" end="${listEmpEvent.size()}">
					<tr>
						<td>${listEmpEvent.size() - stat.index}</td>
						<td>${list.eve_class }</td>
						<td>${list.eve_subject }</td>
						<td>${list.eve_date }</td>
						<td>${list.req_date }</td>
						<td>${list.eve_amount }</td>
						<td>
							<c:choose>
								<c:when test="${list.eve_auth eq '신청'}">
									<span class="label label-warning">신청</span>
								</c:when>
								<c:when test="${list.eve_auth == '승인'}">
									<span class="label label-success">승인</span>
								</c:when>
								<c:when test="${list.eve_auth == '보류'}">
									<span class="label label-danger">보류</span>
								</c:when>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
	<div class="row">
		<div class="col-sm-7">
			<div class="dataTables_paginate paging_simple_numbers" id="example2_paginate">
				<ul class="pagination">
					<li class="paginate_button previous disabled" id="example2_previous"><a href="#" aria-controls="example2" data-dt-idx="0" tabindex="0">Previous</a></li>
					<li class="paginate_button active"><a href="#" aria-controls="example2" data-dt-idx="1" tabindex="0">1</a></li>
					<li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="2" tabindex="0">2</a></li>
					<li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="3" tabindex="0">3</a></li>
					<li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="4" tabindex="0">4</a></li>
					<li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="5" tabindex="0">5</a></li>
					<li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="6" tabindex="0">6</a></li>
					<li class="paginate_button next" id="example2_next"><a href="#" aria-controls="example2" data-dt-idx="7" tabindex="0">Next</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>