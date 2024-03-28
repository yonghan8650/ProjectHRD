package com.bswill.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bswill.domain.EventVO;
import com.bswill.domain.NotificationVO;

@Repository
public class EventDAOImpl implements EventDAO {

	private static final Logger logger = LoggerFactory.getLogger(EventDAOImpl.class);

	private static final String NAMESPACE = "com.bswill.mapper.EventMapper";

	@Inject
	SqlSession sqlSession;

	@Override
	public void insertEvent(EventVO vvo) throws Exception {
		logger.debug("insertEvent(EventVO vvo) 호출");

		sqlSession.insert(NAMESPACE + ".insertEvent", vvo);
	}

	@Override
	public List<EventVO> selectEmpEvent(Integer employee_id, String searchType, String keyword) throws Exception {
		logger.debug("selectEmpEvent(Integer employee_id, String searchType, String keyword) 호출");

		Map<String, Object> paramMap = new HashMap<>();

		paramMap.put("employee_id", employee_id);
		paramMap.put("searchType", searchType);
		paramMap.put("keyword", keyword);

		return sqlSession.selectList(NAMESPACE + ".selectEmpEvent", paramMap);
	}

	@Override
	public List<EventVO> selectEventList(String searchType, String keyword) throws Exception {
		logger.debug("selectEventList(String searchType, String keyword) 호출");

		Map<String, Object> paramMap = new HashMap<>();

		paramMap.put("searchType", searchType);
		paramMap.put("keyword", keyword);

		return sqlSession.selectList(NAMESPACE + ".selectEventList", paramMap);
	}

	@Override
	public Map<String, Object> selectEmpSalary(Integer employee_id) throws Exception {
		logger.debug("selectEmpSalary(Integer employee_id) 호출");

		return sqlSession.selectOne(NAMESPACE + ".selectEmpSalary", employee_id);
	}

	@Override
	public void updateEventAuthApprove(EventVO vvo) throws Exception {
		logger.debug("updateEventAuthApprove(EventVO vvo) 호출");

		sqlSession.update(NAMESPACE + ".updateEventAuthApprove", vvo);
	}

	@Override
	public void updateEventAuthReject(EventVO vvo) throws Exception {
		logger.debug("updateEventAuthReject(EventVO vvo) 호출");

		sqlSession.update(NAMESPACE + ".updateEventAuthReject", vvo);
	}

	@Override
	public void insertNotiEventAuth(NotificationVO nvo) throws Exception {
		logger.debug("insertNotiEventAuth(NotificationVO nvo) 호출");

		sqlSession.insert(NAMESPACE + ".insertNotiEventAuth", nvo);
	}

}
