package com.finalproject.bada.mypage.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.bada.admin.model.service.AdminService;
import com.finalproject.bada.common.AdminPageFactory;
import com.finalproject.bada.common.PageFactory;
import com.finalproject.bada.member.model.vo.Member;
import com.finalproject.bada.mypage.model.service.MypageService;
import com.finalproject.bada.mypage.model.vo.Alert;
import com.finalproject.bada.order.model.vo.OrderDetail;
import com.finalproject.bada.order.model.vo.OrderSheet;
import com.finalproject.bada.product.model.vo.Product;
import com.finalproject.bada.refund.model.vo.Refund;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MypageController {

	private MypageService service;
	private AdminService adminService;

	@Autowired
	public MypageController(MypageService service, AdminService adminService) {
		this.service = service;
		this.adminService = adminService;
	}

	// 장바구니 리스트 출력
	@RequestMapping("/mypage/cart.do")
	public ModelAndView cartList(ModelAndView mv) {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Member loginMember = (Member) authentication.getPrincipal();
		List<Product> products = service.selectCartProduct(loginMember.getMemberNo());
		mv.addObject("products", products);
		mv.setViewName("mypage/cartList");

		return mv;
	}

	// 장바구니 삭제 기능
	@RequestMapping("/cart/delete.do")
	public ModelAndView deleteCart(ModelAndView mv, @RequestParam(value = "productNo") List<Integer> productNos) {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Member loginMember = (Member) authentication.getPrincipal();
		// log.debug("{}",productNos);

		Map<String, Object> param = new HashMap();
		param.put("memberNo", loginMember.getMemberNo());
		param.put("productNos", productNos);

		int result = service.deleteCart(param);
		// log.debug("result : {}",result);

		String loc = "/mypage/cart.do";
		String msg = "";
		if (result > 0) {
			msg = "삭제 완료";
		} else {
			msg = "삭제 실패";
		}

		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");

		return mv;
	}

	// 알림리스트 출력
	@RequestMapping("/mypage/alert.do")
	public ModelAndView alertList(ModelAndView mv, @RequestParam(value = "cPage", defaultValue = "1") int cPage) {

		int numPerpage = 5;
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Member loginMember = (Member) authentication.getPrincipal();

		List<Alert> alerts = service.selectAlertList(loginMember.getMemberNo(), cPage, numPerpage);
		int totalData = service.selectAlertCount(loginMember.getMemberNo());
		String pageBar = PageFactory.getPage(cPage, numPerpage, totalData, "alert.do");

		mv.addObject("pageBar", pageBar);
		mv.addObject("alerts", alerts);
		mv.setViewName("mypage/alertList");

		return mv;
	}

	// 알림 선택삭제 기능
	@RequestMapping("/alert/delete.do")
	public ModelAndView deleteAlert(ModelAndView mv, @RequestParam(value = "alertNo") List<Integer> alertNos) {

		int result = service.deleteAlert(alertNos);

		String loc = "/mypage/alert.do";
		String msg = "";
		if (result > 0) {
			msg = "삭제 완료";
		} else {
			msg = "삭제 실패";
		}

		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");

		return mv;
	}

	// 로그인 멤버의 N이었던 알림 READ_STATE Y로 변경
	@ResponseBody
	@RequestMapping("/alert/updateReadState.do")
	public int updateAlertReadState() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Member loginMember = (Member) authentication.getPrincipal();
		int result = service.updateAlertReadState(loginMember.getMemberNo());
		// log.debug("new 표시 업데이트 : ",result);
		return result;
	}

	// 알림 READ_STATE가 N인 행의 갯수 반환
	@ResponseBody
	@RequestMapping("/alert/countReadState.do")
	public int countReadState(HttpSession session) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Member loginMember = (Member) authentication.getPrincipal();
		int count = service.selectAlertCountReadStateN(loginMember.getMemberNo());
		return count;
	}

	// order리스트 출력
	@RequestMapping("/mypage/order.do")
	public ModelAndView orderList(ModelAndView mv, @RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerpage", defaultValue = "5") int numPerpage,
			@RequestParam(value = "searchType", defaultValue = "SEARCH_ALL") String searchType,
			@RequestParam(value = "searchKeyword", defaultValue = "searchAll") String searchKeyword,
			@RequestParam(value = "orderSheetNo", required = false) Integer orderSheetNo) {

		Map search = new HashMap();
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Member loginMember = (Member) authentication.getPrincipal();
		search.put("memberNo", loginMember.getMemberNo());
		search.put("searchType", searchType);
		// 추가
		search.put("orderSheetNo", orderSheetNo);

		if (searchType.equals("ORDER_SHEET_ENROLL_DATE")) {
			// 주문일자 들어오는 값 :2023-01-31 ~ 2023-01-31
			String[] keys = searchKeyword.split("~");
			String key1 = keys[0].trim();
			String key2 = keys[1].trim();
			search.put("searchKeyword1", key1);
			search.put("searchKeyword2", key2);

		} else {
			search.put("searchKeyword", searchKeyword);
		}

		List<OrderSheet> orderSheets = adminService.orderListPage(Map.of("cPage", cPage, "numPerpage", numPerpage),
				search);
		mv.addObject("orderSheets",
				adminService.orderListPage(Map.of("cPage", cPage, "numPerpage", numPerpage), search));
		// log.debug("order :
		// {}",adminService.orderListPage(Map.of("cPage",cPage,"numPerpage",numPerpage),search));
		// log.debug("order :
		// {}",adminService.orderListPage(Map.of("cPage",cPage,"numPerpage",numPerpage),search).size());

		int totalData = adminService.orderListCount(search);

		// log.debug("totalData {}", totalData);

		mv.addObject("pageBar",
				AdminPageFactory.getPage(cPage, numPerpage, totalData, "order.do", searchType, searchKeyword));

		mv.addObject("searchType", searchType);
		mv.addObject("searchKeyword", searchKeyword);

		mv.setViewName("mypage/orderList");

		return mv;
	}

	// orderList 주문상세보기 ajax
	@ResponseBody
	@RequestMapping("/mypage/order/read.do")
	public OrderSheet readOrderSheet(@RequestParam(value = "orderSheetNo") int orderSheetNo) {
		return adminService.selectOrderSheet(orderSheetNo);
	}

	// 반품/취소 신청 페이지 연결
	@RequestMapping("/refund/write.do")
	public ModelAndView writeRefund(ModelAndView mv, String state, int orderSheetNo, int orderDetailNo) {
		OrderSheet orderSheet = adminService.selectOrderSheet(orderSheetNo);

		List<OrderDetail> orderDetails = orderSheet.getDetails();

		OrderDetail orderDetail = null;
		for (OrderDetail o : orderDetails) {
			if (o.getOrderDetailNo() == orderDetailNo) {
				orderDetail = o;
				break;
			}
		}
		if (orderDetail != null) {
			mv.addObject("orderDetail", orderDetail);
		}
		mv.addObject("orderSheet", orderSheet);
		mv.addObject("state", state);
		mv.setViewName("refund/writeRefund");

		return mv;
	}

	// 반품취소신청 완료
	@RequestMapping("/refund/writeEnd.do")
	public ModelAndView writeRefundEnd(ModelAndView mv, Refund refund) {

		log.debug("refund {}", refund);

		String msg = "";
		String script = "opener.parent.location.reload();window.close();";
		try {
			service.insertRefund(refund);
			msg = refund.getRefundState() + "신청이 완료되었습니다.";
		} catch (RuntimeException e) {
			e.printStackTrace();
			msg = refund.getRefundState() + "신청 실패!";
		}

		mv.addObject("msg", msg);
		mv.addObject("script", script);
		mv.setViewName("common/msg");

		return mv;
	}

	// refund 리스트 출력
	@RequestMapping("/mypage/refund.do")
	public ModelAndView refundList(ModelAndView mv, @RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerpage", defaultValue = "7") int numPerpage,
			@RequestParam(value = "searchType", defaultValue = "SEARCH_ALL") String searchType,
			@RequestParam(value = "searchKeyword", defaultValue = "searchAll") String searchKeyword,
			@RequestParam(value = "orderDetailNo", required = false) Integer orderDetailNo) {

		Map search = new HashMap();
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Member loginMember = (Member) authentication.getPrincipal();
		search.put("memberNo", loginMember.getMemberNo());
		search.put("searchType", searchType);
		// 추가
		search.put("orderDetailNo", orderDetailNo);
		if (searchType.equals("ORDER_SHEET_ENROLL_DATE")) {
			String[] keys = searchKeyword.split("~");
			String key1 = keys[0].trim();
			String key2 = keys[1].trim();
			search.put("searchKeyword1", key1);
			search.put("searchKeyword2", key2);

		} else {
			search.put("searchKeyword", searchKeyword);
		}

		mv.addObject("orderDetailRefunds", service.selectOrderDetailRefundList(cPage, numPerpage, search));

		int totalData = service.selectOrderDetailRefundListCount(search);
		mv.addObject("pageBar",
				AdminPageFactory.getPage(cPage, numPerpage, totalData, "refund.do", searchType, searchKeyword));
		mv.addObject("searchType", searchType);
		mv.addObject("searchKeyword", searchKeyword);

		mv.setViewName("mypage/refundList");
		return mv;
	}

	// 회원탈퇴 페이지 연결
	@RequestMapping("/mypage/quit.do")
	public String quitPage() {
		return "mypage/quitPage";
	}

	@RequestMapping("/mypage/test.do")
	public String zzz(@RequestParam(value = "productNo") int[] test) {

		log.debug(Arrays.toString(test));

		return "mypage/cartList";
	}
}
