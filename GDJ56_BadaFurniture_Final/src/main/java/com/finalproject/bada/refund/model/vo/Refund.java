package com.finalproject.bada.refund.model.vo;



import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Refund {
	private int refundNo;
	private int orderDetailNo;
	private String refundState;
	private String detail;
	private Date refundEnrollDate;
}
