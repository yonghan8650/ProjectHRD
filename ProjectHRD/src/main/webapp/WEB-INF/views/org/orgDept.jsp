<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <c:forEach items="${orgList}" var="OrganizationMapper">
            <tr>
                <td>${organization.employee_id}</td>
                <td>${organization.profil}</td>
                <td>${organization.JOB_ID}</td>
                <td>${organization.DEPTID}</td>
                <td>${organization.emp_tel}</td>
                <td>${organization.emp_mail}</td>
                <td>${organization.STATUS}</td>
                <td>
                    <input type="checkbox" id="favorite_${employee.employee_id}" onchange="toggleFavorite(${employee.employee_id})" ${employee.FAVORS ? 'checked' : ''}>
                </td>
                <td>
                    <button onclick="toggleFavorite(${employee.employee_id})">
                        확인
                    </button>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>