package com.finalproject.bada.admin.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.finalproject.bada.admin.model.dao.AdminDao;
import com.finalproject.bada.order.model.vo.OrderDetail;
import com.finalproject.bada.order.model.vo.OrderSheet;
import com.finalproject.bada.product.model.vo.FileProduct;
import com.finalproject.bada.product.model.vo.Product;
import com.finalproject.bada.resell.model.vo.Resell;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AdminServiceImpl implements AdminService {

	private AdminDao dao;
	private SqlSessionTemplate session;
	
	@Autowired
	public AdminServiceImpl(AdminDao dao, SqlSessionTemplate session) {
		super();
		this.dao = dao;
		this.session = session;
	}
	
	//가구 올리기
	@Override
	public int insertProduct(Product product) {
		int result=dao.insertProduct(session,product);			
				
		if(result>0) {
			for(FileProduct f : product.getFiles()) {
				//f.setProductNo(product.getProductNo());
				f.setProductNo(product.getProductNo());
				result=dao.insertFileProduct(session,f);
			}
		}
		
		return result;
	}

	//가구관리 - 조회
	@Override
	public List<Product> productList() {
		
		List<Product> list=dao.productList(session);
		return list;
	}

	@Override
	public List<Product> productListPage(Map<String, Integer> param,Map search) {
		// TODO Auto-generated method stub
		return dao.productListPage(session,param,search);
	}

	@Override
	public int productListCount(Map search) {
		// TODO Auto-generated method stub
		return dao.productListCount(session,search);
	}

	//요약테이블
	@Override
	public List<Map<String,Integer>> productSummary() {
		// TODO Auto-generated method stub
		return dao.productSummary(session);
	}

	//가구관리 - 삭제
	@Override
	public int deleteProduct(Map param) {
		// TODO Auto-generated method stub
		return dao.deleteProduct(session,param);
	}
	
	@Override
	public List<FileProduct> selectFileList(Map param) {
		// TODO Auto-generated method stub
		return dao.selectFileList(session,param);
	}	
	
	
	//가구 관리 - 판매상태 변경
	@Override
	public int updateSoldOutState(Map param) {
		// TODO Auto-generated method stub
		return dao.updateSoldOutState(session,param);
	}
	
	//가구 관리 - 공개상태 변경
	@Override
	public int updateShowState(Map param) {
		// TODO Auto-generated method stub
		return dao.updateShowState(session,param);
	}

	//가구 관리 - 수정하기 연결 - productNo로 정보 가져오기
	@Override
	public Product selectProductByProductNo(int productNo) {
		// TODO Auto-generated method stub
		return dao.selectProductByProductNo(session,productNo);
	}
	
	
	//내가구팔기 관리 - 조회
	@Override
	public List<Resell> resellListPage(Map<String, Integer> param, Map search) {
		// TODO Auto-generated method stub
		return dao.resellListPage(session,param,search);
	}

	@Override
	public int resellListCount(Map search) {
		// TODO Auto-generated method stub
		return dao.resellListCount(session,search);
	}
	
	//내가구팔기 관리 - 요약
	@Override
	public List<Map<String, Integer>> resellSummary() {
		// TODO Auto-generated method stub
		return dao.resellSummary(session);
	}
	
	
	//내가구팔기 관리 - 진행상태 변경
	@Override
	public int updateProgressState(Map param) {
		// TODO Auto-generated method stub
		return dao.updateProgressState(session,param);
	}

	
	//주문관리 - 조회
	@Override
	public List<OrderSheet> orderListPage(Map<String, Integer> param, Map search) {
		// TODO Auto-generated method stub
		//return dao.orderListPage(session, param, search);
		
		List<OrderSheet> orderSheets = dao.orderListPage(session, param, search);
		
		if(orderSheets!=null) {
			for(OrderSheet os : orderSheets) {
				os.setDetails(dao.orderDetailList(session, os.getOrderSheetNo()));
				//log.debug("ㅎㅇ : {}",dao.orderDetailList(session, os.getOrderSheetNo()));
			}
		}
		
		return orderSheets;
	}

	@Override
	public int orderListCount(Map search) {
		// TODO Auto-generated method stub
		return dao.orderListCount(session, search);
	}
	
	//주문관리 - 요약
	@Override
	public List<Map<String, Integer>> orderSummary() {
		// TODO Auto-generated method stub
		return dao.orderSummary(session);
	}

	//주문관리- 결제상태 변경
	@Override
	@Transactional
	public void updatePaymentState(Map param) {
		// TODO Auto-generated method stub
		
		int result=dao.updatePaymentState(session,param);
		if(result>0) {
			result=0;
			result=dao.updateSoldOutStateAtOrder(session,param);
			
			if(result<((int[])param.get("productNoArr")).length) {
				throw new RuntimeException("가구 판매상태 변경 실패");				
			}
			
		}else {
			throw new RuntimeException("결제상태 변경 실패");
		}
		
	}

	//BD
	//주문관리 - 주문서 번호로 주문서 1개 가져오기
	@Override
	public OrderSheet selectOrderSheet(int orderSheetNo) {
		return dao.selectOrderSheet(session, orderSheetNo);
	}
	
	
	//취소/반품관리 - 조회
	@Override
	public List<OrderDetail> refundListPage(Map<String, Integer> param, Map search) {
		// TODO Auto-generated method stub
		return dao.refundListPage(session, param, search);
	}

	@Override
	public int refundListCount(Map search) {
		// TODO Auto-generated method stub
		return dao.refundListCount(session,search);
	}
	
	//취소/반품관리 - 요약
	@Override
	public List<Map<String, Integer>> refundSummary() {
		// TODO Auto-generated method stub
		return dao.refundSummary(session);
	}

	//취소반품관리 - 취소반품상태 변경
	@Override
	@Transactional
	public void updateRefundState(Map param) {
		// TODO Auto-generated method stub
		int result=dao.updateRefundState(session,param);
		if(result<0) {
			throw new RuntimeException("취소/반품상태 변경에 실패했습니다.");
		}
		
	}





	
	
	
	
	
}
