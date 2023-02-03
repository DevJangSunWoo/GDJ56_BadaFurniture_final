package com.finalproject.bada.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalproject.bada.admin.model.service.AdminServiceImpl;
import com.finalproject.bada.order.model.vo.OrderDetail;
import com.finalproject.bada.order.model.vo.OrderSheet;
import com.finalproject.bada.product.model.vo.FileProduct;
import com.finalproject.bada.product.model.vo.Product;
import com.finalproject.bada.refund.model.vo.Refund;
import com.finalproject.bada.resell.model.vo.Resell;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class AdminDaoImpl implements AdminDao {
		
	//대시보드 - 요약
	@Override
	public Map<String, Integer> dashBoardSummary(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.dashBoardSummary");
	}
	
	//가구 올리기
	@Override
	public int insertProduct(SqlSessionTemplate session, Product product) {
		// TODO Auto-generated method stub
		return session.insert("admin.insertProduct",product);
	}

	@Override
	public int insertFileProduct(SqlSessionTemplate session, FileProduct f) {
		// TODO Auto-generated method stub
		return session.insert("admin.insertFileProduct",f);
	}
	
	//가구 관리 - 조회
	@Override
	public List<Product> productList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("admin.productList");
	}

	@Override
	public List<Product> productListPage(SqlSessionTemplate session, Map<String,Integer> param,Map search) {
		// TODO Auto-generated method stub
		//log.debug("paging ? {}",(param.get("cPage")-1)*param.get("numPerpage"));
		return session.selectList("admin.productList",search,
				new RowBounds((param.get("cPage")-1)*param.get("numPerpage"),param.get("numPerpage")));
	}

	@Override
	public int productListCount(SqlSessionTemplate session,Map search) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.productListCount",search);
	}

	//요약테이블
	@Override
	public Map<String,Integer> productSummary(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.productSummary");
	}

	//가구관리 - 삭제
	@Override
	public int deleteProduct(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.delete("admin.deleteProduct",param);
	}

	@Override
	public List<FileProduct> selectFileList(SqlSessionTemplate session,Map param) {
		// TODO Auto-generated method stub
		return session.selectList("admin.selectFileList",param);
	}
	
	//가구 관리 - 판매상태 변경
	@Override
	public int updateSoldOutState(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.update("admin.updateSoldOutState",param);
	}

	//가구 관리 - 공개상태 변경
	@Override
	public int updateShowState(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.update("admin.updateShowState",param);
	}

	//가구 관리 - 수정하기 연결 - productNo로 정보 가져오기
	@Override
	public Product selectProductByProductNo(SqlSessionTemplate session, int productNo) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.selectProductByProductNo",productNo);
	}
	
	//가구 관리 - 수정하기
	@Override
	public int updateProduct(SqlSessionTemplate session, Product p) {
		// TODO Auto-generated method stub
		return session.update("admin.updateProduct",p);
	}
	
	//내가구팔기 관리 - 조회
	@Override
	public List<Resell> resellListPage(SqlSessionTemplate session, Map<String, Integer> param, Map search) {
		// TODO Auto-generated method stub
		return session.selectList("admin.resellList",search,
				new RowBounds((param.get("cPage")-1)*param.get("numPerpage"),param.get("numPerpage")));
	}

	@Override
	public int resellListCount(SqlSessionTemplate session, Map search) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.resellListCount",search);
	}
	
	//내가구팔기 관리 - 요약
	@Override
	public Map<String, Integer> resellSummary(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.resellSummary");
	}

	//내가구팔기 관리 - 진행상태 변경
	@Override
	public int updateProgressState(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.update("admin.updateProgressState",param);
	}
	
	//주문관리 - 조회
	//orderSheet
	@Override
	public List<OrderSheet> orderListPage(SqlSessionTemplate session, Map<String, Integer> param, Map search) {		
		return session.selectList("admin.orderList",search
				,new RowBounds((param.get("cPage")-1)*param.get("numPerpage"),param.get("numPerpage")));		
	}	
	//orderDetail
	@Override
	public List<OrderDetail> orderDetailList(SqlSessionTemplate session, int orderSheetNo) {
		// TODO Auto-generated method stub
		return session.selectList("admin.orderDetailList",orderSheetNo);
	}

	@Override
	public int orderListCount(SqlSessionTemplate session, Map search) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.orderListCount",search);
	}
	
	//주문관리 - 요약
	@Override
	public Map<String, Integer> orderSummary(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.orderSummary");
	}

	//주문관리- 결제상태 변경
	@Override
	public int updatePaymentState(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.update("admin.updatePaymentState",param);
	}

	@Override
	public int updateSoldOutStateAtOrder(SqlSessionTemplate session, Map param2) {
		// TODO Auto-generated method stub
		return session.update("admin.updateSoldOutStateAtOrder",param2);
	}

	//BD
	//주문관리 - 주문서 번호로 주문서 1개 가져오기
	@Override
	public OrderSheet selectOrderSheet(SqlSessionTemplate session, int orderSheetNo) {
		return session.selectOne("admin.selectOrderSheet", orderSheetNo);
	}
	
	//취소반품관리 - 조회
	@Override
	public List<OrderDetail> refundListPage(SqlSessionTemplate session, Map<String, Integer> param, Map search) {
		// TODO Auto-generated method stub
		return session.selectList("admin.refundList",search
				,new RowBounds((param.get("cPage")-1)*param.get("numPerpage"),param.get("numPerpage")));		

	}

	@Override
	public int refundListCount(SqlSessionTemplate session,Map search) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.refundListCount",search);
	}
	
	//취소반품관리 - 요약
	@Override
	public Map<String, Integer> refundSummary(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.refundSummary");
	}
	
	//취소반품관리 - 취소반품상태 변경
	@Override
	public int updateRefundState(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.update("admin.updateRefundState",param);
	}
	
	@Override
	public int updateSoldOutStateAfterRefund(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.update("admin.updateSoldOutStateAfterRefund",param);
	}
	
	
	//취소반품관리 - 취소반품 상세조회
	@Override
	public Refund viewRefundDetail(SqlSessionTemplate session, int orderDetailNo) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.viewRefundDetail",orderDetailNo);
	}
	
	//배송관리 - 조회
	@Override
	public List<OrderDetail> deliveryListPage(SqlSessionTemplate session, Map<String, Integer> param, Map search) {
		// TODO Auto-generated method stub
		return session.selectList("admin.deliveryList",search,
				new RowBounds((param.get("cPage")-1)*param.get("numPerpage"),param.get("numPerpage")));
	}

	@Override
	public int deliveryListCount(SqlSessionTemplate session,Map search) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.deliveryListCount",search);
	}
	
	//배송관리 - 요약
	@Override
	public Map<String, Integer> deliverySummary(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.deliverySummary");
	}
	
	//배송관리 - 배송상태 변경
	@Override
	public int updateDeliveryState(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.update("admin.updateDeliveryState",param);
	}

	//대시보드 - 차트 - 상품별 주문수요
	@Override
	public Map chartDemand(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.chartDemand");
	}

	//대시보드 - chartJs - 내가구팔기 가구비율
	@Override
	public Map chartResell(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.chartResell");
	}
	
	//대시보드 - chartJs - 일일 주문,매출액
	@Override
	public Map chartOrders(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.chartOrders");
	}
	@Override
	public Map chartSales(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.chartSales");
	}


	
	

}
