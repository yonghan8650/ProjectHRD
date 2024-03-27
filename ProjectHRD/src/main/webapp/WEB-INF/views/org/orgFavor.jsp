<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>

<style>
    /* 테이블 스타일링 */
    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }

    th {
        background-color: #f2f2f2;
    }

    /* 이미지 스타일링 */
    img {
        max-width: 100px;
        height: auto;
    }

    /* 버튼 스타일링 */
    button {
        padding: 8px 12px;
        font-size: 14px;
        background-color: #f44336;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    button:hover {
        background-color: #d32f2f;
    }
</style>

<script>
    function removeFromFavorites(employee_id) {
        // AJAX 요청을 통해 해당 사원을 즐겨찾기에서 제거하는 서버 측 로직 호출
        // 여기서는 예시로 alert을 사용하여 제거되었음을 알림
        alert("사원이 즐겨찾기에서 제거되었습니다.");
        // 페이지 리로드
        location.reload();
    }
</script>

<h2>즐겨찾기 목록</h2>

<c:if test="${empty getFavoriteEmployees}">
    <p>즐겨찾기 목록이 비어 있습니다.</p>
</c:if>

<c:if test="${not empty getFavoriteEmployees}">
    <table>
        <thead>
            <tr>
                <th>사원 이름</th>
                <th>사진</th>
                <th>부서</th>
                <th>직책</th>
                <th>연락처</th>
                <th>이메일</th>
                <th>재직 상태</th>
                <th>즐겨찾기 해제</th> 
            </tr>
        </thead>
        <tbody>
            <c:forEach var="organizationChart" items="${getFavoriteEmployees}">
                <tr>
                    <td>${organizationChart.emp_name}</td>
                    <td><img src="${organizationChart.profil}" alt="프로필 사진"></td>
                    <td>${organizationChart.DEPTID}</td>
                    <td>${organizationChart.JOB_ID}</td>
                    <td>${organizationChart.emp_tel}</td>
                    <td>${organizationChart.emp_mail}</td>
                    <td>${organizationChart.STATUS}</td>
                    <td>
                        <form method="post" action="/org/removeFromFavorites">
                            <input type="hidden" name="employee_id" value="${organizationChart.employee_id}">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                            <button onclick="removeFromFavorites('${organizationChart.employee_id}')">즐겨찾기 해제</button>
                        </form>
                    </td> 
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>

<button type="button" onclick="location.href='/org/orgList';">조직도 목록</button>

<%@ include file="../include/footer.jsp" %>
