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
	<h3>/leaves/requests.jsp</h3>
	<form id="searchFrom" name="searchFrom" action="/leaves/requests">
		<table>
			<tr>
				<td>기간<input type="date" id="startDate" name="startDate">~<input type="date" id="endDate" name="endDate"></td>
				<td>부서<select id="department" name="department">
						<option>===</option>
						<c:forEach var="list" items="${depList}">
							<option value="${list.DEPTID }">${list.DEPTNM}</option>
						</c:forEach>
				</select>
				</td>
				<td>승인여부<select id="approval" name="approval">
						<option>===</option>
						<option value="Y">승인</option>
						<option value="N">반려</option>
				</select>
				</td>
				<td>휴가항목<select id="leaveType" name="leaveType">
						<option>===</option>
						<option value="1">연차</option>
						<option value="2">병가</option>
						<option value="3">경조</option>
						<option value="4">결혼</option>
						<option value="5">긴급</option>
				</select>
				</td>
				<td>
					<button onclick="search()">조회</button>
				</td>
			</tr>
		</table>
	</form>
	<form method="POST" name="leaveReqList" id="leaveReqList" action="">
		<input type="hidden" name="checkList" id="checkList">
		<table border="1">
			<tr>
				<td><input type="checkbox" name="allCheck" id="allCheck" onclick="checkAll()"></td>
				<td>번호</td>
				<td>신청일</td>
				<td>휴가구분</td>
				<td>성명</td>
				<td>부서</td>
				<td>휴가 시작일</td>
				<td>휴가 종료일</td>
				<td>휴가 사유</td>
				<td>승인여부</td>
			</tr>
			<c:forEach var="list" items="${leaveReqList }">
				<tr>
					<td><input type="checkbox" id="ap_check" name="ap_check" value="${list.req_leave_no}"></td>
					<td>${list.req_leave_no }</td>
					<td>${list.req_leave_date }</td>
					<td>${list.leave_type }</td>
					<td>${list.emp_name }</td>
					<td>${list.deptnm }</td>
					<td>${list.start_date }</td>
					<td>${list.end_date }</td>
					<td>${list.reason }</td>
					<td><c:choose>
							<c:when test="${list.approval == 'Y' }">
						승인
						</c:when>
							<c:when test="${list.approval == 'N' }">
						반려
						</c:when>
							<c:otherwise>
								<button type="button" onclick="location.href='/leaves/approval?req_leave_no=${list.req_leave_no }'">승인</button>
								<button type="button" onclick="location.href='/leaves/rejection?req_leave_no=${list.req_leave_no }'">반려</button>
							</c:otherwise>
						</c:choose></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="10"><button type="button" onclick="leaveApproval()">승인</button>
					<button type="button" onclick="leaveRejection()">반려</button></td>
			</tr>
		</table>
	</form>
</body>
<script>
	// 검색 
	function search() {
		var startDate = document.getElementById("startDate").value;
		var endDate = document.getElementById("endDate").value;
		var department = document.getElementById("department").value;
		var approval = document.getElementById("approval").value;
		var leaveType = document.getElementById("leaveType").value;
		

		var url = "/leaves/requests?";
		var params = [];

		if (startDate.trim() !== "") {
			params.push("startDate=" + startDate);
		}
		if (endDate.trim() !== "") {
			params.push("endDate=" + endDate);
		}
		if (department.trim() !== "" && department.trim() !== "===") {
			params.push("department=" + department);
		}
		if (approval.trim() !== "" && approval.trim() !== "===") {
			params.push("approval=" + approval);
		}
		if (leaveType.trim() !== "" && leaveType.trim() !== "===") {
			params.push("leaveType=" + leaveType);
		}
		

		// 파라미터가 있는 경우에만 URL에 추가
		if (params.length > 0) {
			url += params.join("&");
		}

		// 페이지 이동
		window.location.href = url;
	}

	// 폼 서브밋 이벤트 핸들러
	document.getElementById("searchFrom").addEventListener("submit",
			function(event) {
				event.preventDefault(); // 기본 동작인 폼 서브밋 방지
				search(); // 검색 함수 호출
			});

	//체크박스 전체 선택, 해제
	function checkAll() {
		if (leaveReqList.allCheck.checked) {
			for (i = 1; i < (document.leaveReqList.length); i++) {
				document.leaveReqList.elements[i].checked = true;
			}
		} else {
			for (i = 1; i < (document.leaveReqList.length); i++) {
				document.leaveReqList.elements[i].checked = false;
			}
		}
	}

	// 휴가 일괄 승인
	function leaveApproval() {
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
		var confirmMsg = "승인하시겠습니까?";
		if (confirm(confirmMsg)) {
			document.getElementById("checkList").value = checkList.join(",");
			document.getElementById("leaveReqList").action = "/leaves/batchApproval";
			document.getElementById("leaveReqList").submit();
		}

	}

	// 휴가 일괄 반려
	function leaveRejection() {
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
		var confirmMsg = "반려하시겠습니까?";
		if (confirm(confirmMsg)) {
			document.getElementById("checkList").value = checkList.join(",");
			document.getElementById("leaveReqList").action = "/leaves/batchRejection";
			document.getElementById("leaveReqList").submit();
		}

	}
</script>
</html>