<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>

<div class="content">
	<div class="box" style="min-height: 600px;">
		<div class="box-header">
			<h3 class="box-title">경조비 신청 관리</h3>
		</div>

		<form action="" method="get">
			<label for="searchType">검색 유형:</label> <select id="searchType" name="searchType">
				<option value="employee_id">사원번호</option>
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

		<div class="box-body">
			<div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
				<div class="row">
					<div class="col-sm-6"></div>
					<div class="col-sm-6"></div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
							<thead>
								<tr role="row">
									<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" style="width: 10px">#</th>
									<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">사원번호</th>
									<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">경조구분</th>
									<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">대상자명</th>
									<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">경조일자</th>
									<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">신청일자</th>
									<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">신청금액</th>
									<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">신청상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${listEvent }" varStatus="stat" end="${listEvent.size()}">
									<tr role="row" class="odd">
										<td>${listEvent.size() - stat.index}</td>
										<td>
											<a onclick="openSmallPopup('/emp/viewEmpAccountInfo?employee_id=${list.employee_id}')" target="_blank">${list.employee_id}</a>
										</td>
										<td>${list.eve_class }</td>
										<td>${list.eve_subject }</td>
										<td>${list.eve_date }</td>
										<td>${list.req_date }</td>
										<td>${list.eve_amount }</td>
										<td>
											<c:choose>
												<c:when test="${list.eve_auth eq '신청'}">
													<form method="post">
														<input type="hidden" id="employee_id" name="employee_id" value="${list.employee_id}">
														<input type="hidden" id="eve_class" name="eve_class" value="${list.eve_class }">
														<input type="hidden" id="eve_subject" name="eve_subject" value="${list.eve_subject }">
														<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
														<div class="btn-group">
															<button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown">신청</button>
															<ul class="dropdown-menu" role="menu">
																<li><c:url var="approveUrl" value="/emp/approveEmpEvent" />
																	<button type="submit" formaction="${approveUrl}" class="btn btn-block btn-success btn-flat">승인</button></li>
																<li class="divider"></li>
																<li><c:url var="rejectUrl" value="/emp/rejectEmpEvent" />
																	<button type="submit" formaction="${rejectUrl}" class="btn btn-block btn-danger btn-flat">거부</button></li>
															</ul>
														</div>
													</form>
												</c:when>
												<c:when test="${list.eve_auth eq '승인'}">
													<button type="button" class="btn btn-success" style="pointer-events: none;">승인</button>
												</c:when>
												<c:when test="${list.eve_auth eq '거부'}">
													<button type="button" class="btn btn-danger" style="pointer-events: none;">거부</button>
												</c:when>
											</c:choose>
										</td>
									</tr>
								</c:forEach>

							</tbody>
							<tfoot>
								<tr>
									<th rowspan="1" colspan="1">#</th>
									<th rowspan="1" colspan="1">사원번호</th>
									<th rowspan="1" colspan="1">경조구분</th>
									<th rowspan="1" colspan="1">대상자명</th>
									<th rowspan="1" colspan="1">경조일자</th>
									<th rowspan="1" colspan="1">신청일자</th>
									<th rowspan="1" colspan="1">신청금액</th>
									<th rowspan="1" colspan="1">신청상태</th>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
		</div>
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

<script>
	function openSmallPopup(url) {
		var width = 500;
		var height = 200;
		var left = (window.screen.width - width) / 2;
		var top = (window.screen.height - height) / 2;

		var options = 'width=' + width + ',height=' + height + ',left=' + left
				+ ',top=' + top;
		window.open(url, 'popup', options);
	}
</script>

<%@ include file="../include/footer.jsp"%>