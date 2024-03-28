package com.bswill.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bswill.persistence.AuthDAO;

@Service
public class AuthServiceImpl {

	private static final Logger logger = LoggerFactory.getLogger(AuthServiceImpl.class);

	@Inject
	AuthDAO adao;

}
