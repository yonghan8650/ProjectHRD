<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>/attendance/list.jsp</h3>
	<form method="POST" name="attendanceList" id="attendanceList" action="">
		<input type="hidden" name="checkList" id="checkList">
		<table>
			<tr>
				<td><button type="button" onclick="deleteChecked()">행삭제</button></td>
			</tr>
		</table>
		<table border="1">
			<tr>
				<td><input type="checkbox" name="allCheck" id="allCheck" onclick="checkAll()"></td>
				<td>근무일자</td>
				<td>사원번호</td>
				<td>성명</td>
				<td>직책</td>
				<td>부서</td>
				<td>근무상태</td><!-- 정상근무, 외근, 출장, 원격, 연차, 휴가, 결근, 조퇴 -->
				<td>출근시각</td>
				<td>퇴근시각</td>
				<td>휴게시간</td>
				<td>근로시간</td>
			</tr>
			<c:forEach var="list" items="${attendanceList}" varStatus="loop">
				<!-- input으로 수정하기 -->
				<tr>
					<td><input type="checkbox" id="ap_check" name="ap_check" value="${list.att_no}"></td>
					<td>${list.att_date }</td>
					<td>${list.employee_id }</td>
					<td>${list.emp_name }</td>
					<td>${list.job }</td>
					<td>${list.deptnm }</td>
					<td>${list.work_type }</td>
					<td>${list.start_time }</td>
					<td>${list.finish_time }</td>
					<td></span></td>
					<td></span></td>
				</tr>
			</c:forEach>
		</table>
		<table>
			<tr>
				<td><button type="button">저장</button></td>
			</tr>
		</table>
	</form>
</body>
<script>
	function checkAll() { // 체크박스 전체 선택, 해제
		if (attendanceList.allCheck.checked) {
			for (i = 1; i < (document.attendanceList.length); i++) {
				document.attendanceList.elements[i].checked = true;
			}
		} else {
			for (i = 1; i < (document.attendanceList.length); i++) {
				document.attendanceList.elements[i].checked = false;
			}
		}
	}

	// 행삭제
	function deleteChecked() { // 선택된 행 삭제
		var checkboxes = document.getElementsByName("ap_check");
		var checkList = []; // 체크박스 전체 수

		for (var i = 0; i < checkboxes.length; i++) {
			if (checkboxes[i].checked) {
				checkList.push(checkboxes[i].value);
			}
		}

		alert("checkList : " + checkList);

		if (checkboxes.length === 0) { // 선택된 행이 없을 때
			alert("선택된 행이 없습니다.");
			return;
		}

		// 확인 창 
		var confirmMsg = "삭제하시겠습니까?";
		if (confirm(confirmMsg)) {
			document.getElementById("checkList").value = checkList.join(",");
			document.getElementById("attendanceList").action = "/attendance/delete";
			document.getElementById("attendanceList").submit();
		}

	}
</script>

</html>