<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
    <thead>
        <tr>
            <th>사원 이름</th>
            <th>프로필 사진</th>
            <th>직책</th>
            <th>부서</th>
            <th>전화번호</th>
            <th>이메일</th>
            <th>재직상태</th>
            <th>즐겨찾기</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${departmentEmployees }" var="departmentChart">
            <tr>
                <td>${departmentEmployees.emp_name}</td>
                <td>${departmentEmployees.profil}</td>
                <td>${departmentEmployees.JOB_ID}</td>
                <td>${departmentEmployees.DEPTID}</td>
                <td>${departmentEmployees.emp_tel}</td>
                <td>${departmentEmployees.emp_mail}</td>
                <td>${departmentEmployees.STATUS}</td>
                <td>
                    <input type="checkbox" id="favorite_${departmentEmployees.employee_id}" onchange="toggleFavorite(${departmentEmployees.employee_id})" ${departmentEmployees.FAVORS ? 'checked' : ''}>
                </td>
                <td>
                    <button onclick="toggleFavorite(${departmentEmployees.employee_id})">
                        확인
                    </button>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>