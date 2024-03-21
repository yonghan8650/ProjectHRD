package com.bswill.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository
public class EventDAOImpl implements EventDAO {

	private static final Logger logger = LoggerFactory.getLogger(EventDAOImpl.class);

	private static final String NAMESPACE = "com.bswill.mapper.EventMapper";

	@Inject
	SqlSession sqlsession;

}
