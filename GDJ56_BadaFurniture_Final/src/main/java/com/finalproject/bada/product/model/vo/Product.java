package com.finalproject.bada.product.model.vo;

import java.sql.Date;
import java.util.List;

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
	private String material;
	private int widths;
	private int depths;
	private int heights;
	private String color;
	private String detail;
	private String showState;
	private String soldOutState;
	private Date productSoldOutDate;
	private Date productEnrollDate;
	private Date productEditDate;
	private List<FileProduct> files;
	
	public String toString() {
	 String temp="";
	 return productNo+" "+title+" "+price+" "+item+" "
			 +grade+" "+material+" "+widths+" "+depths+" "+heights+" "+color+" "+detail+" "+showState+" "
	 +soldOutState+" "+productSoldOutDate+" "
			 +productEnrollDate+" "+productEditDate+" "+files;
	}

}
