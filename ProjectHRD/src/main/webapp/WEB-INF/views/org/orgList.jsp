<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp" %>
 <style>

    
    table {
        width: 100%;
        border-collapse: collapse;
    }

    th, td {
        padding: 8px;
        border: 1px solid #ddd;
        text-align: left;
    }

    th {
        background-color: #f2f2f2;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    /* 체크박스 선택 시 배경색 변경 */
    tr.selected {
        background-color: #e0e0e0;
    }
    
    button {
        background-color: #4CAF50; /* Green */
        border: none;
        color: white;
        padding: 10px 24px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        cursor: pointer;
        border-radius: 12px;
    }

    button:hover {
        background-color: #45a049;
    }
</style>
    
    <h2>조직도</h2>
<button type="button" onclick="location.href='/org/orgFavor';">즐겨찾기 이동</button>
	<button type="button" onclick="location.href='/org/orgDept';">부서목록 보기</button>
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


<%@ include file="../include/footer.jsp" %>