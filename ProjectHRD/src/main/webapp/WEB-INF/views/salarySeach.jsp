<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>salarySeach.jsp</h1>
	
	salarySerch : ${salarySeach }<br>
	<form action="/salarySeach">
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
			   <td>사원번호</td>
			   <td>지급년월</td>
			   <td>직급번호</td>
			   <td>기본금</td>
			   <td>상여금</td>
			   <td>보험료</td>
			   <td>실수령액</td>
			</tr>
			
			<!-- 검색 값이 여기에 출력 -->
			<c:forEach var="ss" items="${salarySeach }">
				<tr>
					<td>${ss.employee_id }</td>
					<td>${ss.pay_yearmonth }</td>
					<td>${ss.JOB_ID }</td>
					<td>${ss.salary }</td>
					<td>${ss.bonus }</td>
					<td>${ss.premium }</td>
					<td>${ss.sum }</td>
				</tr>
			</c:forEach>
	      
	    </table>	
	</fieldset>
	

</body>
</html>