<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>salarySearch.jsp</h1>
	<h2>급여조회 페이지(관리자용)</h2>
	
	salarySearchEmp : ${salarySearchEmp }<br>
	salarySearchMore : ${salarySearchMore }<br>
	
	<form action="/salary/salarySearch">
		<fieldset>
			<legend>급여 검색</legend>
				급여년월 : <input type="text" name="keyword">
				<input type="submit" value="검색">
				예시 : 2023-12
		</fieldset>
	</form>
	
	<fieldset>
		<legend>급여 목록</legend>
		    <table border="1">
				<tr>
				   <td>지급기준일</td>
				   <td>사원번호</td>
				   <td>성명</td>
				   <td>부서</td>
				   <td>지급총액</td>
				   <td>공제총액</td>
				   <td>실지급액</td>
				</tr>
				
				<!-- 검색 값이 여기에 출력 -->
				<c:forEach var="sse" items="${salarySearchEmp }">
					<tr>
						<td><fmt:formatDate value="${sse.pay_yearmonth }" pattern="yyyy.MM.dd"/></td>
						<td>
							<a href="/salary/salarySearch?keyword=<fmt:formatDate value="${sse.pay_yearmonth }" pattern="yyyy-MM"/>
							&employee_id=${sse.employee_id }">${sse.employee_id }</a>
						</td>
						<td>${sse.emp_name }</td>
						<td>${sse.JOB_ID }</td>
						<td>${sse.salary }</td>
						<td>${sse.premium }</td>
						<td>${sse.sum }</td>
					</tr>
				</c:forEach>
		      
		    </table>	
	</fieldset>
	
	<fieldset>
		<legend>급여 명세서</legend>
		    <table border="1">
			    <colgroup>
			    	<col style="width:50px;">
			    	<col style="width:100px;">
			    	<col style="width:100px;">
			    	<col style="width:100px;">
			    	<col style="width:100px;">
			    </colgroup>
		    	<thead>
					<tr>
						<td>no</td>
					   	<td colspan="2">지급항목</td>
					   	<td colspan="2">금액</td>
					</tr>
				</thead>
				<tbody>
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
	</fieldset>

</body>
</html>