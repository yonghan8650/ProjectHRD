<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>
${viewEmpVO }
<div class="content">

	<div class="row">
		<div class="col-md-3">

			<div class="box box-primary">
				<div class="box-body box-profile" style="min-height: 490px;">
					<img class="profile-user-img img-responsive img-circle" src="/emp/download?PROFIL=${viewEmpVO.PROFIL }" alt="User profile picture">
					<h3 class="profile-username text-center">${viewEmpVO.emp_name }</h3>
					<ul class="list-group list-group-unbordered">
						<li class="list-group-item"><b>입사일</b> <a class="pull-right">${viewEmpVO.start_date }</a></li>
						<li class="list-group-item"><b><c:if test="${viewEmpVO.STATUS eq 1 or viewEmpVO.STATUS eq 2 }">부서</c:if> <c:if test="${viewEmpVO.STATUS eq 3 }">퇴직일</c:if></b> <a class="pull-right">
								<c:if test="${viewEmpVO.STATUS eq 1 or viewEmpVO.STATUS eq 2 }">${viewEmpVO.DEPTNM }</c:if>
								<c:if test="${viewEmpVO.STATUS eq 3 }">${viewEmpVO.quit_date }</c:if>
							</a></li>
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

						<form class="form-horizontal" action="" method="post" enctype="multipart/form-data">
							<sec:csrfInput />
							<input type="hidden" name="PROFIL" value="${viewEmpVO.PROFIL }">
							<div class="form-group">
								<div class="profile">
									<label for="profile" class="col-sm-2 control-label">프로필</label>
									<input type="file" id="profile" name="profile" onchange="previewImage(event)" accept="image/jpeg, image/png, image/gif" style="margin-left: 30px;" />
									<img id="preview" src="#" alt="미리보기" style="display: none; max-width: 200px; max-height: 200px;" />
									<div id="result"></div>
									<p id="errorMessage" style="display: none; color: red;">이미지 파일을 선택하세요.</p>
								</div>
							</div>
							<div class="form-group">
								<label for="employee_id" class="col-sm-2 control-label">사원번호</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="employee_id" value="${viewEmpVO.employee_id }" style="max-width: 500px; background-color: #ffffff;" readonly>
								</div>
							</div>
							<div class="form-group">
								<label for="emp_name" class="col-sm-2 control-label">사원명</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="emp_name" name="emp_name" value="${viewEmpVO.emp_name }" style="max-width: 500px;" required>
								</div>
							</div>
							<div class="form-group">
								<label for="birth" class="col-sm-2 control-label">생년월일</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="birth" name="birth" value="${viewEmpVO.birth }" pattern="\d{4}-\d{2}-\d{2}" style="max-width: 500px;" required placeholder="yyyy-MM-dd 형식으로 입력해주세요.">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">성별</label>
								<div class="col-sm-10">
									<input type="radio" name="gender" id="male" value="1" style="margin-left: 20px;" <c:if test="${viewEmpVO.gender eq 1}">checked</c:if>>
									<label for="male">남성</label>
									<input type="radio" name="gender" id="female" value="2" style="margin-left: 40px;" <c:if test="${viewEmpVO.gender eq 2}">checked</c:if>>
									<label for="female">여성</label>
								</div>
							</div>
							<div class="form-group">
								<label for="emp_tel" class="col-sm-2 control-label">연락처</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="emp_tel" name="emp_tel" value="${viewEmpVO.emp_tel }" pattern="[0-9]{7,12}" style="max-width: 500px" placeholder="-를 뺴고 입력해주세요." required>
								</div>
							</div>
							<div class="form-group">
								<label for="emp_mail" class="col-sm-2 control-label">이메일</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="emp_mail" name="emp_mail" value="${viewEmpVO.emp_mail }" style="max-width: 500px" placeholder="이메일 형식으로 입력해주세요." required>
								</div>
							</div>
							<div class="form-group">
								<label for="emp_addr" class="col-sm-2 control-label">주소</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="emp_addr" name="emp_addr" value="${viewEmpVO.emp_addr }" style="max-width: 500px; background-color: #ffffff;" required>
								</div>
							</div>
							<div class="form-group">
								<label for="DEPTID" class="col-sm-2 control-label">부서</label>
								<div class="col-sm-10">
									<select id="DEPTID" name="DEPTID" class="form-control" style="width: 500px;">
										<option value="100" <c:if test="${viewEmpVO.DEPTNM eq '경영부' }">selected</c:if>>경영부</option>
										<option value="101" <c:if test="${viewEmpVO.DEPTNM eq '인사과' }">selected</c:if>>인사과</option>
										<option value="102" <c:if test="${viewEmpVO.DEPTNM eq '재무회계과' }">selected</c:if>>재무회계과</option>
										<option value="103" <c:if test="${viewEmpVO.DEPTNM eq '마케팅과' }">selected</c:if>>마케팅과</option>
										<option value="104" <c:if test="${viewEmpVO.DEPTNM eq '경영전략과' }">selected</c:if>>경영전략과</option>
										<option value="200" <c:if test="${viewEmpVO.DEPTNM eq '개발부' }">selected</c:if>>개발부</option>
										<option value="201" <c:if test="${viewEmpVO.DEPTNM eq '웹개발 1과' }">selected</c:if>>웹개발 1과</option>
										<option value="202" <c:if test="${viewEmpVO.DEPTNM eq '웹개발 2과' }">selected</c:if>>웹개발 2과</option>
										<option value="203" <c:if test="${viewEmpVO.DEPTNM eq '앱개발 1과' }">selected</c:if>>앱개발과</option>
										<option value="204" <c:if test="${viewEmpVO.DEPTNM eq '유지보수 1과' }">selected</c:if>>유지보수 1과</option>
										<option value="205" <c:if test="${viewEmpVO.DEPTNM eq '유지보수 2과' }">selected</c:if>>유지보수 2과</option>
										<option value="206" <c:if test="${viewEmpVO.DEPTNM eq '디자인과' }">selected</c:if>>디자인과</option>
										<option value="300" <c:if test="${viewEmpVO.DEPTNM eq '서비스부' }">selected</c:if>>서비스부</option>
										<option value="301" <c:if test="${viewEmpVO.DEPTNM eq '영업 1과' }">selected</c:if>>영업 1과</option>
										<option value="302" <c:if test="${viewEmpVO.DEPTNM eq '영업 2과' }">selected</c:if>>영업 2과</option>
										<option value="303" <c:if test="${viewEmpVO.DEPTNM eq '고객지원과' }">selected</c:if>>고객지원과</option>
										<option value="304" <c:if test="${viewEmpVO.DEPTNM eq '교육과' }">selected</c:if>>교육과</option>
										<option value="401" <c:if test="${viewEmpVO.DEPTNM eq '감사실' }">selected</c:if>>감사실</option>
										<option value="501" <c:if test="${viewEmpVO.DEPTNM eq '비서실' }">selected</c:if>>비서실</option>
										<option value="601" <c:if test="${viewEmpVO.DEPTNM eq '사장실' }">selected</c:if>>사장실</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="JOB_ID" class="col-sm-2 control-label">직책</label>
								<div class="col-sm-10">
									<select id="JOB_ID" name="JOB_ID" class="form-control" style="width: 500px;">
										<option value="901" <c:if test="${viewEmpVO.JOB eq '사장' }">selected</c:if>>사장</option>
										<option value="902" <c:if test="${viewEmpVO.JOB eq '부장' }">selected</c:if>>부장</option>
										<option value="903" <c:if test="${viewEmpVO.JOB eq '차장' }">selected</c:if>>차장</option>
										<option value="904" <c:if test="${viewEmpVO.JOB eq '과장' }">selected</c:if>>과장</option>
										<option value="905" <c:if test="${viewEmpVO.JOB eq '대리' }">selected</c:if>>대리</option>
										<option value="906" <c:if test="${viewEmpVO.JOB eq '사원' }">selected</c:if>>사원</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="STATUS" class="col-sm-2 control-label">재직상태</label>
								<div class="col-sm-10">
									<select id="STATUS" name="STATUS" class="form-control" style="width: 500px;">
										<option value="1" <c:if test="${viewEmpVO.STATUS eq 1 }">selected</c:if>>재직</option>
										<option value="2" <c:if test="${viewEmpVO.STATUS eq 2 }">selected</c:if>>휴직</option>
										<option value="3" <c:if test="${viewEmpVO.STATUS eq 3 }">selected</c:if>>퇴직</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">사원번호는 변경 불가합니다. 이미지는 변경 시에만 업로드해주세요.</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-danger">수정하기</button>
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
										<th style="width: 230px;">자격증명</th>
										<th style="width: 230px;">발급기관</th>
										<th>취득일자</th>
										<th style="width: 80px;">변경</th>
									</tr>
									<c:forEach var="list" items="${viewEmpLicenseVO }" varStatus="stat">
										<tr>
											<td>${stat.count }</td>
											<td>${list.license }</td>
											<td>${list.li_org }</td>
											<td>${list.li_date }</td>
											<td>
												<form action="/emp/deleteLicense" method="post">
													<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
													<input type="hidden" name="employee_id" value="${viewEmpVO.employee_id }">
													<input type="hidden" name="license" value="${list.license }">
													<input type="submit" value="삭제하기">
												</form>
											</td>
										</tr>
									</c:forEach>
									<tr>
										<form action="/emp/insertLicense" method="post">
											<td>+</td>
											<td>
												<input type="text" name="license" required>
											</td>
											<td>
												<input type="text" name="li_org" required>
											</td>
											<td>
												<input type="date" name="li_date" required max="9999-12-31">
											</td>
											<td>
												<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
												<input type="hidden" name="employee_id" value="${viewEmpVO.employee_id }">
												<input type="submit" value="추가하기">
											</td>
										</form>
									</tr>
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
										<th style="width: 230px">발령구분</th>
										<th style="width: 230px">발령내용</th>
										<th>발령일자</th>
										<th style="width: 80px;">변경</th>
									</tr>
									<c:forEach var="list" items="${viewEmpAppointmentVO }" varStatus="stat">
										<tr>
											<td>${stat.count }</td>
											<td>${list.app_issue }</td>
											<td>${list.app_content }</td>
											<td>${list.app_date }</td>
											<td>
												<form action="/emp/deleteAppointment" method="post">
													<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
													<input type="hidden" name="employee_id" value="${viewEmpVO.employee_id }">
													<input type="hidden" name="app_issue" value="${list.app_issue }">
													<input type="hidden" name="app_date" value="${list.app_date }">
													<input type="submit" value="삭제하기">
												</form>
											</td>
										</tr>
									</c:forEach>
									<tr>
										<form action="/emp/insertAppointment" method="post">
											<td>+</td>
											<td>
												<select name="app_issue" required>
													<option value="입사">입사</option>
													<option value="휴직">휴직</option>
													<option value="복직">복직</option>
													<option value="퇴직">퇴직</option>
													<option value="승진">승진</option>
													<option value="이동">이동</option>
												</select>
											</td>
											<td><input type="text" name="app_content"></td>
											<td><input type="date" name="app_date" required max="9999-12-31"></td>
											<td>
												<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
												<input type="hidden" name="employee_id" value="${viewEmpVO.employee_id }">
												<input type="submit" value="추가하기">
											</td>
										</form>
									</tr>
								</tbody>
							</table>
						</div>

					</div>

				</div>

			</div>

		</div>

	</div>
	<script type="text/javascript">
		function previewImage(event) {
			const input = event.target;
			const profile = input.files[0];

			if (profile) {
				if (profile.type.startsWith('image/')) {
					const preview = document.getElementById('preview');

					preview.style.display = 'block';

					const reader = new FileReader();

					reader.onload = function() {
						preview.src = reader.result;
					};

					reader.readAsDataURL(profile);

					document.getElementById('errorMessage').style.display = 'none';
				} else {
					document.getElementById('errorMessage').style.display = 'block';
					input.value = '';
					resetPreview();
				}
			} else {
				resetPreview();
			}
		}

		function resetPreview() {
			const preview = document.getElementById('preview');
			preview.style.display = 'none';
			preview.src = '';
		}
	</script>
</div>

<%@ include file="../include/footer.jsp"%>