<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp"%>

<link rel="stylesheet" href="<c:url value="/resources/plugins/datepicker/datepicker3.css"/>">
<script src="<c:url value="/resources/plugins/datepicker/bootstrap-datepicker.js"/>"></script>
<script src="<c:url value="/resources/plugins/datepicker/locales/bootstrap-datepicker.kr.js"/>"></script>

<section class="content-header">
	<h1>급여 입력(관리자)</h1>
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
							<form action="/salary/salaryEnter">
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
					<table class="table table-striped" style="width: 100%;">
						<tbody>
							<tr>
								<th>사원번호</th>
								<th>성명</th>
								<th>직급</th>
								<th>부서</th>							
							</tr>
							<c:forEach var="see" items="${salaryEnterEmp }">
								<tr>
									<td>
										<a href="/salary/salaryEnter?startDate=${cri.startDate }&employee_id=${see.employee_id }&JOB_ID=${see.JOB_ID }">${see.employee_id }</a>
									</td>
									<td>${see.emp_name }</td>
									<td>${see.JOB_ID }</td>
									<td>${see.department }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		
		<c:forEach var="sem" items="${salaryEnterMore }">
		<div class="col-md-6">
			<div class="box">
				<form action="/salary/salaryEnter">
					<div class="box-header">
						<h3 class="box-title">급여입력(지급/공제내역)</h3>
						<div class="box-tools">
							<button type="submit" class="btn btn-primary">계산하기</button>
						</div>
					</div>
					
					<div class="box-body no-padding table-responsive" style="height: 100px;">
						<table class="table table-striped">
							<tbody>
								<tr>
									<th>no</th>
								   	<th colspan="2">지급항목</th>
								   	<th colspan="2">금액</th>						
								</tr>
								<tr>
									<td>1</td>
									<td colspan="2">기본금</td>
									<td colspan="2">
										<input type="hidden" name="startDate" value="${cri.startDate }">
										<input type="hidden" name="employee_id" value="${cri.employee_id }">
										<input type="hidden" name="JOB_ID" value="${cri.JOB_ID }">
										<input type="text" name="salary" value="${sem.salary }">
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</form>
			</div>
		</div>
		</c:forEach>
		
		<c:forEach var="ses" items="${salaryEnterSalary }">
		<div class="col-md-6">
			<div class="box">
				<form role="form" method="post">
					<div class="box-header">
						<h3 class="box-title">급여입력(지급/공제내역)</h3>
						<div class="box-tools">
							<button type="submit" class="btn btn-primary" onclick="alert('급여정보가 입력되었습니다.')">저장하기</button>
						</div>
					</div>
					
					<div class="box-body no-padding">
						<table class="table table-striped table-responsive" style="height: 300px;">
							<tbody>
								<tr>
									<th>no</th>
									<th colspan="2">지급항목</th>
									<th colspan="2">금액</th>
								</tr>
								<tr>
									<td>1</td>
									<td>기본금</td>
									<td>
										<fmt:formatNumber value="${ses.salary }" pattern="#,###" />원
										<input type="hidden" name="salary" value="${ses.salary }">
									</td>
									<td>국민연금</td>
									<td><fmt:formatNumber value="${ses.premium_1 }" pattern="#,###" />원</td>
								</tr>
								<tr>
									<td>2</td>
									<td>상여</td>
									<td>
										<fmt:formatNumber value="${ses.bonus }" pattern="#,###" />원
										<input type="hidden" name="bonus" value="${ses.bonus }">
									</td>
									<td>건강보험</td>
									<td><fmt:formatNumber value="${ses.premium_2 }" pattern="#,###" />원</td>
								</tr>
								<tr>
									<td>3</td>
									<td>-</td>
									<td>-</td>
									<td>장기요양보험</td>
									<td><fmt:formatNumber value="${ses.premium_3 }" pattern="#,###" />원</td>
								</tr>
								<tr>
									<td>4</td>
									<td>-</td>
									<td>-</td>
									<td>고용보험</td>
									<td><fmt:formatNumber value="${ses.premium_4 }" pattern="#,###" />원</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td>합계</td>
									<td>지급총액</td>
									<td>
										<fmt:formatNumber value="${ses.sum }" pattern="#,###" />원
										<input type="hidden" name="sum" value="${ses.sum }">
									</td>
									<td>공제총액</td>
									<td>
										<fmt:formatNumber value="${ses.premium }" pattern="#,###" />원
										<input type="hidden" name="premium" value="${ses.premium }">
									</td>
								</tr>
							</tfoot>
						</table>
						<input type="hidden" name="employee_id" value="${cri.employee_id }">
						<input type="hidden" name="JOB_ID" value="${cri.JOB_ID }">
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