<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OrganizationChart</title>
</head>
<body>
<table border="1">
  <tr>
     <th>사원 ID</th>
     <th>프로필 사진</th>
     <th>직책</th>
     <th>부서</th>
     <th>전화번호</th>
     <th>이메일</th>
     <th>재직 상태</th>
  </tr>
  
  <c:forEach var="OrganizationMapper" items="${orgList }">
  <tr>
  <td>${organization.employee_id }</td>
  <td>${organization.profil }</td>
  <td>${organization.JOB_ID }</td>
  <td>${organization.DEPTID }</td>
  <td>${organization.emp_tel }</td>
  <td>${organization.emp_mail }</td>
  <td>${organization.STATE }</td>
  </tr>
  
  
  
  
  
  
  
  
  
  
  
  
  
  </c:forEach>







</table>
</body>
</html>