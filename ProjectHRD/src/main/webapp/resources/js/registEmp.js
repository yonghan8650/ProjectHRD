/**
 * registEmp.js
 */

// 프로필 미리보기
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

// 미리보기 초기화
function resetPreview() {
	const preview = document.getElementById('preview');
	preview.style.display = 'none';
	preview.src = '';
}

// 행 추가 함수
function addRow(tableId) {
	let table = document.getElementById(tableId);
	let newRow = table.insertRow();
	let html = "";

	if (tableId === "licenseTable") {
		html = "<td><input type='text' name='license'></td>"
				+ "<td><input type='text' name='li_org'></td>"
				+ "<td><input type='date' name='li_date'></td>";
	} else if (tableId === "appointmentTable") {
		html = "<td><select><option value='입사'>입사</option><option value='승진'>승진</option><option value='부서 이동'>부서 이동</option><option value='퇴사'>퇴사</option><option value='휴직'>휴직</option><option value='복직'>복직</option></select></td>"
				+ "<td><input type='text' name='app_content'></td>"
				+ "<td><input type='date' name='app_date' max='9999-12-31'></td>";
	}

	newRow.innerHTML = html
			+ "<td><input type='button' value='행 삭제' onclick='deleteRow(this);'></td>";
}

// 행 삭제 함수
function deleteRow(btn) {
	let row = btn.closest("tr");
	row.parentNode.removeChild(row);
}

// 데이터 업로드 함수
function uploadData() {
	// 사원
    const emp_name = document.getElementById('emp_name').value;
    const birth = document.getElementById('birth').value;
    const gender = document.querySelector('input[name="gender"]:checked').value;
    const emp_tel = document.getElementById('emp_tel').value;
    const emp_mail = document.getElementById('emp_mail').value;
    const start_date = document.getElementById('start_date').value;
    const JOB_ID = document.getElementById('JOB_ID').value;
    const DEPTID = document.getElementById('DEPTID').value;
    const emp_addr = document.getElementById('emp_addr').value;
    
    let start_date = new Date();
    const startYear = start_date.getFullYear();
    const employee_id = startYear + JOB_ID + empno;
    
    const birthFormatted = birth.replace(/-/g, '');
    const startDateFormatted = start_date.replace(/-/g, '');
    
    const PASSWD = birthFormatted + startDateFormatted;

    formData.append('employee_id', employee_id);
    formData.append('PASSWD', PASSWD);
    formData.append('emp_name', emp_name);
    formData.append('birth', birth);
    formData.append('gender', gender);
    formData.append('emp_tel', emp_tel);
    formData.append('emp_mail', emp_mail);
    formData.append('emp_addr', emp_addr);
    formData.append('JOB_ID', JOB_ID);
    formData.append('DEPTID', DEPTID);
    formData.append('start_date', start_date);
    
    // 프로필
    const inputProfile = document.getElementById('inputProfile');
    const profile = inputProfile.files[0];
    const imageExt = profile.name.split('.').pop();
    const newProfileName = employee_id + '.' + imageExt;
    
    const formData = new FormData();
    formData.append('PROFIL', profile, newProfileName);

	// 자격증
    const licenses = [];
    const licenseTable = document.getElementById('licenseTable');
    for (let i = 1; i < licenseTable.rows.length; i++) {
        const license = licenseTable.rows[i].cells[0].getElementsByTagName('input')[0].value;
        const li_org = licenseTable.rows[i].cells[1].getElementsByTagName('input')[0].value;
        const li_date = licenseTable.rows[i].cells[2].getElementsByTagName('input')[0].value;
        licenses.push({license_name, li_org, li_date});
    }
    formData.append('licenses', JSON.stringify(licenses));

	// 발령
    const appointments = [];
    const appointmentTable = document.getElementById('appointmentTable');
    for (let i = 1; i < appointmentTable.rows.length; i++) {
        const app_issue = appointmentTable.rows[i].cells[0].getElementsByTagName('select')[0].value;
        const app_content = appointmentTable.rows[i].cells[2].getElementsByTagName('input')[0].value;
        const app_date = appointmentTable.rows[i].cells[1].getElementsByTagName('input')[0].value;
        appointments.push({app_type, app_date, app_content});
    }
    formData.append('appointments', JSON.stringify(appointments));

    // 사원 정보 업로드 AJAX 요청
	function uploadData(formData) {
		return new Promise((resolve, reject) => {
			const xhr = new XMLHttpRequest();
			xhr.open('POST', '/emp/register', true);
			xhr.onload = function() {
				if (xhr.status === 200) {
					resolve('이미지 및 사원 정보 업로드 성공!');
				} else {
					reject('이미지 및 사원 정보 업로드 실패!');
				}
			};
			xhr.onerror = function() {
				reject('서버 요청 오류 발생');
			};
			xhr.send(formData);
		});
	}

	// 데이터 업로드 함수
	function uploadDataAndShowResult() {
		const formData = prepareFormData();
		uploadData(formData)
			.then((message) => {
				document.getElementById('result').innerHTML = message;
			})
			.catch((error) => {
				document.getElementById('result').innerHTML = error;
			});
	}
}