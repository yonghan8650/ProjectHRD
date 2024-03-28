<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>
<script type="text/javascript" src="/resources/js/registEmp.js"></script>

<div class="content">
	<div class="box" style="min-height: 600px;">
		<div class="box-header">
			<h3 class="box-title">신규 사원 등록</h3>
		</div>

		<form class="form-horizontal" action="" method="post" enctype="multipart/form-data">
			<sec:csrfInput />
			<div class="form-group">
				<div class="prifile">
					<label for="PROFIL" class="col-sm-2 control-label">프로필</label>
					<input type="file" id="profile" name="profile" onchange="previewImage(event)" accept="image/jpeg, image/png, image/gif" required />

					<img id="preview" src="#" alt="미리보기" style="display: none; max-width: 200px; max-height: 200px;" />

					<div id="result"></div>

					<p id="errorMessage" style="display: none; color: red;">이미지 파일을 선택하세요.</p>
				</div>
			</div>

			<div class="employee">
				<div class="form-group">
					<label for="emp_name" class="col-sm-2 control-label">사원명</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="emp_name" name="emp_name" style="max-width: 500px;" autofocus required>
					</div>
				</div>
				<div class="form-group">
					<label for="birth" class="col-sm-2 control-label">생년월일</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="birth" name="birth" pattern="\d{4}-\d{2}-\d{2}" style="max-width: 500px;" required placeholder="yyyy-MM-dd 형식으로 입력해주세요.">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">성별</label>
					<div class="col-sm-10">
						<input type="radio" name="gender" id="male" value="1" style="margin-left: 20px;" checked>
						<label for="male">남성</label>
						<input type="radio" name="gender" id="female" value="2" style="margin-left: 40px;">
						<label for="female">여성</label>
					</div>
				</div>
				<div class="form-group">
					<label for="emp_tel" class="col-sm-2 control-label">연락처</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="emp_tel" name="emp_tel" pattern="[0-9]{7,12}" style="max-width: 500px" placeholder="-를 뺴고 입력해주세요." required>
					</div>
				</div>
				<div class="form-group">
					<label for="emp_mail" class="col-sm-2 control-label">이메일</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="emp_mail" name="emp_mail" style="max-width: 500px" placeholder="이메일 형식으로 입력해주세요." required>
					</div>
				</div>
				<div class="form-group">
					<label for="start_date" class="col-sm-2 control-label">입사일</label>
					<div class="input-group date">
						<div class="col-sm-10">
							<input type="date" id="start_date" name="start_date" max="9999-12-31" required>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="emp_addr" class="col-sm-2 control-label">주소</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="emp_addr" name="emp_addr" style="max-width: 500px; background-color: #ffffff;" required>
					</div>
				</div>
				<div class="form-group">
					<label for="DEPTID" class="col-sm-2 control-label">부서</label>
					<div class="col-sm-10">
						<select id="DEPTID" name="DEPTID" class="form-control" style="width: 500px;">
							<option value="100">경영부</option>
							<option value="101">인사과</option>
							<option value="102">재무회계과</option>
							<option value="103">마케팅과</option>
							<option value="104">경영전략과</option>
							<option value="200">개발부</option>
							<option value="201">웹개발1과</option>
							<option value="202">웹개발2과</option>
							<option value="203">앱개발과</option>
							<option value="204">유지보수1과</option>
							<option value="205">유지보수2과</option>
							<option value="206">디자인과</option>
							<option value="300">서비스부</option>
							<option value="301">영업1과</option>
							<option value="302">영업2과</option>
							<option value="303">고객지원과</option>
							<option value="304">교육과</option>
							<option value="401">감사실</option>
							<option value="501">비서실</option>
							<option value="601">사장실</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="JOB_ID" class="col-sm-2 control-label">직책</label>
					<div class="col-sm-10">
						<select id="JOB_ID" name="JOB_ID" class="form-control" style="width: 500px;">
							<option value="901">사장</option>
							<option value="902">부장</option>
							<option value="903">차장</option>
							<option value="904">과장</option>
							<option value="905">대리</option>
							<option value="906">사원</option>
						</select>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="license">
					<label for="licenseTable" class="col-sm-2 control-label">자격정보</label>
					<table id="licenseTable" border="1" style="width: 520px;">
						<tr>
							<td style="width: 150px;">자격증명</td>
							<td style="width: 150px;">발급기관</td>
							<td style="width: 150px;">취득일자</td>
							<td style="width: 70px;">
								<input type="button" value="행 추가" onclick="addRow('licenseTable');">
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="form-group">
				<div class="appointment">
					<label for="appointmentTable" class="col-sm-2 control-label">발령정보</label>
					<table id="appointmentTable" border="1" style="width: 520px;">
						<tr>
							<td style="width: 150px;">발령구분</td>
							<td style="width: 150px;">발령내용</td>
							<td style="width: 150px;">발령일자</td>
							<td style="width: 70px;">
								<input type="button" value="행 추가" onclick="addRow('appointmentTable');">
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-danger" style="margin-bottom: 50px;">등록하기</button>
				</div>
			</div>
		</form>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>