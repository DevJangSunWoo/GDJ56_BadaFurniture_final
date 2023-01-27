package com.finalproject.bada.mypage.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Alert {
	private int alertNo;
	private int memberNo;
	private String detail;
	private String readState;
	private Date alertEnrollDate;
}
