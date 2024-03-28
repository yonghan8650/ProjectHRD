<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<style>
.form-control.pull-right {
	margin-top: 5px; /* 입력 요소의 위쪽 여백을 조절하여 요소를 아래로 내립니다. */
}
</style>
<div class="content">

	<section class="content-header">
		<h1>
			휴가 신청 내역 <small>사원들의 휴가 신청 내역</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="/common/main"><i class="fa fa-dashboard"></i>메인</a></li>
			<li><a href="/attendance/list">근태관리</a></li>
			<li class="active">휴가 신청 내역</li>
		</ol>
	</section>
	<br>
	<div class="box">
		<div class="box-header with-border">
			<form id="searchFrom" name="searchFrom" action="/leaves/requests">
				<table>
					<tr>
						<td>
							<div class="input-group date" style="display: inline-block;">
								<input type="date" class="form-control pull-right"
									id="startDate" name="startDate">
							</div> <span class="aaa"></span>
							<div class="input-group date" style="display: inline-block;">
								<input type="date" class="form-control pull-right" id="endDate"
									name="endDate">
							</div>
						</td>
						<td><select id="department" name="department"
							class="form-control select2 select2-hidden-accessible"
							style="width: 100%;" data-select2-id="1" tabindex="-1"
							aria-hidden="true">
								<option>부서</option>
								<c:forEach var="list" items="${depList}">
									<option value="${list.DEPTID }">${list.DEPTNM}</option>
								</c:forEach>
						</select></td>
						<td><select id="approval" name="approval"
							class="form-control select2 select2-hidden-accessible"
							style="width: 100%;" data-select2-id="1" tabindex="-1"
							aria-hidden="true">
								<option>승인여부</option>
								<option value="Y">승인</option>
								<option value="N">반려</option>
						</select></td>
						<td><select id="leaveType" name="leaveType"
							class="form-control select2 select2-hidden-accessible"
							style="width: 100%;" data-select2-id="1" tabindex="-1"
							aria-hidden="true">
								<option>휴가유형</option>
								<option value="1">연차</option>
								<option value="2">병가</option>
								<option value="3">경조</option>
								<option value="4">결혼</option>
								<option value="5">긴급</option>
						</select></td>
						<td>
							<button onclick="search()" class="btn btn-block btn-default">조회</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div class="box-body">
			<form method="POST" name="leaveReqList" id="leaveReqList" action="">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token }"> <input type="hidden"
					name="checkList" id="checkList">
				<c:choose>
					<c:when test="${empty leaveReqList}">
						<table class="table table-bordered">
							<tr>
								<td>처리 가능한 휴가신청이 없습니다.</td>
							</tr>
						</table>
					</c:when>
					<c:otherwise>
						<table class="table table-bordered">
							<tbody>
								<tr>
									<th><input type="checkbox" name="allCheck" id="allCheck"
										onclick="checkAll()"></th>
									<th>번호</th>
									<th>신청일</th>
									<th>휴가유형</th>
									<th>성명</th>
									<th>부서</th>
									<th>휴가 시작일</th>
									<th>휴가 종료일</th>
									<th>휴가 사유</th>
									<th>승인여부</th>
								</tr>
								<c:forEach var="list" items="${leaveReqList }">
									<tr>
										<td><input type="checkbox" id="ap_check" name="ap_check"
											value="${list.req_leave_no}"></td>
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
													<button type="button"
														onclick="location.href='/leaves/approval?req_leave_no=${list.req_leave_no }'">승인</button>
													<button type="button"
														onclick="location.href='/leaves/rejection?req_leave_no=${list.req_leave_no }'">반려</button>
												</c:otherwise>
											</c:choose></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:otherwise>
				</c:choose>
				<table>
					<tr>
						<td colspan="10">

							<button class="btn btn-default" onclick="leaveApproval()">승인</button>
							<button class="btn btn-default" onclick="leaveRejection()"
								style="display: inline-block;">반려</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>
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
		if (department.trim() !== "" && department.trim() !== "부서") {
			params.push("department=" + department);
		}
		if (approval.trim() !== "" && approval.trim() !== "승인여부") {
			params.push("approval=" + approval);
		}
		if (leaveType.trim() !== "" && leaveType.trim() !== "휴가유형") {
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