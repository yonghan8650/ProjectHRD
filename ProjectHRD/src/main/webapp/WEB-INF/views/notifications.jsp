<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notifications</title>
<style>
div {
border: solid;

}

td{
padding : 20px;
}
</style>
</head>
<body>
	<h3>Notifications</h3>
	<div class="box-body">
		<table class="table table-bordered">
			<tbody>
				<c:forEach var="nVO" items="${notiList }">
					<tr>
						<td>${nVO.employee_id }</td>
						<td>${nVO.noti_title }</td>
						<td>${nVO.noti_time }</td>
						<td>${nVO.noti_link }</td>
						<td><input type="button"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
