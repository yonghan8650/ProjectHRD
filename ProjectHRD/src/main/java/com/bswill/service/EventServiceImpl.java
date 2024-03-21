package com.bswill.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bswill.persistence.EventDAO;

@Service
public class EventServiceImpl {

	private static final Logger logger = LoggerFactory.getLogger(EventServiceImpl.class);

	@Inject
	EventDAO edao;

}
