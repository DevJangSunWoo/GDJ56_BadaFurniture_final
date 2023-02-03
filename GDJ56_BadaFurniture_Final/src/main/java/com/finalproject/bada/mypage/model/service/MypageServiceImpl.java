package com.finalproject.bada.mypage.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.finalproject.bada.mypage.model.dao.MypageDao;
import com.finalproject.bada.mypage.model.vo.Alert;
import com.finalproject.bada.order.model.vo.OrderDetail;
import com.finalproject.bada.product.model.vo.Product;
import com.finalproject.bada.refund.model.vo.Refund;

@Service
public class MypageServiceImpl implements MypageService {
	
	private MypageDao dao;
	private SqlSessionTemplate session;
	
	@Autowired
	public MypageServiceImpl(MypageDao dao, SqlSessionTemplate session) {
		super();
		this.dao = dao;
		this.session = session;
	}
 

	@Override
	public List<Product> selectCartProduct(int memberNo) {
		return dao.selectCartProduct(session, memberNo);
	}

	@Override
	public int deleteCart(Map param) {
		return dao.deleteCart(session, param);
	}


	@Override
	public List<Alert> selectAlertList(int memberNo, int cPage, int numPerpage) {
		return dao.selectAlertList(session, memberNo, cPage, numPerpage);
	}


	@Override
	public int selectAlertCount(int memberNo) {
		return dao.selectAlertCount(session, memberNo);
	}


	@Override
	public int deleteAlert(List<Integer> alertNos) {
		return dao.deleteAlert(session, alertNos);
	}


	@Override
	public int updateAlertReadState(int memberNo) {
		return dao.updateAlertReadState(session, memberNo);
	}
	
	@Override
	public int selectAlertCountReadStateN(int memberNo) {
		return dao.selectAlertCountReadStateN(session, memberNo);
	}

	@Override
	@Transactional
	public void insertRefund(Refund refund) {
		
		//refund insert
		int result = dao.insertRefund(session, refund);
		
		//orderSheet의 refundState를 변경해줘야 한다.
		if(result > 0) {
			Map param = new HashMap();
			param.put("orderDetailNo", refund.getOrderDetailNo());
			param.put("refundState", refund.getRefundState().equals("취소")?"취소요청":"반품요청");
			result = 0;
			result = dao.updateOrderDetailRefundState(session, param);
			if(result < 1) {
				throw new RuntimeException("OrderDetail refundState 변경 실패");
			}
		} else {
			throw new RuntimeException("Refund 입력 실패");
		}
		
	}

	@Override
	public List<OrderDetail> selectOrderDetailRefundList(int cPage, int numPerpage, Map search) {
		return dao.selectOrderDetailRefundList(session, cPage, numPerpage, search);
	}


	@Override
	public int selectOrderDetailRefundListCount(Map search) {
		return dao.selectOrderDetailRefundListCount(session, search);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
