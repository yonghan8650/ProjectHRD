<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사 정보 입력</title>
<script src="${path}/resources/js/registEmp.js"></script>
</head>
<body>
	<%@ include file="../include/aside.jsp"%>

	<div class="profile">
		<h3>프로필 사진</h3>
		<input type="file" id="inputProfile" onchange="previewImage(event)" accept="image/jpeg, image/png, image/gif" />

		<img id="preview" src="#" alt="미리보기" style="display: none; max-width: 200px; max-height: 200px;" />

		<div id="result"></div>

		<p id="errorMessage" style="display: none; color: red;">이미지 파일을 선택하세요.</p>
	</div>

	<div id="empno" data-empno="${empno}"></div>

	<div class="employee">
		<h3>사원정보</h3>
		<table>
			<tr>
				<td><label for="emp_name">성명</label></td>
				<td><input type="text" id="emp_name" name="emp_name" autofocus="autofocus"></td>
				<td><label for="birth">생년월일</label></td>
				<td><input type="date" id="birth" name="birth" max="9999-12-31"></td>
				<td>성별</td>
				<td>
					<input type="radio" id="male" name="gender" value="1">
					<label for="male">남</label>
					<input type="radio" id="female" name="gender" value="2">
					<label for="female">여</label>
				</td>
			</tr>
			<tr>
				<td><label for="emp_tel">연락처</label></td>
				<td><input type="tel" id="emp_tel" name="emp_tel"></td>
				<td><label for="emp_mail">이메일</label></td>
				<td><input type="email" id="emp_mail" name="emp_mail"></td>
				<td><label for="start_date">입사일</label></td>
				<td><input type="date" id="start_date" name="start_date" max="9999-12-31"></td>
			</tr>
			<tr>
				<td>직급</td>
				<td>
					<select id="JOB_ID">
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
					<select id="DEPTID">
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
				<td colspan="5"><input type="text" id="emp_addr" name="emp_addr"></td>
			</tr>
		</table>
	</div>

	<div class="license">
		<h3>자격정보</h3>
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
		<h3>발령정보</h3>
		<table id="appointmentTable">
			<tr>
				<td>발령구분</td>
				<td>발령내용</td>
				<td>발령일자</td>
				<td><input type="button" value="행 추가" onclick="addRow('appointmentTable');"></td>
			</tr>
		</table>
	</div>

	<button onclick="submitEmployeeInfo()">사원 등록</button>
</body>
</html>