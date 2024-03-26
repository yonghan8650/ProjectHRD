<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조직도</title>
<style>
    table {
        border-collapse: collapse;
        width: 100%;
    }
    th, td {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
    }
    th {
        background-color: #f2f2f2;
    }
    img {
        width: 50px;
        height: auto;
    }
    button {
        background-color: #008CBA;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
</style>
</head>
<body>
    <h2>조직도</h2>

    <form id="addToFavoritesForm" action="/org/addToFavorites" method="post" onsubmit="return submitForm();">
        <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
        <input type="hidden" name="selectedEmployeeIds">
        <table>
            <tr>
                <th><input type="checkbox" onclick="toggleAll(this)"></th>
                <th>사원 이름</th>
                <th>사진</th>
                <th>부서</th>
                <th>직책</th>
                <th>연락처</th>
                <th>이메일</th>
                <th>재직 상태</th>
            </tr>
            <c:forEach var="organizationChart" items="${orgList}">
                <tr>
                    <td><input type="checkbox" name="employee_id" value="${organizationChart.employee_id}"></td>
                    <td>${organizationChart.emp_name}</td>
                    <td><img src="${organizationChart.profil}" alt="프로필 사진"></td>
                    <td>${organizationChart.DEPTID}</td>
                    <td>${organizationChart.JOB_ID}</td>
                    <td>${organizationChart.emp_tel}</td>
                    <td>${organizationChart.emp_mail}</td>
                    <td>${organizationChart.STATUS}</td>
                </tr>
            </c:forEach>
        </table>
        <button type="submit">즐겨찾기 추가</button>
    </form>
    
    <button type="button" onclick="location.href='/org/orgFavor';">즐겨찾기 이동</button>
	<button type="button" onclick="location.href='/org/orgDept';">부서목록 보기</button>
    <script>
    // 체크박스를 클릭했을 때 선택된 행을 강조하는 함수
    function highlightRow(checkbox) {
        var row = checkbox.parentNode.parentNode; // 체크박스가 속한 행
        if (checkbox.checked) {
            row.style.backgroundColor = "#f0f0f0"; // 선택된 경우 배경색 변경
        } else {
            row.style.backgroundColor = ""; // 선택이 해제된 경우 배경색 초기화
        }
    }

    function toggleAll(source) {
        checkboxes = document.getElementsByName('employee_id');
        for(var i = 0; i < checkboxes.length; i++) {
            checkboxes[i].checked = source.checked;
            highlightRow(checkboxes[i]); // 선택된 행 강조
        }
    }

    function submitForm() {
        var checkboxes = document.getElementsByName('employee_id');
        var selectedEmployeeIds = [];

        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].checked) {
                selectedEmployeeIds.push(checkboxes[i].value);
            }
        }

        if (selectedEmployeeIds.length === 0) {
            alert("선택된 사원이 없습니다.");
            return false;
        }

        var hiddenInput = document.createElement('input');
        hiddenInput.type = 'hidden';
        hiddenInput.name = 'selectedEmployeeIds';
        hiddenInput.value = JSON.stringify(selectedEmployeeIds);
        document.getElementById('addToFavoritesForm').appendChild(hiddenInput);

        return true;
    }
</script>


</body>
</html>