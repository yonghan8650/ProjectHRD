<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원정보조회</title>
</head>
<body>
${viewEmpVO }

<hr>
 <c:out value="${viewEmpVO.app_issue }" default="기본값0000"></c:out>
<hr>
</body>
</html>