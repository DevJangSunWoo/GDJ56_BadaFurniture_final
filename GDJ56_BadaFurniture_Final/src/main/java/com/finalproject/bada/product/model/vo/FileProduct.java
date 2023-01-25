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
public class FileProduct {
	private int fileProductNo;
	private Product productNo;
	private String originalFileName;
	private String renamedFileName;
	private String thumbnail;
	private Date fileProductEnrollDate;
<<<<<<< HEAD
	
	
=======

	
	public String toString() {
		 String temp="";
	return fileProductNo+" "+productNo.getProductNo()+" "
				 +originalFileName+" "
				 +renamedFileName+" "+thumbnail+" "
				 +fileProductEnrollDate+temp;
	}
>>>>>>> branch 'master' of https://github.com/bxxxdx/GDJ56_BadaFurniture_final.git
}
