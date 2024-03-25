<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>
<script type="text/javascript" src="/resources/js/registEmp.js"></script>

<div class="content">
	<div class="box" style="min-height: 600px;">
		<div class="box-header">
			<h3 class="box-title">신규 사원 등록${employee_id }</h3>
		</div>
		<form action="" method="post" enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
			<div class="profile">
				<label for="PROFIL">프로필</label>
				<input type="file" id="profile" name="profile" onchange="previewImage(event)" accept="image/jpeg, image/png, image/gif" required />

				<img id="preview" src="#" alt="미리보기" style="display: none; max-width: 200px; max-height: 200px;" />

				<div id="result"></div>

				<p id="errorMessage" style="display: none; color: red;">이미지 파일을 선택하세요.</p>
			</div>

			<div class="employee">
				<label>사원정보</label>
				<table>
					<tr>
						<td><label for="emp_name">성명</label></td>
						<td><input type="text" id="emp_name" name="emp_name" required autofocus></td>
						<td><label for="birth">생년월일</label></td>
						<td><input type="date" id="birth" name="birth" max="9999-12-31" required></td>
						<td>성별</td>
						<td>
							<input type="radio" id="male" name="gender" value="1" checked>
							<label for="male">남</label>
							<input type="radio" id="female" name="gender" value="2">
							<label for="female">여</label>
						</td>
					</tr>
					<tr>
						<td><label for="emp_tel">연락처</label></td>
						<td><input type="tel" id="emp_tel" name="emp_tel" required></td>
						<td><label for="emp_mail">이메일</label></td>
						<td><input type="email" id="emp_mail" name="emp_mail" required></td>
						<td><label for="start_date">입사일</label></td>
						<td><input type="date" id="start_date" name="start_date" max="9999-12-31" required></td>
					</tr>
					<tr>
						<td>직급</td>
						<td>
							<select id="JOB_ID" name="JOB_ID">
								<option value="901">사장</option>
								<option value="902">부장</option>
								<option value="903">차장</option>
								<option value="904">과장</option>
								<option value="905">대리</option>
								<option value="906">사원</option>
							</select>
						</td>
						<td>부서</td>
						<td>
							<select id="DEPTID" name=DEPTID>
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
						</td>
					</tr>
					<tr>
						<td><label for="emp_addr">주소</label></td>
						<td colspan="5"><input type="text" id="emp_addr" name="emp_addr" required></td>
					</tr>
				</table>
			</div>

			<div class="license">
				<label>자격정보</label>
				<table id="licenseTable">
					<tr>
						<td>자격증명</td>
						<td>발급기관</td>
						<td>취득일자</td>
						<td><input type="button" value="행 추가" onclick="addRow('licenseTable');"></td>
					</tr>
				</table>
			</div>

			<div class="appointment">
				<label>발령정보</label>
				<table id="appointmentTable">
					<tr>
						<td>발령구분</td>
						<td>발령내용</td>
						<td>발령일자</td>
						<td>
							<input type="button" value="행 추가" onclick="addRow('appointmentTable');">
						</td>
					</tr>
				</table>
			</div>
			<button type="submit">사원 등록</button>
		</form>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>