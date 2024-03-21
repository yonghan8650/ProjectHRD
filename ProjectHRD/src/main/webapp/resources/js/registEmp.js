/**
 * registEmp.js
 */

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
        cell3.innerHTML = "<input type='date' name='li_date'>";
    } else if (tableId === "appointmentTable") {
        cell1.innerHTML = "<select><option value='입사'>입사</option><option value='승진'>승진</option><option value='부서 이동'>부서 이동</option><option value='퇴사'>퇴사</option><option value='휴직'>휴직</option><option value='복직'>복직</option></select>";
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

////////////////////////////////////////

function submitEmployeeInfo() {
    // 사용자가 입력한 정보를 수집합니다.
    const empName = document.getElementById("emp_name").value;
    const profileImage = document.getElementById("inputProfile").files[0];
    const birth = document.getElementById("birth").value;
    const gender = document.querySelector("input[name='gender']:checked").value;
    const empTel = document.getElementById("emp_tel").value;
    const empMail = document.getElementById("emp_mail").value;
    const empAddr = document.getElementById("emp_addr").value;
    const jobId = document.getElementById("JOB_ID").value;
    const deptId = document.getElementById("DEPTID").value;
    const startDate = document.getElementById("start_date").value;

    // 사원번호 생성
    const empno = generateEmployeeNumber(startDate, jobId);
    
    // 비밀번호 생성
    const password = generatePassword(birth, startDate);

    // 프로필 이미지 파일 이름 생성
    const imageFileName = empno + "." + profileImage.name.split('.').pop();

    // FormData 객체 생성
    const formData = new FormData();
    formData.append("employee_id", empno);
    formData.append("PASSWD", password);
    formData.append("emp_name", empName);
    formData.append("PROFIL", profileImage, imageFileName); // 프로필 이미지 파일 이름 추가
    formData.append("birth", birth);
    formData.append("gender", gender);
    formData.append("emp_tel", empTel);
    formData.append("emp_mail", empMail);
    formData.append("emp_addr", empAddr);
    formData.append("JOB_ID", jobId);
    formData.append("DEPTID", deptId);
    formData.append("start_date", startDate);

    // AJAX를 이용하여 FormData를 서버로 전송
    const xhr = new XMLHttpRequest();
    xhr.open("POST", "/emp/regist", true);
    xhr.onload = function() {
        if (xhr.status === 200) {
            console.log("사원 등록이 완료되었습니다.");
            // 성공적으로 등록되었을 때의 처리
        } else {
            console.error("사원 등록에 실패했습니다.");
            // 등록 실패 시의 처리
        }
    };
    xhr.onerror = function() {
        console.error("요청을 보내는 중에 오류가 발생했습니다.");
        // 오류 발생 시의 처리
    };
    xhr.send(formData);
}

//사원번호 생성 함수
function generateEmployeeNumber(startDate, jobId) {
    const year = startDate.split('-')[0];
    const paddedJobId = jobId.padStart(3, '0');
    const paddedEmpNo = document.getElementById("empno").dataset.empno.padStart(3, '0');
    return year + paddedJobId + paddedEmpNo;
}

//비밀번호 생성 함수
function generatePassword(birth, startDate) {
    const birthYear = birth.substring(0, 4);
    const startYear = startDate.substring(0, 4);
    return birthYear + startYear;
}
