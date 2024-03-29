<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp"%>

<link rel="stylesheet" href="<c:url value="/resources/plugins/datepicker/datepicker3.css"/>">
<script src="<c:url value="/resources/plugins/datepicker/bootstrap-datepicker.js"/>"></script>
<script src="<c:url value="/resources/plugins/datepicker/locales/bootstrap-datepicker.kr.js"/>"></script>

<section class="content-header">
	<h1>급상여기본정보관리</h1>
</section>

<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">급여 검색 (입사년도 입력)</h3>
				</div>
				
				<div class="row">
					<div class="col-md-6">
						<fieldset>
							<form action="/salary/salaryInfo">
								<div class="input-group date" style="width: 400px;">
									<div class="input-group-addon">
										<i class="fa fa-calendar"></i>
									</div>
									<input type="text" class="form-control pull-right" id="datepicker" name="startDate">
									<div class="input-group-btn">
										<button type="submit" class="btn btn-primary">검색</button>
									</div>
								</div>
							</form>
						</fieldset>
					</div>
				</div>
			</div>
		</div>	
	</div>
	
	<div class="row">
		<div class="col-md-6">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">사원 목록</h3>
				</div>

				<div class="box-body no-padding table-responsive" style="height: 400px;">
					<table class="table table-striped">
						<tbody>
							<tr>
								<th>사원번호</th>
								<th>성명</th>
								<th>직급</th>
								<th>부서</th>							
							</tr>
							<c:forEach var="sie" items="${salaryInfoEmp }">
								<tr>
									<td>
										<a href="/salary/salaryInfo?startDate=${cri.startDate }&employee_id=${sie.employee_id }">${sie.employee_id }</a>
									</td>
									<td>${sie.emp_name }</td>
									<td>${sie.JOB }</td>
									<td>${sie.DEPTNM }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<c:forEach var="sim" items="${salaryInfoMore }">
			<div class="col-md-6">
				<div class="box">
					<form role="form" method="post">
						<div class="box-header">
							<h3 class="box-title">상세정보</h3>
							<div class="box-tools">
								<button type="submit" class="btn btn-primary" onclick="alert('급여기본정보가 수정되었습니다.')">수정하기</button>
							</div>
						</div>
						
						<div class="box-body no-padding table-responsive" style="height: 400px;">
							<table class="table table-striped">
						    	<tr>
									<td><b>사원번호</b></td>
									<td><input type="text" name="employee_id" value="${sim.employee_id }" disabled></td>
								</tr>
								<tr>
									<td><b>사원이름</b></td>
									<td><input type="text" name="emp_name" value="${sim.emp_name }" disabled></td>
								</tr>
								<tr>
									<td><b>직급</b></td>
									<td><input type="text" name="JOB_ID" value="${sim.JOB }" disabled></td>
								</tr>
								<tr>
									<td><b>부서</b></td>
									<td><input type="text" name="department" value="${sim.DEPTNM }" disabled></td>
								</tr>
								<tr>
									<td><b>은행명</b></td>
									<td><input type="text" name="bank" value="${sim.bank }"></td>
								</tr>
								<tr>
									<td><b>계좌번호</b></td>
									<td><input type="text" name="account" value="${sim.account }"></td>
								</tr>
								<tr>
									<td><b>예금주</b></td>
									<td><input type="text" name="account_holder" value="${sim.account_holder }"></td>
								</tr>
							</table>
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
						</div>
					</form>
				</div>
			</div>
		</c:forEach>
	</div>
</section>

<script>
	$('#datepicker').datepicker({
		format : "yyyy",
		language : "kr",
		showWeekDays : false,
		autoclose : true,
        minViewMode: 2
	})
	.on("changeDate", function(e) {
		console.log($('#datepicker').val());
	})
</script>

<%@ include file="../include/footer.jsp"%>