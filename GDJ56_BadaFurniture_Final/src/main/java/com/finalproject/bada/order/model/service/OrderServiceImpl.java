package com.finalproject.bada.order.model.service;

//import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.finalproject.bada.order.model.dao.OrderDao;
import com.finalproject.bada.product.model.vo.Product;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderDao dao;
	private SqlSessionTemplate session;
	public OrderServiceImpl(OrderDao dao, SqlSessionTemplate session) {
		super();
		this.dao = dao;
		this.session = session;
	}
	@Override
	public Product selectOrderSheet(int productNo) {
		// TODO Auto-generated method stub
		
		return dao.selectOrderSheet(session,productNo);
	}
	@Override
	public List<Product> selectOrderSheetProductList(HashMap map) {
		// TODO Auto-generated method stub
		return dao.selectOrderSheetProductList(session,map);
	}
	
	
	@Override
	@Transactional
	public void insertOrderSheet(HashMap map) {
		int seqOrderSheet=(int)map.get("seqOrderSheet");
		
		log.debug("{}","인서트 전"+seqOrderSheet);
		int result=dao.insertOrderSheet(session,map);
		log.debug("{}","인서트 후"+seqOrderSheet); 
		
		
		
		if(result>0) {
			result = 0;
			
			int[] productNos = (int[])map.get("productNos");
			
			for(int productNo : productNos) {
				result += dao.insertOrderDetail(session, map);//
			}
			
			int productCount = productNos.length;
			if(result != productCount) {
				throw new RuntimeException("OrderDetail이 10개가 아닙니다.");
			}
			
//			int orderDetailCount=dao.selectOrderDetailCount(session,map);			
//			if(orderDetailCount<10) {
//			int detailResult=dao.insertOrderDetail(session,map);
//			}else {				
//				throw new RuntimeException(" detail 저장 실패");
//			}
			
			
			
		}else {
			
			throw new RuntimeException("OrderSheet 저장실패");
		}
		
		
		
	}
	
	
	
	
	
	
	
	
}
