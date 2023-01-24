package com.finalproject.bada.product.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Product {

	private int productNo;
	private String title;	
	private int price;
	private String item;
	private String grade;
	private String Material;
	private int widthes;
	private int heights;
	private String color;
	private String detail;
	private String showState;
	private String soldOutState;
	private Date productSoldOutDate;
	private Date productEnrollDate;
	private Date productEditDate;
}
