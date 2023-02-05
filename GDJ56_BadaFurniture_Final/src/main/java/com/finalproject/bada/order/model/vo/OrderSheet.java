package com.finalproject.bada.order.model.vo;

import java.sql.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import com.finalproject.bada.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class)
public class OrderSheet {
	private int orderSheetNo;
	private Member member;   //*
	private String paymentMethod;
	private String paymentState;
	private String merchantUid;
	private String impUid;
	private String receiptUrl;
	private String depositor;
	private int totalPrice;
	private String receiverName;
	private String postCode; //*
	private String address;
	private String detailAddress;
	private Date orderSheetenrollDate; 
	private List<OrderDetail> details;
	
	
	
	
	public String toString() {
		String temp="";
		return  orderSheetNo+" "+member.getMemberNo()+" "+paymentMethod+" "+paymentState+" "+merchantUid+" "+impUid+receiptUrl+
				" "+depositor+" "+totalPrice+receiverName+" "
				+postCode+" "+address+" "+detailAddress+" "+orderSheetenrollDate+" "+details+temp;
	}
	
	
	
	
	
	
}
