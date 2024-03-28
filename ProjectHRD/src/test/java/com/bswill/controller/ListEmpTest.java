package com.bswill.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bswill.persistence.EmployeeDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ListEmpTest {

	private static final Logger logger = LoggerFactory.getLogger(ListEmpTest.class);

	@Inject
	EmployeeDAO edao;

	@Test
	public void listEmpTest() throws Exception {
		logger.debug("listEmpTest() 호출");

		List<Map<String, Object>> empList = edao.selectEmpList("", "");

		logger.debug("empList: " + empList);
	}

}
