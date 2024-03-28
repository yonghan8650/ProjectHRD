<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<!-- https://adminlte.io/themes/AdminLTE/index2.html -->

<div class="content">
	<section class="content-header">
		<h1>
			연차 조회 <small>사원들의 보유 연차 조회</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="/common/main"><i class="fa fa-dashboard"></i>메인</a></li>
			<li><a href="/attendance/list">근태관리</a></li>
			<li class="active">연차조회</li>
		</ol>
	</section>
	<br>
	<div class="box">
		<div class="box-header with-border">
			<form id="searchForm" name="searchForm" action="">
				<table>
					<tr>
						<td><select id="baseYear" name="baseYear"
							class="form-control select2 select2-hidden-accessible"
							style="width: 100%;" data-select2-id="1" tabindex="-1"
							aria-hidden="true">
								<option>기준년도</option>
								<jsp:useBean id="now" class="java.util.Date" />
								<fmt:formatDate value="${now}" pattern="yyyy" var="startYear" />
								<c:forEach begin="0" end="${startYear - 2000}" var="year"
									step="1">
									<option value="${startYear-year}">${startYear-year}</option>
								</c:forEach>
						</select></td>
						<td><select id="department" name="department"
							class="form-control select2 select2-hidden-accessible"
							style="width: 100%;" data-select2-id="1" tabindex="-1"
							aria-hidden="true">
								<option>부서</option>
								<c:forEach var="list" items="${depList }">
									<option value="${list.DEPTID }">${list.DEPTNM }</option>
								</c:forEach>
						</select></td>

						<td><input type="number" class="form-control" id="keyword"
							name="keyword" maxlength="10" oninput="numberMaxLength(this);"
							placeholder="사원번호"></td>
						<td>
							<button onclick="search()" class="btn btn-block btn-default">조회</button>
						</td>
					</tr>
				</table>
			</form>
		</div>

		<div class="box-body">
			<form method="POST" name="annualLeaveList" id="annualLeaveList"
				action="">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token }"> <input type="hidden"
					name="checkList" id="checkList">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<th><input type="checkbox" name="allCheck" id="allCheck"
								onclick="checkAll()"></th>
							<th>사원번호</th>
							<th>성명</th>
							<th>부서</th>
							<th>입사일</th>
							<th>근속연수</th>
							<th>연차사용기간</th>
							<!-- <td>1년미만 월별발생분</td> -->
							<th>근속연차</th>
							<th>연차생성일</th>
						</tr>
						<c:forEach var="list" items="${annualLeaveList }">
							<tr>
								<td><input type="checkbox" id="ap_check" name="ap_check"
									value="${list.leave_no}"></td>
								<td>${list.employee_id }</td>
								<td>${list.emp_name }</td>
								<td>${list.deptnm }</td>
								<td>${list.start_date }</td>
								<td>${list.years_of_service }</td>
								<td>${list.beginDate }~${list.finishDate }</td>
								<!-- <td>1년미만 월별발생분</td> -->
								<td>${list.leave_days }</td>
								<td>${list.creation_date }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<table>
					<tr>
						<td><button onclick="deleteChecked()"  class="btn btn-block btn-default">연차삭제</button></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>

<script>
	// 사원번호 자릿수 제한 (10자리 초과X)
	function numberMaxLength(e) {
		if (e.value.length > e.maxLength) {
			e.value = e.value.slice(0, e.maxLength);
		}
	}

	// 검색
	function search() {
		var baseYear = document.getElementById("baseYear").value;
		var department = document.getElementById("department").value;
		var keyword = document.getElementById("keyword").value;

		var url = "/leaves/annualLeave?";
		var params = [];

		if (baseYear.trim() !== "" && baseYear.trim() !== "기준년도") {
			params.push("baseYear=" + baseYear);
		}
		if (department.trim() !== "" && department.trim() !== "부서") {
			params.push("department=" + department);
		}
		if (keyword.trim() !== "") {
			params.push("keyword=" + keyword);
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

	//체크박스 전체 선택, 해제
	function checkAll() {
		if (annualLeaveList.allCheck.checked) {
			for (i = 1; i < (document.annualLeaveList.length); i++) {
				document.annualLeaveList.elements[i].checked = true;
			}
		} else {
			for (i = 1; i < (document.annualLeaveList.length); i++) {
				document.annualLeaveList.elements[i].checked = false;
			}
		}
	}

	// 연차삭제
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
			document.getElementById("annualLeaveList").action = "/leaves/batchDelete";
			document.getElementById("annualLeaveList").submit();
		}

	}
</script>