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
	<form id="searchForm" name="searchForm" action="/attendance/list">
		<table>
			<tr>
				<td>근무일자 <input type="date" id="searchDate" name="searchDate" value="${formattedDate}">
				</td>
				<td><select id="department" name="department">
						<option>===</option>
						<c:forEach var="list" items="${depList}">
							<option value="${list.DEPTID }">${list.DEPTNM}</option>
						</c:forEach>
				</select></td>
				<td>
					<button onclick="search()">조회</button>
				</td>
			</tr>
		</table>
	</form>
	<form method="POST" name="attendanceList" id="attendanceList" action="">
		<input type="hidden" name="checkList" id="checkList">
		<table border="1">
			<tr>
				<td><input type="checkbox" name="allCheck" id="allCheck" onclick="checkAll()"></td>
				<td>근무일자</td>
				<td>사원번호</td>
				<td>성명</td>
				<td>직책</td>
				<td>부서</td>
				<td>근무상태</td>
				<!-- 정상근무, 외근, 출장, 원격, 연차, 휴가, 결근, 조퇴 -->
				<td>출근시각</td>
				<td>퇴근시각</td>
				<td>휴게시간</td>
				<td>근로시간</td>
			</tr>
			<c:forEach var="list" items="${attendanceList}">
				<tr>
					<td><input type="checkbox" id="ap_check" name="ap_check" value="${list.att_no}"></td>
					<td>${list.att_date}</td>
					<td>${list.employee_id}</td>
					<td>${list.emp_name}</td>
					<td>${list.job}</td>
					<td>${list.deptnm}</td>
					<td>${list.work_type}</td>
					<td>${list.start_time}</td>
					<td>${list.finish_time}</td>
					<td>${list.break_time}</td>
					<td>${list.work_time}</td>
				</tr>
			</c:forEach>
		</table>
		<table>
			<tr>
				<td><button type="button" onclick="deleteChecked()">행삭제</button></td>
			</tr>
		</table>
	</form>
</body>
<script>
	// 검색
	function search() {
		var searchDate = document.getElementById("searchDate").value;
		var department = document.getElementById("department").value;

		var url = "/attendance/list?";
		var params = [];

		if (searchDate.trim() !== "") {
			params.push("searchDate=" + searchDate);
		}
		if (department.trim() !== "" && department.trim() !== "===") {
			params.push("department=" + department);
		}

		// 파라미터가 있는 경우에만 URL에 추가
		if (params.length > 0) {
			url += params.join("&");
		}

		// 페이지 이동
		window.location.href = url;
	}

	// 폼 서브밋 이벤트 핸들러
	document.getElementById("searchForm").addEventListener("submit", function(event) {
		event.preventDefault(); // 기본 동작인 폼 서브밋 방지
		search(); // 검색 함수 호출
	});

	// 체크박스 전체 선택, 해제
	function checkAll() {
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

		//alert("checkList : " + checkList);

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