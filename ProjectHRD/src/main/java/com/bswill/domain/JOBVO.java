package com.bswill.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class JOBVO {
	private int JOB_ID;
	private String JOB;
	private double radio_bonus;
	private double radio_premium;
}
