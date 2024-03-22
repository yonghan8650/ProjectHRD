<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>
<div class="content">

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
							<td><a href="/emp/viewEmp?employee_id=${list.employee_id }">${list.employee_id }</a></td>
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

<%@ include file="../include/footer.jsp"%>