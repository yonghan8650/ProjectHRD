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
	
	salarySearch : ${salarySearch }<br>
	<form action="/salarySearch">
		<fieldset>
			<legend>급여 검색</legend>
				급여년월 : <input type="text" name="keyword">
				<input type="submit" value="검색">
				2023-12-10
		</fieldset>
	</form>
	
	<fieldset>
		<legend>급여 목록</legend>
		    <table border="1">
				<tr>
				   <td>지급기준일</td>
				   <td>사원번호</td>
				   <td>부서</td>
				   <td>지급총액</td>
				   <td>공제총액</td>
				   <td>실지급액</td>
				</tr>
				
				<!-- 검색 값이 여기에 출력 -->
				<c:forEach var="ss" items="${salarySearch }">
					<tr>
						<td><fmt:formatDate value="${ss.pay_yearmonth }" pattern="yyyy.MM.dd"/></td>
						<td>${ss.employee_id }</td>
						<td>${ss.JOB_ID }</td>
						<td>${ss.salary }</td>
						<td>${ss.premium }</td>
						<td>${ss.sum }</td>
					</tr>
				</c:forEach>
		      
		    </table>	
	</fieldset>
	
	<fieldset>
		<legend>급여 명세서</legend>
		    <table border="1">
		    	<thead>
					<tr>
					   <td>지급항목</td>
					   <td>공제항목</td>
					</tr>
				</thead>
				<tbody>
					<!-- 검색 값이 여기에 출력 -->
					<c:forEach var="ss" items="${salarySearch }">
						<tr>
							<td>기본금</td>
							<td>${ss.salary }</td>
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