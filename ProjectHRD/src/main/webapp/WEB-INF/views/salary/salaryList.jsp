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
	<h1>salaryList.jsp</h1>
	
    <table border="1">
       <tr>
          <td>사원번호</td>
          <td>기본금</td>
          <td>은행</td>
          <td>계좌</td>
          <td>예금주</td>
       </tr>
    
     <c:forEach var="svo" items="${salaryList }">
       <tr>
          <td>${svo.employee_id }</td>
          <td>${svo.salary }</td>
          <td>${svo.bank }</td>
          <td>${svo.account }</td>
          <td>${svo.account_holder }</td>
       </tr>
      </c:forEach> 
      
    </table>	
</body>
</html>