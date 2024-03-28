<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>

<h1>급여조회(관리자)</h1>

<link rel="stylesheet" href="<c:url value="/resources/plugins/datepicker/datepicker3.css"/>">
<script src="<c:url value="/resources/plugins/datepicker/bootstrap-datepicker.js"/>"></script>
<script src="<c:url value="/resources/plugins/datepicker/locales/bootstrap-datepicker.kr.js"/>"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#mailSend").click(function() {
            $("#mailSend").prop("disabled", true);
			
			var salaryList = ${salaryList};
			
			$.ajax({
				url : "/sendMail",
				type : "POST",
				dataType : "TEXT",
				contentType : "application/json; charset=utf-8",
				data : JSON.stringify(salaryList),
				success : function(response) {
					alert("메일이 성공적으로 전송되었습니다.");
	                $("#mailSend").prop("disabled", false);
				},
				error : function(xhr, status, error) {
					alert("메일 전송에 실패했습니다.");
					console.log(error);
					console.error(xhr.responseText);
	                $("#mailSend").prop("disabled", false);
				}
			});
		});
	});
</script>

<section class="content">
	<div class="box">
		<div class="box-header">
			<h3 class="box-title">급여 검색 (급여년월 입력)</h3>
		</div>
	<div class="row">
		<div class="col-md-6">
			<fieldset>
				<form action="/salary/salarySearch">
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
		<div class="col-md-6">
			<button class="btn btn-default" id="mailSend" style="float:right;">email보내기</button>
		</div>
	</div>	
	
	<div class="row">
		<div class="col-md-6">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">급여 목록</h3>
				</div>
				<div class="box-body no-padding table-responsive" style="height: 300px;">
					<table class="table table-striped">
						<tbody>
							<tr>
								<th>지급기준일</th>
								<th>사원번호</th>
								<th>성명</th>
								<th>부서</th>
								<th>지급총액</th>
								<th>공제총액</th>
								<th>실지급액</th>
							</tr>
							<c:forEach var="sse" items="${salarySearchEmp }">
								<tr>
									<td><fmt:formatDate value="${sse.pay_yearmonth }" pattern="yyyy.MM.dd" /></td>
									<td><a href="/salary/salarySearch?startDate=<fmt:formatDate value="${sse.pay_yearmonth }" pattern="yyyy-MM"/>
									&employee_id=${sse.employee_id }">${sse.employee_id }</a></td>
									<td>${sse.emp_name }</td>
									<td>${sse.JOB_ID }</td>
									<td>${sse.salary }</td>
									<td>${sse.premium }</td>
									<td>${sse.sum }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<c:forEach var="ssm" items="${salarySearchMore }">
			<div class="col-md-6">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">급여 명세서</h3>
					</div>
					<div class="box-body no-padding table-responsive" style="height: 300px;">
						<table class="table table-striped">
							<tbody>
								<tr>
									<th>no</th>
									<th colspan="2">지급항목</th>
									<th colspan="2">금액</th>
								</tr>
								<tr>
									<td>1</td>
									<td>기본금</td>
									<td><fmt:formatNumber value="${ssm.salary }" pattern="#,###" />원</td>
									<td>국민연금</td>
									<td><fmt:formatNumber value="${ssm.premium_1 }" pattern="#,###" />원</td>
								</tr>
								<tr>
									<td>2</td>
									<td>상여</td>
									<td><fmt:formatNumber value="${ssm.bonus }" pattern="#,###" />원</td>
									<td>건강보험</td>
									<td><fmt:formatNumber value="${ssm.premium_2 }" pattern="#,###" />원</td>
								</tr>
								<tr>
									<td>3</td>
									<td>-</td>
									<td>-</td>
									<td>장기요양보험</td>
									<td><fmt:formatNumber value="${ssm.premium_3 }" pattern="#,###" />원</td>
								</tr>
								<tr>
									<td>4</td>
									<td>-</td>
									<td>-</td>
									<td>고용보험</td>
									<td><fmt:formatNumber value="${ssm.premium_4 }" pattern="#,###" />원</td>
								</tr>
							</tbody>
							<tfoot>
								<c:forEach var="ssm" items="${salarySearchMore }">
									<tr>
										<td>합계</td>
										<td>지급총액</td>
										<td><fmt:formatNumber value="${ssm.sum }" pattern="#,###" />원</td>
										<td>공제총액</td>
										<td><fmt:formatNumber value="${ssm.premium }" pattern="#,###" />원</td>
									</tr>
								</c:forEach>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
		</c:forEach>
		</div>
	</div>
</section>

<script>
	$('#datepicker').datepicker({
		format : "yyyy-mm",
		language : "kr",
		showWeekDays : false,
		autoclose : true,
        minViewMode: 1
	})
	.on("changeDate", function(e) {
		console.log($('#datepicker').val());
	})
</script>

<%@ include file="../include/footer.jsp"%>