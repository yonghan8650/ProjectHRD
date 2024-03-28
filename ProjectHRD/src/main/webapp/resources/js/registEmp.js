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

let licenseNo = 0;
let appointmentNo = 0;	

function addRow(tableId) {
	let table = document.getElementById(tableId);
	let newRow = table.insertRow();

	// Create cells for the new row
	let cell1 = newRow.insertCell();
	let cell2 = newRow.insertCell();
	let cell3 = newRow.insertCell();


	// Populate cells based on tableId
	if (tableId === "licenseTable") {
		cell1.innerHTML = "<input type='text' name='licenseList[" + licenseNo + "].license'>";
		cell2.innerHTML = "<input type='text' name='licenseList[" + licenseNo + "].li_org'>";
		cell3.innerHTML = "<input type='date' name='licenseList[" + licenseNo + "].li_date' max='9999-12-31'>";
		licenseNo++;
	} else if (tableId === "appointmentTable") {
		cell1.innerHTML = "<select name='appointmentList[" + appointmentNo + "].app_issue'><option value='입사'>입사</option><option value='승진'>승진</option><option value='부서이동'>부서 이동</option><option value='퇴사'>퇴사</option><option value='휴직'>휴직</option><option value='복직'>복직</option></select>";
		cell2.innerHTML = "<input type='text' name='appointmentList[" + appointmentNo + "].app_content'>";
		cell3.innerHTML = "<input type='date' name='appointmentList[" + appointmentNo + "].app_date' max='9999-12-31'>";
		appointmentNo++;
	}

	// Create delete button cell
	let deleteCell = newRow.insertCell();
	deleteCell.innerHTML = "<input type='button' value='행 삭제' onclick='deleteRow(this);'>";
}

function deleteRow(btn) {
	let row = btn.closest("tr");
	row.parentNode.removeChild(row);
}
