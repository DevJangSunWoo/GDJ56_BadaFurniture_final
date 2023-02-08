package com.finalproject.bada.order.model.vo;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerator;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import com.finalproject.bada.product.model.vo.Product;
import com.finalproject.bada.refund.model.vo.Refund;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
//@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class)
public class OrderDetail {
	private int orderDetailNo;
	private OrderSheet orderSheet;
	// private int orderSheetNo;
	private Product product;
	private String deliveryState;
	private String confirmState;
	private String refundState;
	private Refund refund;

	public String toString() {
		String temp = "";

		return orderDetailNo + " " + orderSheet.getOrderSheetNo() + " " + product + " " + deliveryState + " "
				+ confirmState + " " + refundState + temp;

	}

}
