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
public class ResellComment {
	private int resellCommentNo;
	private int resellNo;
	private int memberNo;
	private String content;
	private Date resellCommentEnrollDate;
}
