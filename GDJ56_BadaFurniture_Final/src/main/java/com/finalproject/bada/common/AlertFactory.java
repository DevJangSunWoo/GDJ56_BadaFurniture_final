package com.finalproject.bada.common;

import java.text.DecimalFormat;

import com.finalproject.bada.order.model.vo.OrderDetail;
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
		case "progressState":
			Resell updateResell = (Resell)obj;
			msg = "<a href=\""+path+"/resell/read.do?resellNo="+updateResell.getResellNo()+"\">"+updateResell.getItem()+" 판매신청("+formatter.format(updateResell.getHopePrice()) +")"+"</a>"
					+"의 상태가 <b>" + updateResell.getProgressState() + (updateResell.getProgressState().equals("수정요청")?"으":"") +"</b>로 변경되었습니다.";
			break;
		case "refundState" :
			OrderDetail orderDetail = (OrderDetail)obj;
			if(orderDetail.getRefundState() != null) {
				String refundState = orderDetail.getRefundState().indexOf("반품")>0?"반품":"취소";
				msg = "<a href=\""+path+"/mypage/refund.do?orderDetailNo="+orderDetail.getOrderDetailNo()+"\">["+refundState+"]"+orderDetail.getProduct().getTitle()+"("+formatter.format(orderDetail.getProduct().getPrice()) +")"+"</a>"
					+"의 처리상태가 <b>" + orderDetail.getRefundState() + "</b>로 변경되었습니다.";
			}
			break;
		default: 
			break;
		}
		return msg;
	}
}
