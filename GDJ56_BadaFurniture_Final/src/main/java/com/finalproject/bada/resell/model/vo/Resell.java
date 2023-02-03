package com.finalproject.bada.resell.model.vo;

import java.sql.Date;
import java.util.List;

import com.finalproject.bada.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Resell { 
	private int resellNo;
	private Member member;
	private String item;
	private String grade;
	private int widths;
	private int depths;
	private int heights;
	private String color;
	private String detail;
	private String postCode;
	private String address;
	private String addressDetail;
	private Date pickUpDate;
	private int hopePrice;
	private String bankName;
	private String depositorName;
	private String accountCode;
	private String progressState;
	private Date resellEnrollDate;
	private Date resellEditDate;
	private List<FileResell> files;
	private List<ResellComment> comments;
}
