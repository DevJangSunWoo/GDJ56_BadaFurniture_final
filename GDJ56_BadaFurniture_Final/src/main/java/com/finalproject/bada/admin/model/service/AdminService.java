package com.finalproject.bada.admin.model.service;

import java.util.List;
import java.util.Map;

import com.finalproject.bada.order.model.vo.OrderDetail;
import com.finalproject.bada.order.model.vo.OrderSheet;
import com.finalproject.bada.product.model.vo.FileProduct;
import com.finalproject.bada.product.model.vo.Product;
import com.finalproject.bada.refund.model.vo.Refund;
import com.finalproject.bada.resell.model.vo.Resell;

public interface AdminService {
	
	//가구 올리기
	int insertProduct(Product product);
	
	//가구관리 - 조회
	List<Product> productList();
	List<Product> productListPage(Map<String,Integer> param,Map search);
	int productListCount(Map search);
	
	//가구관리 - 요약테이블
	Map<String,Integer> productSummary();
	
	//가구관리 - 삭제
	int deleteProduct(Map param);
	List<FileProduct> selectFileList(Map param);
	
	//가구 관리 - 판매상태 변경
	int updateSoldOutState(Map param);
	
	//가구 관리 - 공개상태 변경
	int updateShowState(Map param);
	
	//가구 관리 - 수정하기 연결 - productNo로 정보 가져오기
	Product selectProductByProductNo(int productNo);
	
	//내가구팔기 관리 - 조회
	List<Resell> resellListPage(Map<String,Integer> param,Map search);
	int resellListCount(Map search);
	
	//내가구팔기 관리 - 요약
	Map<String,Integer> resellSummary();
	
	//내가구팔기 관리 - 진행상태 변경
	int updateProgressState(Map param);	
	
	//주문관리 - 조회
	List<OrderSheet> orderListPage(Map<String,Integer> param,Map search);
	int orderListCount(Map search);
	
	//주문관리 - 요약
	Map<String,Integer> orderSummary();
	
	//주문관리 - 결제상태 변경
	void updatePaymentState(Map param);
	
	//BD
	//주문관리 - 주문서 번호로 주문서 1개 가져오기
	OrderSheet selectOrderSheet(int orderSheetNo);
	
	//취소반품관리 - 조회
	List<OrderDetail> refundListPage(Map<String,Integer> param,Map search);
	int refundListCount(Map search);
	
	//취소반품관리 - 요약
	Map<String,Integer> refundSummary();
	
	//취소반품관리 - 취소반품상태 변경
	void updateRefundState(Map param);
	
	//취소반품관리 - 취소반품 상세조회
	Refund viewRefundDetail(int orderDetailNo);
	
	//배송관리 - 조회
	List<OrderDetail> deliveryListPage(Map<String,Integer> param,Map search);
	int deliveryListCount(Map search);
	
	//배송관리 - 요약
	Map<String,Integer> deliverySummary();
	
	//배송관리 - 배송상태 변경
	void updateDeliveryState(Map param);
	
}
