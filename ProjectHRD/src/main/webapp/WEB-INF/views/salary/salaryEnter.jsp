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
	<h1>salaryEnter.jsp</h1>
	<h2>급여 입력 페이지(관리자용)</h2>
	
	salaryInfoEmp : ${salaryInfoEmp }<br>
	salaryEnter : ${salaryEnter }<br>
	cri : ${cri }<br>
	${cri.keyword }<br>
	${cri.emp_id }<br>
	
	<form action="/salary/salaryEnter">
		<fieldset>
			<legend>급여 검색</legend>
				입사년월 : <input type="text" name="keyword">
				<input type="submit" value="검색">
				예시 : 2023-12
		</fieldset>
	</form>
	
	<fieldset>
		<legend>기본정보</legend>
		    <table border="1">
				<tr>
				   <td>사원번호</td>
				   <td>성명</td>
				   <td>직급</td>
				   <td>부서</td>
				</tr>
				
				<!-- 검색 값이 여기에 출력 -->
				<c:forEach var="sie" items="${salaryInfoEmp }">
					<tr>
						<td>
							<a href="/salary/salaryInfo?keyword=${cri.keyword }&emp_id=${sie.employee_id }">${sie.employee_id }</a>
						</td>
						<td>${sie.emp_name }</td>
						<td>${sie.JOB_ID }</td>
						<td>${sie.department }</td>
					</tr>
				</c:forEach>
		      
		    </table>	
	</fieldset>
	
	<fieldset>
	
	</fieldset>

</body>
</html>