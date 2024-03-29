<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<div class="content">
	<section class="content-header">
		<h1>
			출퇴근 조회 <small>사원들의 출퇴근 조회</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="/common/main"><i class="fa fa-dashboard"></i>메인</a></li>
			<li><a href="/attendance/list">근태관리</a></li>
			<li class="active">출퇴근 조회</li>
		</ol>
	</section>
	<br>
	<div class="box">
		<div class="box-header with-border">
			<form id="searchForm" name="searchForm" action="/attendance/list">
				<table>
					<tr>
						<td>
							<div class="input-group date">
								<input type="date" class="form-control pull-right" id="searchDate" name="searchDate">
							</div>
						</td>
						<td><select id="department" name="department" class="form-control select2 select2-hidden-accessible" style="width: 100%;" data-select2-id="1" tabindex="-1" aria-hidden="true">
								<option>부서</option>
								<c:forEach var="list" items="${depList}">
									<option value="${list.DEPTID }">${list.DEPTNM}</option>
								</c:forEach>
						</select></td>
						<td>
							<button onclick="search()" class="btn btn-block btn-default">조회</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div class="box-body">
			<form method="POST" name="attendanceList" id="attendanceList" action="">
				<input type="hidden" name="checkList" id="checkList"> <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<th><input type="checkbox" name="allCheck" id="allCheck" onclick="checkAll()"></th>
							<th>근무일자</th>
							<th>사원번호</th>
							<th>성명</th>
							<th>직책</th>
							<th>부서</th>
							<th>근무상태</th> <!-- 정상근무1, 외근2, 출장3, 연차4, 휴가5, 조퇴6, 결근7 -->
							<th>출근시각</th>
							<th>퇴근시각</th>
							<th>휴게시간</th>
							<th>근로시간</th>
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
					</tbody>
				</table>
				<table>
					<tr>
						<td><button class="btn btn-block btn-default" onclick="deleteChecked()">행삭제</button></td>
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
		var searchDate = document.getElementById("searchDate").value;
		var department = document.getElementById("department").value;

		var url = "/attendance/list?";
		var params = [];

		if (searchDate.trim() !== "") {
			params.push("searchDate=" + searchDate);
		}
		if (department.trim() !== "" && department.trim() !== "부서") {
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
	document.getElementById("searchForm").addEventListener("submit",
			function(event) {
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