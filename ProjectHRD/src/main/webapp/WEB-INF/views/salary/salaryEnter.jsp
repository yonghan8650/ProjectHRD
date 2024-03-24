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
	cri : ${cri }<br>
	${cri.keyword }<br>
	${cri.employee_id }<br>
	
	<form action="/salary/salaryEnter">
		<fieldset>
			<legend>급여 검색</legend>
				입사년월 : <input type="text" name="keyword">
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
							<a href="/salary/salaryEnter?keyword=${cri.keyword }&employee_id=${see.employee_id }">${see.employee_id }</a>
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
						<c:forEach var="sem" items="${salaryEnterMore }">
							<tr>
								<td>1</td>
								<td>기본금</td>
								<td><fmt:formatNumber value="${sem.salary }" pattern="#,###" /></td>
								<td>국민연금</td>
								<td><fmt:formatNumber value="${sem.premium_1 }" pattern="#,###" /></td>
							</tr>
							<tr>
								<td>2</td>
								<td>상여</td>
								<td><fmt:formatNumber value="${sem.bonus }" pattern="#,###" /></td>
								<td>건강보험</td>
								<td><fmt:formatNumber value="${sem.premium_2 }" pattern="#,###" /></td>
							</tr>
							<tr>
								<td>3</td>
								<td>-</td>
								<td>-</td>
								<td>장기요양보험</td>
								<td><fmt:formatNumber value="${sem.premium_3 }" pattern="#,###" /></td>
							</tr>
							<tr>
								<td>4</td>
								<td>-</td>
								<td>-</td>
								<td>고용보험</td>
								<td><fmt:formatNumber value="${sem.premium_4 }" pattern="#,###" /></td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<c:forEach var="sem" items="${salaryEnterMore }">
							<tr>
								<td>합계</td>
								<td>지급총액</td>
								<td><fmt:formatNumber value="${sem.sum }" pattern="#,###" />원</td>
								<td>공제총액</td>
								<td><fmt:formatNumber value="${sem.premium }" pattern="#,###" />원</td>
							</tr>
						</c:forEach>
					</tfoot>
				</table>
				<input type="submit" value="입력하기">
				<input type="submit" value="계산하기">
				<input type="submit" value="저장하기">
			</form>	
	</fieldset>

</body>
</html>