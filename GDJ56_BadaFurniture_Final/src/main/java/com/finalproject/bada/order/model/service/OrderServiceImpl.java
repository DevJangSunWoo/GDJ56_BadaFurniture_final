package com.finalproject.bada.order.model.service;

//import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.finalproject.bada.common.AlertFactory;
import com.finalproject.bada.mypage.model.dao.MypageDao;
import com.finalproject.bada.mypage.model.vo.Alert;
import com.finalproject.bada.order.model.dao.OrderDao;
import com.finalproject.bada.order.model.vo.OrderDetail;
import com.finalproject.bada.order.model.vo.OrderSheet;
import com.finalproject.bada.product.model.vo.Product;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderDao dao;
	private SqlSessionTemplate session;
	private MypageDao mypageDao;
	public OrderServiceImpl(OrderDao dao, SqlSessionTemplate session, MypageDao mypageDao) {
		super();
		this.dao = dao;
		this.session = session;
		this.mypageDao = mypageDao;
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
		
		//1차시도			
//		int orderDetailCount=dao.selectOrderDetailCount(session,map);			
//		if(orderDetailCount<10) {
//		int detailResult=dao.insertOrderDetail(session,map);
//		}else {				
//			throw new RuntimeException(" detail 저장 실패");
//		}
		
	
		int seqOrderSheet=(int)map.get("seqOrderSheet");
		
		//log.debug("{}","인서트 전"+seqOrderSheet);
		int result=dao.insertOrderSheet(session,map);
		//map.get("seqOrderSheet")  으로 해야지  변화된 데이터가 나옴
		//log.debug("{}","인서트 후"+map.get("seqOrderSheet")); 
		
		
		
		if(result>0) {
			result = 0;
			
			int[] productNos = (int[])map.get("productNos");
			
			//for문을 도는 순간 여기서  배열을   일반 int형 데이터가 됨
			for(int productNo : productNos) {
				
				map.put("proudctNo",productNo);
				result += dao.insertOrderDetail(session, map);//
			}
			
			int productCount = productNos.length;
			if(result != productCount) {
				throw new RuntimeException("OrderDetail이 갯수 만큼 삽입이 안됬습니다.");
			}

			
			//제품 SoldOutState 상태변화
			int  resultSoldOutState =dao.updateSoldOutState(session,map);
			
				if(resultSoldOutState<=0) {
					throw new RuntimeException(" 제품 SoldOutState 변화 실패");
					
				}
			
			//제품결제시  결제한 제품들 카트에서 삭제하기	
			//장바구니에서  결제하려는 제품이 없을시에대한 분기처리해야함 예를들어 바로구매
			//장바구니에 있든 없든 productNo 배열이 넘어간다.
			//→selectCartCountNo 를 이용하여 내가 장바구니에서 선택한 개수를 만든다.
			//그리고 내가 삭제구문시 반환되는 숫자 resultCartDelete
			//resultCartDelete 와  selectCartCountNo 가 일치하지 않을시 runtime exception 발동 시키기
				
				
			int	selectCartCountNo=dao.selectCartCount(session,map);
				
				
			int resultCartDelete=dao.deleteMemberCart(session,map);	
				
			if(resultCartDelete!=selectCartCountNo) {
				throw new RuntimeException(" 장바구니 제품 삭제 실패");
				
			}
				
							
			
		}else {
			
			throw new RuntimeException("OrderSheet 저장실패");
		}
		
		
		
	}
	@Override
	public List<OrderSheet> selectOrderComplete(int orderSheetNo) {
		// TODO Auto-generated method stub
		return dao.selectOrderComplete(session,orderSheetNo);
	}
	
	
	
	@Override
	public List<OrderSheet> selectOrderSheetUndepositedList() {
		// TODO Auto-generated method stub
		return dao.selectOrderSheetUndepositedList(session);
	}
	
	
	
	
	
	
	
	@Override
	public List<OrderDetail> selectOrderDetailCancelCompleted() {
		// TODO Auto-generated method stub
		return dao.selectOrderDetailCancelCompleted(session);
	}
	
	
	@Override
	public void updateUndeposited(String contextPath) {
		
		
		
		//애초에 db에서 가져올떄	 애초에 가져올떄도 계좌이체로 계산했고 결제상태가 입금대기상태인 것들은 가져오면된다.-> 즉 오늘날짜로부터 -3일인데도 아직까지 입금대기상태이고 계좌이체로 결제한  녀석들을가져온면된다.
		//list가 null 일떄 처리해야함   -> 예외처리?  OR COUNT ? 어떻게 해야하지-> 애초에 If문 씌이면 되는구나
		List<OrderSheet> orderSheetList=selectOrderSheetUndepositedList();
		//log.debug("테테스트{}", list);
		
		HashMap param=new HashMap();
		
		param.put("orderSheets", orderSheetList);
		
		
		
		if(orderSheetList!=null&& orderSheetList.size()>0) {

				
			
			int resultOrderSheetUndeposited= dao.updateOrderSheetUndeposited(session,param);	
			 
			 if(resultOrderSheetUndeposited>0) {
				 log.debug("{}"," 주문서 미입금상태 변경 성공");	
				
			
				 int resultUpdateOrderDetailRefundState=dao.updateOrderDetailRefundState(session,param);
				 
				 
				 
				 if(resultUpdateOrderDetailRefundState>0) {
					 log.debug("{}","주문상세 Refund_state 변경 성공");	
					    List<OrderDetail> orderDetailList=selectOrderDetailCancelCompleted();
					    
					    param.put("orderDetails", orderDetailList);
					    
					    if(orderDetailList!=null&& orderDetailList.size()>0) {					    	
					    	int  resultRefund=0;
					    	 
					    	for(OrderDetail od : orderDetailList ) {					    		
					    		int orderDetailNo=od.getOrderDetailNo();
					    		resultRefund += dao.insertRefund(session,orderDetailNo);
					    	}
					    	
					    		
					    	if( resultRefund !=orderDetailList.size()) {
					    		throw new RuntimeException("REFUND가 갯수 만큼 삽입이 안됬습니다.");
					    		
					    	}else {
					    		
					    		log.debug("{}" ,"REFUND 테이블에  갯수 만큼 삽입 성공" );
					    		
					    		int productUpdateResult=dao.updateRefundProductSoldOutState(session,param);
					    	
					    	
					    		if(productUpdateResult>0) {
					    			int resultUndeposited = 0; 
					    			log.debug("{}" ,"제품 판매상태 변경 선공" );
					    			if(orderSheetList.size() > 0) {
						    			for(OrderSheet os : orderSheetList) {
						    				log.debug("orderList 길이 : {}", orderSheetList.size());
						    				String alertMsg = AlertFactory.getAlertMsg(contextPath, "undeposited", os);
						    				log.debug("알림메시지 : {}", alertMsg);
						    				resultUndeposited += mypageDao.insertAlert(session, Alert.builder().memberNo(os.getMember().getMemberNo()).detail(alertMsg).build());
						    				log.debug("resultUndeposited : {}", resultUndeposited);
						    				if(resultUndeposited>0) {
						    					log.debug("{}","알림 삽입 성공");
						    				}else {
						    					new RuntimeException("알림 실패");
						    				}
						    				
						    			}
						    			if(resultUndeposited < orderSheetList.size()) {
						    				new RuntimeException("미입금자 알림 입력 실패");
						    			}
					    			}
					    		}else {
					    			
					    			throw new RuntimeException("제품 판매상태  변경 실패 ");
					    		}
					    	}
					    }					 
										 
				 }else {
					 throw new RuntimeException("주문상세 Refund_state 변경 실패 ");
				 }
			 }else {
				 
				 throw new RuntimeException("주문서 미입금 상태로 변경 실패 ");				 
			 }
			
		
			}		
		
		
		
		
		 List <Product> listProductShowState  = dao.selectProductListShowState(session);
		
		 
//		 for(Product  p :  listProductShowState) {
//		 log.debug("{}","listProductShowState의 값:"+p);
//		 }
		 
		 
		 param.put("listShowState", listProductShowState);
		 if(listProductShowState.size()>0) {
		 int updateShowStateResult=dao.updateProductShowState(session,param);		 
			 if(updateShowStateResult == listProductShowState.size()) {//10개면  10개가  다되야 변경한거니까
				 log.debug("{}","제품 공개상태 변경 성공");				 
			 }else {
				 throw new RuntimeException("제품 공개상태 변경 실패 ");			
			 }
		 }
		
		 
		
	}	
}