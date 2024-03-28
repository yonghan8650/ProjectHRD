package com.bswill.service;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bswill.domain.EmployeeVO;
import com.bswill.domain.NotificationVO;
import com.bswill.persistence.EmployeeDAO;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	private static final Logger logger = LoggerFactory.getLogger(EmployeeServiceImpl.class);

	@Inject
	private EmployeeDAO edao;

	private String convertStatusToString(int status) {
		String statusString = "";
		switch (status) {
		case 1:
			statusString = "재직";
			break;
		case 2:
			statusString = "휴직";
			break;
		case 3:
			statusString = "퇴직";
			break;
		default:
			statusString = "기타";
			break;
		}
		return statusString;
	}

	private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

	@Override
	public int countEmpNo(Integer year) throws Exception {
		logger.debug("countEmpNo() 호출");

		return edao.selectEmpCount(year);
	}

	@Override
	public void registEmp(EmployeeVO evo) throws Exception {
		logger.debug("registEmp(empVO evo) 호출");

		edao.insertEmp(evo);

		logger.debug("신입사원 등록 완료");
	}

	@Override
	public List<Map<String, Object>> listEmp(String searchType, String keyword) throws Exception {
		logger.debug("listEmp() 호출");

		List<Map<String, Object>> empList = edao.selectEmpList(searchType, keyword);

		for (Map<String, Object> emp : empList) {
			int status = (int) emp.get("STATUS");
			String statusString = convertStatusToString(status);
			emp.put("STATUS", statusString);
		}

		for (Map<String, Object> emp : empList) {
			Object startDateObj = emp.get("start_date");
			if (startDateObj instanceof java.util.Date) {
				String startDateStr = dateFormat.format((java.util.Date) startDateObj);
				emp.put("start_date", startDateStr);
			}
		}

		logger.debug("empList: " + empList);

		return empList;
	}

	@Override
	public Map<String, Object> viewEmp(Integer employee_id) throws Exception {
		logger.debug("viewEmp(Integer employee_id) 호출");

		return edao.selectEmp(employee_id);
	}

	@Override
	public void notifyModification(NotificationVO nvo) throws Exception {
		logger.debug("notifyModification(NotificationVO nvo) 호출");

		edao.insertNotiEmp(nvo);
	}

	@Override
	public void modifyEmpTelAndEmail(Integer employee_id, String emp_tel, String emp_mail) throws Exception {
		logger.debug("modifyEmpTelAndEmail(Integer employee_id, String emp_tel, String emp_mail) 호출");

		edao.updateEmpTelAndEmail(employee_id, emp_tel, emp_mail);
	}

	@Override
	public void modifyEmp(EmployeeVO evo) throws Exception {
		logger.debug("modifyEmp(int employee_id) 호출");

		edao.updateEmp(evo);
	}

	@Override
	public int getEmpListCount(String searchType, String keyword) throws Exception {
		logger.debug("getEmpListCount() 호출");

		return edao.empListCount(searchType, keyword);
	}

}
