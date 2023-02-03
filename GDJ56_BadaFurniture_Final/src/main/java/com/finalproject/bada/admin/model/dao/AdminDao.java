package com.finalproject.bada.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.finalproject.bada.order.model.vo.OrderDetail;
import com.finalproject.bada.order.model.vo.OrderSheet;
import com.finalproject.bada.product.model.vo.FileProduct;
import com.finalproject.bada.product.model.vo.Product;
import com.finalproject.bada.refund.model.vo.Refund;
import com.finalproject.bada.resell.model.vo.Resell;

public interface AdminDao {

	//대시보드 - 요약
	Map<String,Integer> dashBoardSummary(SqlSessionTemplate session);
	
	//가구 올리기
	int insertProduct(SqlSessionTemplate session,Product product);
	int insertFileProduct(SqlSessionTemplate session,FileProduct f);
	
	//가구관리 - 조회
	List<Product> productList(SqlSessionTemplate session);
	List<Product> productListPage(SqlSessionTemplate session,Map<String,Integer> param,Map search);
	int productListCount(SqlSessionTemplate session,Map search);
	
	//가구관리 - 요약테이블
	Map<String,Integer> productSummary(SqlSessionTemplate session);
	
	//가구관리 - 삭제
	int deleteProduct(SqlSessionTemplate session,Map param);
	List<FileProduct> selectFileList(SqlSessionTemplate session,Map param);
	
	//가구 관리 - 판매상태 변경
	int updateSoldOutState(SqlSessionTemplate session,Map param);
	
	//가구 관리 - 공개상태 변경
	int updateShowState(SqlSessionTemplate session,Map param);
	
	//가구 관리 - 수정하기 연결 - productNo로 정보 가져오기
	Product selectProductByProductNo(SqlSessionTemplate session,int productNo);
	
	//가구 관리 - 수정하기
	int updateProduct(SqlSessionTemplate session,Product p);	
	
	//내가구팔기 관리 - 조회
	List<Resell> resellListPage(SqlSessionTemplate session,Map<String,Integer> param,Map search);
	int resellListCount(SqlSessionTemplate session,Map search);
	
	List<OrderDetail> orderDetailList(SqlSessionTemplate session,int orderSheetNo);	
	
	//내가구팔기 관리 - 요약
	Map<String,Integer> resellSummary(SqlSessionTemplate session);
	
	
	//내가구팔기 관리 - 진행상태 변경
	int updateProgressState(SqlSessionTemplate session,Map param);
	
	//주문관리 - 조회
	List<OrderSheet> orderListPage(SqlSessionTemplate session,Map<String,Integer> param,Map search);
	int orderListCount(SqlSessionTemplate session,Map search);
	
	//주문관리 - 요약
	Map<String,Integer> orderSummary(SqlSessionTemplate session);
	
	//주문관리 - 결제상태 변경
	int updatePaymentState(SqlSessionTemplate session,Map param);
	int updateSoldOutStateAtOrder(SqlSessionTemplate session,Map param2);
	
	//BD
	//주문관리 - 주문서 번호로 주문서 1개 가져오기
	OrderSheet selectOrderSheet(SqlSessionTemplate session, int orderSheetNo);
	
	//취소반품관리 - 조회
	List<OrderDetail> refundListPage(SqlSessionTemplate session,Map<String,Integer> param,Map search);
	int refundListCount(SqlSessionTemplate session,Map search);
	
	//취소반품관리 - 요약
	Map<String,Integer> refundSummary(SqlSessionTemplate session);	
	
	//취소반품관리 - 취소반품상태 변경
	int updateRefundState(SqlSessionTemplate session,Map param);
	int updateSoldOutStateAfterRefund(SqlSessionTemplate session,Map param);
	
	//취소반품관리 - 취소반품 상세조회
	Refund viewRefundDetail(SqlSessionTemplate session,int orderDetailNo);
	
	//배송관리 - 조회
	List<OrderDetail> deliveryListPage(SqlSessionTemplate session,Map<String,Integer> param,Map search);
	int deliveryListCount(SqlSessionTemplate session,Map search);
	
	//배송관리 - 요약
	Map<String,Integer> deliverySummary(SqlSessionTemplate session);
	
	//배송관리 - 배송상태 변경
	int updateDeliveryState(SqlSessionTemplate session,Map param);
	
	//대시보드 - 차트 - 상품별 주문수요
	Map chartDemand(SqlSessionTemplate session);
	
	//대시보드 - chartJs - 내가구팔기 가구비율
	Map chartResell(SqlSessionTemplate session);
	
	//대시보드 - chartJs - 일일 주문,매출액
	Map chartOrders(SqlSessionTemplate session);
	Map chartSales(SqlSessionTemplate session);
	
	
}
