package com.finalproject.bada.resell.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class FileResell {
	private int fileResellNo;
	private int resellNo;
	private String originalFileName;
	private String renamedFileName;
	private String thumbnail;
	private Date fileResellEnrollDate;
}
