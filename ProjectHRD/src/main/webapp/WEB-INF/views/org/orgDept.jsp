<%@page import="com.bswill.domain.OrganizationChartVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

    /* 버튼 스타일링 */
    .button-container {
        text-align: center;
        margin-top: 20px;
    }

    .button-container button {
        padding: 10px 20px;
        font-size: 16px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .button-container button:hover {
        background-color: #45a049;
    }
</style>
    <h1>부서 목록</h1>
    <table border="1">
        <thead>
            <tr>
                <th>부서</th>
                <th>부서 이름</th>
                
            </tr>
        </thead>
        <tbody>
            <% 
            List<OrganizationChartVO> departmentList = (List<OrganizationChartVO>) request.getAttribute("departmentList");
            if (departmentList != null) {
                for (OrganizationChartVO department : departmentList) {
            %>
            <tr>
                <td><a href="/org/employeesByDept?deptId=<%= department.getDEPTID() %>"><%= department.getDEPTID() %></a></td>
                <td><%= department.getDEPT_NAME() %></td>
                
            </tr>
            <% 
                }
            }
            %>
        </tbody>
    </table>
   <div class="button-container">
    <button type="button" onclick="location.href='/org/orgList';">조직도 목록</button>
   </div>


<%@ include file="../include/footer.jsp" %>