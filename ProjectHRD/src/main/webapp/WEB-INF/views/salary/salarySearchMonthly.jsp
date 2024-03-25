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
	<h1>salarySearchMonthly.jsp</h1>
	<h2>월별 급여조회 페이지(관리자용)</h2>
	
	salarySearchMonthly : ${salarySearchMonthly }
	
	<hr>
	
	<form action="/salary/salarySearchMonthly">
		<fieldset>
			<legend>월별 급여 검색</legend>
				급여년월 : <input type="text" name="keyword"> ~ <input type="text" name="keyword2">
				<input type="submit" value="검색">
				예시 : 2023-09 ~ 2023-12
		</fieldset>
	</form>
	
	<fieldset>
		<legend>사원목록</legend>
		    <table border="1">
				<tr>
				   <td>순번</td>
				   <td>사원번호</td>
				   <td>성명</td>
				   <td>직급</td>
				   <td>부서</td>
				</tr>
				
				<!-- 검색 값이 여기에 출력 -->
				<c:forEach var="ssm" items="${salarySearchMonthly }">
					<tr>
						<!-- 순번은 임시로 지정함 -->
						<td>1</td>
						<td>
							<a href="/salarySearch?keyword=<fmt:formatDate value="${ssm.pay_yearmonth }" pattern="yyyy-MM"/>
							&emp_id=${ssm.employee_id }">${ssm.employee_id }</a>
						</td>
						<td>${ssm.emp_name }</td>
						<td>${ssm.JOB_ID }</td>
						<td>${ssm.department }</td>
					</tr>
				</c:forEach>
		      
		    </table>	
	</fieldset>
	
	<fieldset>
		<legend>급상여 상세내역</legend>
		    <table border="1">
		    	<thead>
		    		<c:forEach var="ss" items="${salarySearchMonthly }">
						<tr>
						   <td>항목명</td>
						   <!-- 월별은 임시, 추후 2023-01 식으로 변경 -->
						   <td>1월</td>
						   <td>2월</td>
						   <td>3월</td>
						   <td>4월</td>
						   <td>5월</td>
						   <td>6월</td>
						   <td>7월</td>
						   <td>8월</td>
						   <td>9월</td>
						   <td>10월</td>
						   <td>11월</td>
						   <td>12월</td>
						</tr>
					</c:forEach>
				</thead>
				<tbody>
					<!-- 검색 값이 여기에 출력 -->
					<c:forEach var="ss" items="${salarySearchMonthly }">
						<tr>
							<td>기본금</td>
							<td>${ss.salary }</td>
						</tr>
						<tr>
							<td>상여</td>
							<td>${ss.bonus }</td>
						</tr>
						<tr>
							<td>국민연금</td>
							<td>0</td>
						</tr>
						<tr>
							<td>건강보험</td>
							<td>0</td>
						</tr>
						<tr>
							<td>장기요양보험</td>
							<td>0</td>
						</tr>
						<tr>
							<td>고용보험</td>
							<td>0</td>
						</tr>
					</c:forEach>
				</tbody> 
		    </table>	
	</fieldset>

</body>
</html>