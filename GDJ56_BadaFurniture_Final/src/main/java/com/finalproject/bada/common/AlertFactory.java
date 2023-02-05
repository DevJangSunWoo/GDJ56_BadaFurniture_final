package com.finalproject.bada.common;

import java.text.DecimalFormat;

import com.finalproject.bada.resell.model.vo.Resell;

public class AlertFactory {
	
	public static String getAlertMsg(String path, String state, Object obj) {
		
		String msg = null;
		DecimalFormat formatter = new DecimalFormat("###,###");
		switch(state) {
		case "resellComment" : 
			Resell resell = (Resell)obj;
			msg = "<a href=\""+path+"/resell/read.do?resellNo="+resell.getResellNo()+"\">"+resell.getItem()+" 판매신청("+formatter.format(resell.getHopePrice()) +")"+"</a>"
			+"에 운영자가 댓글을 달았습니다.";
			break;
		default: 
			break;
		}
		return msg;
	}
	
}
