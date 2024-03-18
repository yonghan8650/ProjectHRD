<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사 정보 입력</title>
<script type="text/javascript">
	function addLicenseRow() {
		const licenseTable = document.getElementById('licenseTable');

		const newRow = licenseTable.insertRow();

		const newCell0 = newRow.insertCell(0);
		const newCell1 = newRow.insertCell(1);
		const newCell2 = newRow.insertCell(2);
		const newCell3 = newRow.insertCell(3);

		newCell0.innerHTML = "<input type='text' name='license'>";
		newCell1.innerHTML = "<input type='text' name='li_org'>";
		newCell2.innerHTML = "<input type='date' name='li_date'>";
		newCell3.innerHTML = "<input type='button' value='행 삭제' onclick='subLicenseRow();'>";
	}
	
	function subLicenseRow() {
		const licenseTable = document.getElementById('licenseTable');
		
		licenseTable.deleteRow(-1);
	}

	function addAppointmentRow() {
		const appointmentTable = document.getElementById('appointmentTable');

		const newRow = appointmentTable.insertRow();

		const newCell0 = newRow.insertCell(0);
		const newCell1 = newRow.insertCell(1);
		const newCell2 = newRow.insertCell(2);
		const newCell3 = newRow.insertCell(3);
		const newCell4 = newRow.insertCell(4);

		newCell0.innerHTML = "<select><option value='1'>입사</option><option value='2'>승진</option><option value='3'>부서 이동</option><option value='4'>퇴사</option><option value='5'>휴직</option><option value='6'>복직</option></select>";
		newCell1.innerHTML = "<input type='date' name='app_date' max='9999-12-31'>";
		newCell2.innerHTML = "<input type='text' name='app_content'>";
		newCell3.innerHTML = "<input type='button' value='행 삭제' onclick='subAppointmentRow();'>";
	}
	
	function subAppointmentRow() {
		const licenseTable = document.getElementById('appointmentTable');
		
		licenseTable.deleteRow(-1);
	}
</script>
</head>
<body>
	<%@ include file="../include/aside.jsp"%>


	<form action="" method="post" enctype="multipart/form-data">
		<div>
			<h3>사원정보</h3>
			<div class="PROFIL">
				<input type="file">
			</div>
			<table>
				<tr>
					<td>
						<label for="emp_name">성명</label>
					</td>
					<td>
						<input type="text" id="emp_name" name="emp_name" autofocus="autofocus" required="required">
					</td>
					<td>
						<label for="birth">생년월일</label>
					</td>
					<td>
						<input type="date" id="birth" name="birth" max="9999-12-31" required="required">
					</td>
					<td>성별</td>
					<td>
						<input type="radio" name="gender" value="1" required="required">
						남
						<input type="radio" name="gender" value="2">
						여
					</td>
				</tr>
				<tr>
					<td>
						<label for="emp_tel">연락처</label>
					</td>
					<td>
						<input type="tel" id="emp_tel" name="emp_tel" required="required">
					</td>
					<td>
						<label for="emp_mail">이메일</label>
					</td>
					<td>
						<input type="email" id="emp_mail" name="emp_mail" required="required">
					</td>
					<td>
						<label for="start_date">입사일</label>
					</td>
					<td>
						<input type="date" id="start_date" name="start_date" max="9999-12-31" required="required">
					</td>
				</tr>
				<tr>
					<td>직급</td>
					<td>
						<select required="required">
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
						<select required="required">
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
					<td>
						<label for="emp_addr">주소</label>
					</td>
					<td colspan="5">
						<input type="text" id="emp_addr" name="emp_addr" required="required">
					</td>
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
					<td><input type="button" value="행 추가" onclick="addLicenseRow();"></td>
				</tr>
			</table>
		</div>
		<div class="appointment">
			<h3>발령정보</h3>
			<table id="appointmentTable">
				<tr>
					<td>발령구분</td>
					<td>발령일자</td>
					<td>발령내용</td>
					<td><input type="button" value="행 추가" onclick="addAppointmentRow();"></td>
				</tr>
			</table>
		</div>
		<input type="submit" value="사원 등록">
	</form>
</body>
</html>