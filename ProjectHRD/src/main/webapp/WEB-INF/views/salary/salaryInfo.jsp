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
	<h1>salaryInfo.jsp</h1>
	<h2>급상여기본정보관리 페이지(관리자용)</h2>
	
	salaryInfoEmp : ${salaryInfoEmp }<br>
	salaryInfoMore : ${salaryInfoMore }<br>
	cri : ${cri }<br>
	${cri.keyword }<br>
	${cri.employee_id }<br>
	
	<form action="/salary/salaryInfo">
		<fieldset>
			<legend>급여 검색</legend>
				입사년도 : <input type="text" name="startDate">
				<input type="submit" value="검색">
				예시 : 2023
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
							<a href="/salary/salaryInfo?startDate=${cri.startDate }&employee_id=${sie.employee_id }">${sie.employee_id }</a>
						</td>
						<td>${sie.emp_name }</td>
						<td>${sie.JOB_ID }</td>
						<td>${sie.department }</td>
					</tr>
				</c:forEach>
		      
		    </table>	
	</fieldset>
	
	<fieldset>
		<legend>상세정보</legend>
			<form role="form" method="post">
			    <table border="1">
			    	<!-- 검색 값이 여기에 출력 -->
			    	<c:forEach var="sim" items="${salaryInfoMore }">
				    	<tr>
							<td>사원번호</td>
							<td><input type="text" name="employee_id" value="${sim.employee_id }" readonly></td>
						</tr>
						<tr>
							<td>사원이름</td>
							<td><input type="text" name="emp_name" value="${sim.emp_name }" readonly></td>
						</tr>
							<td>직급</td>
							<td><input type="text" name="JOB_ID" value="${sim.JOB_ID }" readonly></td>
						<tr>
							<td>부서</td>
							<td><input type="text" name="department" value="${sim.department }" readonly></td>
						</tr>
						<tr>
							<td>은행명</td>
							<td><input type="text" name="bank" value="${sim.bank }"></td>
						</tr>
						<tr>
							<td>계좌번호</td>
							<td><input type="text" name="account" value="${sim.account }"></td>
						</tr>
						<tr>
							<td>예금주</td>
							<td><input type="text" name="account_holder" value="${sim.account_holder }"></td>
						</tr>
					</c:forEach>
			    </table>
			    <input type="submit" value="수정하기">
			</form>	
	</fieldset>
</body>
</html>