package com.bswill.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bswill.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{
	@Inject
	private BoardDAO bdao;
}
