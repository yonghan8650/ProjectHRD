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
    <thead>
        <tr>
            <th>Employee ID</th>
            <th>Profile</th>
            <th>Job ID</th>
            <th>Department ID</th>
            <th>Telephone</th>
            <th>Email</th>
            <th>Status</th>
            <th>Favorite</th>
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

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
    function checkFavors(employee_Id) {
        var checkbox = document.getElementById('favorite_' + employee_Id);
        var isFavorite = checkbox.checked;

        $.ajax({
            url: '/org/orgFavors',
            type: 'POST',
            data: {employee_Id: employee_Id, favorite: isFavorite},
            success: function(response) {
                if (response === 'success') {
                    // 즐겨찾기 상태를 업데이트하거나 UI를 변경하는 등의 작업 수행
                    alert('Favorite checked successfully');
                } else {
                    alert('Error checking favorite');
                }
            },
            error: function() {
                alert('Communication error');
            }
        });
    }
</script>
</body>
</html>