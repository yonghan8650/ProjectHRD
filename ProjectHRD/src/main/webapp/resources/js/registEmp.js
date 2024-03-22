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

function addRow(tableId) {
	let table = document.getElementById(tableId);
	let newRow = table.insertRow();

	// Create cells for the new row
	let cell1 = newRow.insertCell();
	let cell2 = newRow.insertCell();
	let cell3 = newRow.insertCell();

	// Populate cells based on tableId
	if (tableId === "licenseTable") {
		cell1.innerHTML = "<input type='text' name='license'>";
		cell2.innerHTML = "<input type='text' name='li_org'>";
		cell3.innerHTML = "<input type='date' name='li_date' max='9999-12-31'>";
	} else if (tableId === "appointmentTable") {
		cell1.innerHTML = "<select name='app_issue'><option value='입사'>입사</option><option value='승진'>승진</option><option value='부서 이동'>부서 이동</option><option value='퇴사'>퇴사</option><option value='휴직'>휴직</option><option value='복직'>복직</option></select>";
		cell2.innerHTML = "<input type='text' name='app_content'>";
		cell3.innerHTML = "<input type='date' name='app_date' max='9999-12-31'>";
	}

	// Create delete button cell
	let deleteCell = newRow.insertCell();
	deleteCell.innerHTML = "<input type='button' value='행 삭제' onclick='deleteRow(this);'>";
}

function deleteRow(btn) {
	let row = btn.closest("tr");
	row.parentNode.removeChild(row);
}

function generateEmployeeId(startDate, jobId) {
	const year = startDate.split('-')[0];
	const empNo = document.getElementById('empno').getAttribute('data-empno');
	return year + jobId + empNo;
}

function generatePassword(birth, startDate) {
	let replaced_birth = birth.replace(/-/g, '');
	let replaced_startDate = startDate.replace(/-/g, '');
	return replaced_birth + replaced_startDate;
}

function submitEmployeeInfo() {
	// 사원 정보 업로드
	sendEmployeeData()
}

function sendEmployeeData() {
	const empName = document.getElementById('emp_name').value;
	const birth = document.getElementById('birth').value;
	const gender = document.querySelector('input[name="gender"]:checked').value;
	const empTel = document.getElementById('emp_tel').value;
	const empMail = document.getElementById('emp_mail').value;
	const empAddr = document.getElementById('emp_addr').value;
	const jobId = document.getElementById('JOB_ID').value;
	const deptId = document.getElementById('DEPTID').value;
	const startDate = document.getElementById('start_date').value;

	const empno = generateEmployeeId(startDate, jobId);
	const password = generatePassword(birth, startDate);

	const profileImage = document.getElementById('inputProfile').files[0];
	const profileName = empno + '.' + profileImage.name.split('.').pop();

	const licenses = [];
	const licenseTable = document.getElementById('licenseTable');
	for (let i = 1; i < licenseTable.rows.length; i++) {
		const license = licenseTable.rows[i].cells[0]
				.getElementsByTagName('input')[0].value;
		const li_org = licenseTable.rows[i].cells[1]
				.getElementsByTagName('input')[0].value;
		const li_date = licenseTable.rows[i].cells[2]
				.getElementsByTagName('input')[0].value;
		licenses.push({
			employee_id : empno,
			license : license,
			li_org : li_org,
			li_date : li_date
		});
	}

	const appointments = [];
	const appointmentTable = document.getElementById('appointmentTable');
	for (let i = 1; i < appointmentTable.rows.length; i++) {
		const app_issue = appointmentTable.rows[i].cells[0]
				.getElementsByTagName('select')[0].value;
		const app_content = appointmentTable.rows[i].cells[1]
				.getElementsByTagName('input')[0].value;
		const app_date = appointmentTable.rows[i].cells[2]
				.getElementsByTagName('input')[0].value;
		appointments.push({
			employee_id : empno,
			app_issue : app_issue,
			app_content : app_content,
			app_date : app_date
		});
	}

	const formData = new FormData();
	formData.append('employee_id', empno);
	formData.append('PASSWD', password);
	formData.append('emp_name', empName);
	formData.append('PROFIL', profileName);
	formData.append('birth', birth);
	formData.append('gender', gender);
	formData.append('emp_tel', empTel);
	formData.append('emp_mail', empMail);
	formData.append('emp_addr', empAddr);
	formData.append('JOB_ID', jobId);
	formData.append('DEPTID', deptId);
	formData.append('start_date', startDate);
	formData.append('licenses', JSON.stringify(licenses));
	formData.append('appointments', JSON.stringify(appointments));

	const xhr = new XMLHttpRequest();
	xhr.open('POST', '/emp/registEmp');
	xhr.onload = function() {
		if (xhr.status === 200 || xhr.status === 201) {
			console.log('사원 정보 전송 성공');
			uploadImage();
		} else {
			console.error('사원 정보 전송 실패');
			// 실패 시 실행할 코드
			alert('사원 정보 전송 실패');
		}
	};
	xhr.onerror = function() {
		console.error('통신 오류');
		// 통신 오류 시 실행할 코드
	};
	xhr.send(formData);
}

function uploadImage() {
	const formData = new FormData();
	const fileInput = document.getElementById('inputProfile');
	const file = fileInput.files[0];
	formData.append('profile', file);

	const xhr = new XMLHttpRequest();
	xhr.open('POST', '/emp/registEmp');
	xhr.onload = function() {
		if (xhr.status === 200 || xhr.status === 201) {
			console.log('이미지 업로드 성공');
		} else {
			console.error('이미지 업로드 실패');
			// 이미지 업로드 실패 시 실행할 코드
			alert('이미지 업로드 실패');
		}
	};
	xhr.onerror = function() {
		console.error('통신 오류');
		// 통신 오류 시 실행할 코드
	};
	xhr.send(formData);

}
