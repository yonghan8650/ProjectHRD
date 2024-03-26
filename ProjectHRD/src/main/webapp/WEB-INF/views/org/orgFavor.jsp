<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>즐겨찾기 목록</title>
    <script>
        function removeFromFavorites(employee_id) {
            // AJAX 요청을 통해 해당 사원을 즐겨찾기에서 제거하는 서버 측 로직 호출
            // 여기서는 예시로 alert을 사용하여 제거되었음을 알림
            alert("사원이 즐겨찾기에서 제거되었습니다.");
            // 페이지 리로드
            location.reload();
        }
    </script>
</head>
<body>
    <h2>즐겨찾기 목록</h2>

    <%-- 즐겨찾기 목록이 비어 있는 경우 메시지 표시 --%>
    <c:if test="${empty getFavoriteEmployees}">
        <p>즐겨찾기 목록이 비어 있습니다.</p>
    </c:if>

    <%-- 즐겨찾기 목록이 비어 있지 않은 경우 테이블 표시 --%>
    <c:if test="${not empty getFavoriteEmployees}">
        <table border="1">
            <tr>
                <td>사원 이름</td>
                <td>사진</td>
                <td>부서</td>
                <td>직책</td>
                <td>연락처</td>
                <td>이메일</td>
                <td>재직 상태</td>
                <td>즐겨찾기 해제</td> 
            </tr>

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
        </table>
    </c:if>
    <button type="button" onclick="location.href='/org/orgList';">조직도 목록</button>
</body>
</html>
