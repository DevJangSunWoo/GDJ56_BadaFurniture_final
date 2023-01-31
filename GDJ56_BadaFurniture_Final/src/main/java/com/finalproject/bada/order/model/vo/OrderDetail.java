package com.finalproject.bada.order.model.vo;

import com.finalproject.bada.product.model.vo.Product;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class OrderDetail {
	private int orderDetailNo;
	private int orderSheetNo;
	private Product product;
	private String deliveryState;
	private String confirmState;
	private String refundState;
	
	
	public String toString() {
		 String temp="";
	
		 return orderDetailNo+" "+orderSheetNo+" "+product+" "+deliveryState
				 +" "+confirmState+" "+refundState+temp;
		 
	}
	
}
