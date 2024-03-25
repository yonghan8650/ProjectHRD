<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>

<h1>salarySearch.jsp</h1>
<h2>급여조회 페이지(관리자용)</h2>

salarySearchEmp : ${salarySearchEmp }
<br>
salarySearchMore : ${salarySearchMore }
<br>

<div class="content">
	<section class="content">
		<div class="form-group">
			<label>급여년월 :</label>
			<div class="input-group date">
				<div class="input-group-addon">
					<i class="fa fa-calendar"></i>
				</div>
				<input type="text" class="form-control pull-right" id="datepicker">
			</div>
		</div>

		<form action="/salary/salarySearch">
			<fieldset>
				<legend>급여 검색</legend>
				급여년월 : <input type="text" name="startDate"> <input type="submit" value="검색"> 예시 : 2023-12
			</fieldset>
		</form>

		<div class="col-md-6">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">급여 목록</h3>
				</div>

				<div class="box-body no-padding">
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

		<div class="col-md-6">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">급여 명세서</h3>
				</div>

				<div class="box-body no-padding">
					<table class="table table-striped">
						<tbody>
							<tr>
								<th>no</th>
								<th colspan="2">지급항목</th>
								<th colspan="2">금액</th>
							</tr>
							<!-- 검색 값이 여기에 출력 -->
							<c:forEach var="ssm" items="${salarySearchMore }">
								<tr>
									<td>1</td>
									<td>기본금</td>
									<td><fmt:formatNumber value="${ssm.salary }" pattern="#,###" /></td>
									<td>국민연금</td>
									<td><fmt:formatNumber value="${ssm.premium_1 }" pattern="#,###" /></td>
								</tr>
								<tr>
									<td>2</td>
									<td>상여</td>
									<td><fmt:formatNumber value="${ssm.bonus }" pattern="#,###" /></td>
									<td>건강보험</td>
									<td><fmt:formatNumber value="${ssm.premium_2 }" pattern="#,###" /></td>
								</tr>
								<tr>
									<td>3</td>
									<td>-</td>
									<td>-</td>
									<td>장기요양보험</td>
									<td><fmt:formatNumber value="${ssm.premium_3 }" pattern="#,###" /></td>
								</tr>
								<tr>
									<td>4</td>
									<td>-</td>
									<td>-</td>
									<td>고용보험</td>
									<td><fmt:formatNumber value="${ssm.premium_4 }" pattern="#,###" /></td>
								</tr>
							</c:forEach>
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
	</section>
</div>

<%@ include file="../include/footer.jsp"%>