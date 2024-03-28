<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<div class="content">
	<section class="content-header">
		<h1>
			연차 생성 <small>사원들의 연차 생성</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="/common/main"><i class="fa fa-dashboard"></i>메인</a></li>
			<li><a href="/attendance/list">근태관리</a></li>
			<li class="active">연차생성</li>
		</ol>
	</section>
	<br>
	<div class="box">
		<div class="box-header with-border">
			<form id="searchForm" name="searchForm" action="">
				<table>
					<tr>
						<td><select id="department" name="department" class="form-control select2 select2-hidden-accessible" style="width: 100%;" data-select2-id="1" tabindex="-1" aria-hidden="true">
								<option>부서</option>
								<c:forEach var="list" items="${depList }">
									<option value="${list.DEPTID }">${list.DEPTNM }</option>
								</c:forEach>
						</select></td>
						<td><input type="number" id="keyword" name="keyword" class="form-control" maxlength="10" oninput="numberMaxLength(this);"></td>
						<td>
							<button onclick="search()" class="btn btn-block btn-default">조회</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div class="box-body">
			<form method="POST" id="annualList" name="annualList" action="">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }"> <input type="hidden" name="checkList" id="checkList">
				<c:choose>
					<c:when test="${empty annualList}">
						<table class="table table-bordered">
							<tr>
								<td>연차생성이 가능한 사원이 없습니다.</td>
							</tr>
						</table>
					</c:when>
					<c:otherwise>
						<table class="table table-bordered">
							<tbody>
								<tr>
									<th><input type="checkbox" name="allCheck" id="allCheck" onclick="checkAll()"></th>
									<th>사원번호</th>
									<th>사원명</th>
									<th>부서명</th>
									<th>입사일</th>
									<th>근속연수</th>
									<th>근속연차</th>
								</tr>
								<c:forEach var="list" items="${annualList}">
									<tr>
										<td><input type="checkbox" id="ap_check" name="ap_check" value="${list.employee_id}"></td>
										<td>${list.employee_id}</td>
										<td>${list.emp_name}</td>
										<td>${list.deptnm }</td>
										<td>${list.start_date}</td>
										<td>${list.years_of_service}</td>
										<td>${list.leave_days}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:otherwise>
				</c:choose>
				<table>
					<tr>
						<td><button onclick="createAnnualLeave()" class="btn btn-block btn-default">연차생성</button></td>
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
		var keyword = document.getElementById("keyword").value;
		var department = document.getElementById("department").value;

		var url = "/leaves/annualLeaveAdd?";
		var params = [];

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

	// 체크박스 전체 선택, 해제
	function checkAll() {
		if (annualList.allCheck.checked) {
			for (i = 1; i < (document.annualList.length); i++) {
				document.annualList.elements[i].checked = true;
			}
		} else {
			for (i = 1; i < (document.annualList.length); i++) {
				document.annualList.elements[i].checked = false;
			}
		}
	}

	// 연차생성
	function createAnnualLeave() { // 선택된 행 연차생성
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
		var confirmMsg = "연차를 생성하시겠습니까?";
		if (confirm(confirmMsg)) {
			document.getElementById("checkList").value = checkList.join(",");
			document.getElementById("annualList").action = "/leaves/addAnnualLeave";
			document.getElementById("annualList").submit();
		}

	}
</script>