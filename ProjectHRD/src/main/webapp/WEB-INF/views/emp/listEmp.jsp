<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>
<div class="content">
	<div class="box" style="min-height: 600px;">
		<div class="box-header">
			<h3 class="box-title">사원 목록 조회</h3>
		</div>

		<form action="" method="get">
			<label for="searchType">검색 유형:</label> <select id="searchType" name="searchType">
				<option value="employee_id">사원번호</option>
				<option value="emp_name">사원명</option>
				<option value="JOB">직급</option>
				<option value="DEPTNM">부서</option>
				<option value="start_date">입사일</option>
				<option value="STATUS">재직상태</option>
			</select>
			<input type="hidden" value="${employee_id }">
			<input type="text" id="keyword" name="keyword">
			<button type="submit">검색</button>
		</form>

		<div class="box-body">

			<div class="row">
				<div class="col-sm-12">
					<table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
						<thead>
							<tr role="row">
								<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Rendering engine: activate to sort column ascending">사원번호</th>
								<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" aria-sort="descending">사원명</th>
								<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending">직급</th>
								<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">부서</th>
								<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">입사일</th>
								<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">재직상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${listEmp }">
								<tr role="row" class="odd">
									<td>
										<a href="/emp/modifyEmp?employee_id=${list.employee_id }">${list.employee_id }</a>
									</td>
									<td>${list.emp_name }</td>
									<td>${list.JOB }</td>
									<td>${list.DEPTNM }</td>
									<td>${list.start_date }</td>
									<td>${list.STATUS }</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<th rowspan="1" colspan="1">사원번호</th>
								<th rowspan="1" colspan="1">사원명</th>
								<th rowspan="1" colspan="1">직급</th>
								<th rowspan="1" colspan="1">부서</th>
								<th rowspan="1" colspan="1">입사일</th>
								<th rowspan="1" colspan="1">재직상태</th>
							</tr>
						</tfoot>
					</table>
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
<%@ include file="../include/footer.jsp"%>