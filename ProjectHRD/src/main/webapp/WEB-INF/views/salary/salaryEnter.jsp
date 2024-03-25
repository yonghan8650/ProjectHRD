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
	
	salaryEnterEmp : ${salaryEnterEmp }<br>
	salaryEnterMore : ${salaryEnterMore }<br>
	salaryEnterSalary : ${salaryEnterSalary }<br>
	cri : ${cri }<br>
	${cri.keyword }<br>
	${cri.employee_id }<br>
	
	<form action="/salary/salaryEnter">
		<fieldset>
			<legend>급여 검색</legend>
				입사년월 : <input type="text" name="startDate">
				<input type="submit" value="검색">
				예시 : 2023-12
		</fieldset>
	</form>
	
	<fieldset>
		<legend>사원목록</legend>
		    <table border="1" style="float:left;">
				<tr>
				   <td>사원번호</td>
				   <td>성명</td>
				   <td>직급</td>
				   <td>부서</td>
				</tr>
				
				<!-- 검색 값이 여기에 출력 -->
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
		      
		    </table>	
	</fieldset>
	
	<fieldset>
		<legend>급여입력(지급/공제내역)</legend>
			<form action="/salary/salaryEnter">
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
						<c:forEach var="sem" items="${salaryEnterMore }">
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
						</c:forEach>
					</tbody>
				</table>
				<input type="submit" value="계산하기">
			</form>	
			
			<c:forEach var="ses" items="${salaryEnterSalary }">
			<form role="form" method="post">
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
						<tr>
							<td>1</td>
							<td>기본금</td>
							<td>
								<input type="hidden" name="salary" value="${ses.salary }">
								<fmt:formatNumber value="${ses.salary }" pattern="#,###" />
							</td>
							<td>국민연금</td>
							<td><fmt:formatNumber value="${ses.premium_1 }" pattern="#,###" /></td>
						</tr>
						<tr>
							<td>2</td>
							<td>상여</td>
							<td>
								<input type="hidden" name="bonus" value="${ses.bonus }">
								<fmt:formatNumber value="${ses.bonus }" pattern="#,###" />
							</td>
							<td>건강보험</td>
							<td><fmt:formatNumber value="${ses.premium_2 }" pattern="#,###" /></td>
						</tr>
						<tr>
							<td>3</td>
							<td>-</td>
							<td>-</td>
							<td>장기요양보험</td>
							<td><fmt:formatNumber value="${ses.premium_3 }" pattern="#,###" /></td>
						</tr>
						<tr>
							<td>4</td>
							<td>-</td>
							<td>-</td>
							<td>고용보험</td>
							<td><fmt:formatNumber value="${ses.premium_4 }" pattern="#,###" /></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td>합계</td>
							<td>지급총액</td>
							<td>
								<input type="hidden" name="sum" value="${ses.sum }">
								<fmt:formatNumber value="${ses.sum }" pattern="#,###" />원
							</td>
							<td>공제총액</td>
							<td>
								<input type="hidden" name="premium" value="${ses.premium }">
								<fmt:formatNumber value="${ses.premium }" pattern="#,###" />원
							</td>
						</tr>
					</tfoot>
				</table>
				<input type="hidden" name="employee_id" value="${cri.employee_id }">
				<input type="hidden" name="JOB_ID" value="${cri.JOB_ID }">
				<input type="submit" value="저장하기">
			</form>	

			</c:forEach>
	</fieldset>

</body>
</html>