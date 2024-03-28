package com.bswill.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bswill.service.MailService;

// @EnableAsync : 비동기 방식 처리가 가능하도록 설정

@Controller
@EnableAsync
public class MailController {
	
	private static final Logger logger = LoggerFactory.getLogger(MailController.class);
	
	@Inject
	private MailService mailService;
	
	// http://localhost:8088/controller/send
	@ResponseBody
	@RequestMapping(value = "/sendMail", method = RequestMethod.POST )
	public void sendMail(@RequestBody List<Map<String, Object>> salaryList) throws Exception{
		logger.info(" sendMail() 호출 ");
	
		
		Map<String, Object> sortMap = salaryList.get(0);
		logger.debug(sortMap.toString());
		
		Map<String, Object> salaryListMap = new LinkedHashMap<String, Object>();
		Map<String, String> empMap = new LinkedHashMap<String, String>();

		salaryListMap.put("기본금", sortMap.get("salary"));
		salaryListMap.put("상여금", sortMap.get("bonus"));
		salaryListMap.put("국민연금", sortMap.get("premium_1"));
		salaryListMap.put("건강보험", sortMap.get("premium_2"));
		salaryListMap.put("장기요양보험", sortMap.get("premium_3"));
		salaryListMap.put("고용보험", sortMap.get("premium_4"));
		salaryListMap.put("지급총액", sortMap.get("sum"));
		salaryListMap.put("공제총액", sortMap.get("premium"));
		
		empMap.put("name", (String)sortMap.get("emp_name"));
		empMap.put("email", (String)sortMap.get("emp_email"));
		
		logger.debug(salaryListMap.toString());
		logger.debug(empMap.toString());
		
		// 전송할 데이터설정
		StringBuffer sb = new StringBuffer();
		
		sb.append("<html><head></head><body>");
		sb.append(" <h1> 안녕하세요 bswill 입니다. </h1> ");
		sb.append("<h2> ").append(empMap.get("name")).append("님 의").append(" 급여명세서 테스트 입니다. </h2> ");
        
    	sb.append("<h3>급여 명세서</h3>");
        // 각각의 key-value 쌍에 대해 반복
        for (Map.Entry<String, Object> entry : salaryListMap.entrySet()) {
            String key = entry.getKey();
            Object value = entry.getValue();
            sb.append("<p>").append(key).append(" : ").append(value).append("원").append("</p>");
        }
        
		sb.append("</body></html>");
		
		mailService.sendMail(empMap.get("email"), "bswill 급여명세서 테스트5", sb.toString());
		
	}

}
