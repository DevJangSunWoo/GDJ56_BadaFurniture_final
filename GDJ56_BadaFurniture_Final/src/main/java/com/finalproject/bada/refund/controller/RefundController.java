package com.finalproject.bada.refund.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RefundController {
	
	@RequestMapping("/refund/write/return.do")
		String writeRefundReturn() {
			return "refund/writeRefundReturn";
		}


	@RequestMapping("/refund/write/cancel.do")
		String writeRefundCancel() {
			return "refund/writeRefundCancel";
		}
	
	
}
