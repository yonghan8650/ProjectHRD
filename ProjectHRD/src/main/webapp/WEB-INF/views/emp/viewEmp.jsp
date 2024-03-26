<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>

<div class="content">

	<div class="row">
		<div class="col-md-3">

			<div class="box box-primary">
				<div class="box-body box-profile" style="min-height: 490px;">
					<img class="profile-user-img img-responsive img-circle" src="/emp/download?PROFIL=${viewEmpVO.PROFIL }" alt="User profile picture">
					<h3 class="profile-username text-center">${viewEmpVO.emp_name }</h3>
					<ul class="list-group list-group-unbordered">
						<li class="list-group-item"><b>입사일</b> <a class="pull-right">${viewEmpVO.start_date }</a></li>
						<li class="list-group-item">
							<b><c:if test="${viewEmpVO.STATUS eq 1 or viewEmpVO.STATUS eq 2 }">부서</c:if><c:if test="${viewEmpVO.STATUS eq 3 }">퇴직일</c:if></b>
							<a class="pull-right"><c:if test="${viewEmpVO.STATUS eq 1 or viewEmpVO.STATUS eq 2 }">${viewEmpVO.DEPTNM }</c:if><c:if test="${viewEmpVO.STATUS eq 3 }">${viewEmpVO.quit_date }</c:if></a>
						</li>
						<li class="list-group-item"><b>직책</b> <a class="pull-right">${viewEmpVO.JOB }</a></li>
					</ul>
				</div>

			</div>

		</div>

		<div class="col-md-9">
			<div class="nav-tabs-custom">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#activity" data-toggle="tab">사원정보</a></li>
					<li><a href="#timeline" data-toggle="tab">자격정보</a></li>
					<li><a href="#settings" data-toggle="tab">발령정보</a></li>
				</ul>
				<div class="tab-content" style="min-height: 450px;">
					<div class="active tab-pane" id="activity">

						<form class="form-horizontal">
							<div class="form-group">
								<label for="employee_id" class="col-sm-2 control-label">사원번호</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="employee_id" value="${viewEmpVO.employee_id }" style="max-width: 500px; background-color: #ffffff;" readonly>
								</div>
							</div>
							<div class="form-group">
								<label for="birth" class="col-sm-2 control-label">생년월일</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="birth" value="${viewEmpVO.birth }" style="max-width: 500px; background-color: #ffffff;" readonly>
								</div>
							</div>
							<div class="form-group">
								<label for="gender" class="col-sm-2 control-label">성별</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="gender" value="<c:choose><c:when test="${viewEmpVO.gender eq 1}">남성</c:when><c:when test="${viewEmpVO.gender eq 2}">여성</c:when></c:choose>" style="max-width: 500px; background-color: #ffffff;" readonly>
								</div>
							</div>
						</form>
						<form class="form-horizontal" id="updateEmp" action="" method="post">
							<div class="form-group">
								<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
								<label for="emp_tel" class="col-sm-2 control-label">연락처</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="emp_tel" name="emp_tel" value="${viewEmpVO.emp_tel }" style="max-width: 500px">
								</div>
							</div>
							<div class="form-group">
								<label for="emp_mail" class="col-sm-2 control-label">이메일</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="emp_mail" name="emp_mail" value="${viewEmpVO.emp_mail }" style="max-width: 500px">
								</div>
							</div>
						</form>
						<form class="form-horizontal">
							<div class="form-group">
								<label for="emp_addr" class="col-sm-2 control-label">주소</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="emp_addr" value="${viewEmpVO.emp_addr }" style="max-width: 500px; background-color: #ffffff;" readonly>
								</div>
							</div>
							<div class="form-group">
								<label for="STATUS" class="col-sm-2 control-label">재직상태</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="STATUS" value="<c:choose><c:when test="${viewEmpVO.STATUS eq 1}">재직</c:when><c:when test="${viewEmpVO.STATUS eq 2}">휴직</c:when><c:when test="${viewEmpVO.STATUS eq 3}">퇴직: ${viewEmpVO.quit_date }</c:when></c:choose>" style="max-width: 500px; background-color: #ffffff;" readonly>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">연락처와 이메일만 변경 가능합니다.</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" form="updateEmp" class="btn btn-danger">Submit</button>
								</div>
							</div>
						</form>

					</div>

					<div class="tab-pane" id="timeline">

						<div class="box-body no-padding">
							<table class="table table-striped" style="width: 810px;">
								<tbody>
									<tr>
										<th style="width: 10px;">#</th>
										<th style="width: 270px;">자격증명</th>
										<th style="width: 270px;">발급기관</th>
										<th>취득일자</th>
									</tr>
									<c:forEach var="list" items="${viewEmpLicenseVO }" varStatus="stat">
										<tr>
											<td>${stat.count }</td>
											<td>${list.license }</td>
											<td>${list.li_org }</td>
											<td>${list.li_date }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

					</div>

					<div class="tab-pane" id="settings">

						<div class="box-body no-padding">
							<table class="table table-striped" style="width: 810px;">
								<tbody>
									<tr>
										<th style="width: 10px">#</th>
										<th style="width: 270px">발령구분</th>
										<th style="width: 270px">발령내용</th>
										<th>발령일자</th>
									</tr>
									<c:forEach var="list" items="${viewEmpAppointmentVO }" varStatus="stat">
										<tr>
											<td>${stat.count }</td>
											<td>${list.app_issue }</td>
											<td>${list.app_content }</td>
											<td>${list.app_date }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

					</div>

				</div>

			</div>

		</div>

	</div>

</div>
<%@ include file="../include/footer.jsp"%>