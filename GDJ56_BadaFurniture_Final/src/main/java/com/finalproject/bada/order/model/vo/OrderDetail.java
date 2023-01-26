package com.finalproject.bada.order.model.vo;

import java.sql.Date;

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
	private int productNo;
	private String deliveryState;
	private String confirmState;
	private String refundState;
	
	
	public String toString() {
		 String temp="";
	
		 return orderDetailNo+" "+orderSheetNo+" "+productNo+" "+deliveryState
				 +" "+confirmState+" "+refundState+temp;
		 
	}
	
}
