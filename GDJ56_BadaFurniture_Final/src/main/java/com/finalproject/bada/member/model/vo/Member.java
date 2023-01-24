package com.finalproject.bada.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Member {
	
	private int memberNo;
	private String memberId;
	private String email;
	private String password;
	private String memberName;
	private String phone;
	private String postCode;
	private String address;
	private String detailAddress;
	private String bankName;
	private String accountCode;
	private Date memberEnrollDate;
	private Date memberEditDate;
}
