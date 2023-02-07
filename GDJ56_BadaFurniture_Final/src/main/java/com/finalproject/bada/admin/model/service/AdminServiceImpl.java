package com.finalproject.bada.admin.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.finalproject.bada.admin.model.dao.AdminDao;
import com.finalproject.bada.common.AlertFactory;
import com.finalproject.bada.mypage.model.dao.MypageDao;
import com.finalproject.bada.mypage.model.vo.Alert;
import com.finalproject.bada.order.model.vo.OrderDetail;
import com.finalproject.bada.order.model.vo.OrderSheet;
import com.finalproject.bada.product.model.vo.FileProduct;
import com.finalproject.bada.product.model.vo.Product;
import com.finalproject.bada.refund.model.vo.Refund;
import com.finalproject.bada.resell.model.vo.Resell;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AdminServiceImpl implements AdminService {

	private AdminDao dao;
	private SqlSessionTemplate session;
	private MypageDao mypageDao;
	
	@Autowired
	public AdminServiceImpl(AdminDao dao, SqlSessionTemplate session, MypageDao mypageDao) {
		super();
		this.dao = dao;
		this.session = session;
		this.mypageDao = mypageDao;
	}
	
	//대시보드 - 요약
	@Override
	public Map<String, Integer> dashBoardSummary() {
		// TODO Auto-generated method stub
		return dao.dashBoardSummary(session);
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
	public Map<String,Integer> productSummary() {
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
	
	//가구 관리 - 수정하기
	@Override
	@Transactional
	public void updateProduct(Product p) {
		// TODO Auto-generated method stub
		int result= dao.updateProduct(session,p);
		if(result<0) {
			throw new RuntimeException("가구번호 "+p.getProductNo()+" 수정에 실패했습니다.");
		}
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
	public Map<String, Integer> resellSummary() {
		// TODO Auto-generated method stub
		return dao.resellSummary(session);
	}
	
	
	//내가구팔기 관리 - 진행상태 변경
	//[BD] 알림기능 추가
	@Override
	@Transactional
	public int updateProgressState(Map param, HttpSession httpSession) {
		int result =  dao.updateProgressState(session,param);
		if(result > 0) {
			String progressState = (String)param.get("progressState");
			if(progressState.equals("수정요청") || progressState.equals("승인완료")||progressState.equals("승인거부")) {
				Resell resell = (Resell)param.get("resell");
				log.debug("리쏄! : {}", resell);
				resell.setProgressState(progressState);
				String alertMsg = AlertFactory.getAlertMsg(httpSession.getServletContext().getContextPath(), "progressState", resell);
				log.debug("alertMsg : {}" , alertMsg);
				result = 0;
				result = mypageDao.insertAlert(session, Alert.builder().memberNo(resell.getMember().getMemberNo()).detail(alertMsg).build());
				if(result <= 0) {
					throw new RuntimeException("알림 등록 실패");
				}
			}
		}
		else {
			throw new RuntimeException("내 가구 팔기 진행상태 수정 실패");
		}
		return result;
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
				log.debug("ㅎㅇ : {}",dao.orderDetailList(session, os.getOrderSheetNo()));
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
	public Map<String, Integer> orderSummary() {
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
	
	
	//취소반품관리 - 조회
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
	
	//취소반품관리 - 요약
	@Override
	public Map<String, Integer> refundSummary() {
		// TODO Auto-generated method stub
		return dao.refundSummary(session);
	}

	//취소반품관리 - 취소반품상태 변경
	//[BD] 알림기능 추가
	@Override
	@Transactional
	public void updateRefundState(Map param, HttpSession httpSession) {
		// TODO Auto-generated method stub
		int result=dao.updateRefundState(session,param);
		
		if(result > 0 && (param.get("refundState").equals("반품완료") ||param.get("refundState").equals("취소완료"))) {			
			result+=dao.updateSoldOutStateAfterRefund(session,param);		
			if(result<2) {
				throw new RuntimeException("취소/반품상태 변경에 실패했습니다.");					
			}		
		} else {
			if(result<1) {
				throw new RuntimeException("취소/반품상태 변경에 실패했습니다.2");				
			}
		}		
		//알림 설정
		String refundState = (String)param.get("refundState");
		//log.debug(refundState);
		if(refundState.equals("반품대기") || refundState.equals("반품완료") || refundState.equals("반품거부")
				|| refundState.equals("취소완료") || refundState.equals("취소거부")) {
			OrderDetail orderDetail = mypageDao.selectOrderDetailRefundOne(session, param);
			String alertMsg = AlertFactory.getAlertMsg(httpSession.getServletContext().getContextPath(), "refundState", orderDetail);
			result = 0;
			result = mypageDao.insertAlert(session, Alert.builder().memberNo(orderDetail.getOrderSheet().getMember().getMemberNo()).detail(alertMsg).build());
			if(result <= 0) {
				throw new RuntimeException("알림 등록 실패");
			}
		}
		
	}

	//취소반품관리 - 취소반품 상세조회
	@Override
	public Refund viewRefundDetail(int orderDetailNo) {
		// TODO Auto-generated method stub
		return dao.viewRefundDetail(session,orderDetailNo);
	}

	//배송관리 - 조회
	@Override
	public List<OrderDetail> deliveryListPage(Map<String, Integer> param, Map search) {
		// TODO Auto-generated method stub
		return dao.deliveryListPage(session, param, search);
	}

	@Override
	public int deliveryListCount(Map search) {
		// TODO Auto-generated method stub
		return dao.deliveryListCount(session,search);
	}
	
	//배송관리 - 요약
	@Override
	public Map<String, Integer> deliverySummary() {
		// TODO Auto-generated method stub
		return dao.deliverySummary(session);
	}

	//배송관리 - 배송상태 변경
	@Override
	@Transactional
	public void updateDeliveryState(Map param) {
		// TODO Auto-generated method stub
		int result=dao.updateDeliveryState(session,param);
		if(result<0) {
			throw new RuntimeException("배송상태 변경에 실패했습니다.");
		}
	}

	
	//대시보드 - 차트 - 상품별 주문수요
	@Override
	public Map chartDemand() {
		// TODO Auto-generated method stub
		return dao.chartDemand(session);
	}

	
	//대시보드 - chartJs - 내가구팔기 가구비율
	@Override
	public Map chartResell() {
		// TODO Auto-generated method stub
		return dao.chartResell(session);
	}

	//대시보드 - chartJs - 일일 주문,매출액
	@Override
	public Map chartOrders() {
		// TODO Auto-generated method stub
		return dao.chartOrders(session);
	}
	@Override
	public Map chartSales() {
		// TODO Auto-generated method stub
		return dao.chartSales(session);
	}
	


	
	/////////////////////////////////////
	//취소반품관리 - 아임포트 토큰 받아오기
	public String getToken() throws IOException {
		 
		HttpsURLConnection conn = null;

		URL url = new URL("https://api.iamport.kr/users/getToken");

		conn = (HttpsURLConnection) url.openConnection();

		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
		conn.setDoOutput(true);
		JsonObject json = new JsonObject();

		json.addProperty("imp_key", "8361161254308658");
		json.addProperty("imp_secret", "Defk61fQjnfQ8MxXOO10ucVQ9vhSfVJqRNdEmBDqeMY9gSidzvwVg1jnUF10RKluNEZBLv3oPbEJ97rh");
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		
		bw.write(json.toString());
		bw.flush();
		bw.close();

		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));

		Gson gson = new Gson();

		String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();
		
		//System.out.println(response);

		String token = gson.fromJson(response, Map.class).get("access_token").toString();

		br.close();
		conn.disconnect();

		return token;
	}
	
	
	
	
}
