package com.finalproject.bada.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.finalproject.bada.order.model.vo.OrderSheet;
import com.finalproject.bada.product.model.vo.FileProduct;
import com.finalproject.bada.product.model.vo.Product;
import com.finalproject.bada.resell.model.vo.Resell;

public interface AdminDao {
	
	//가구 올리기
	int insertProduct(SqlSessionTemplate session,Product product);
	int insertFileProduct(SqlSessionTemplate session,FileProduct f);
	
	//가구관리 - 조회
	List<Product> productList(SqlSessionTemplate session);
	List<Product> productListPage(SqlSessionTemplate session,Map<String,Integer> param,Map search);
	int productListCount(SqlSessionTemplate session,Map search);
	
	//가구관리 - 요약테이블
	List<Map<String,Integer>> productSummary(SqlSessionTemplate session);
	
	//가구관리 - 삭제
	int deleteProduct(SqlSessionTemplate session,Map param);
	List<FileProduct> selectFileList(SqlSessionTemplate session,Map param);
	
	//가구 관리 - 판매상태 변경
	int updateSoldOutState(SqlSessionTemplate session,Map param);
	
	//가구 관리 - 공개상태 변경
	int updateShowState(SqlSessionTemplate session,Map param);
	
	//가구 관리 - 수정하기 연결 - productNo로 정보 가져오기
	Product selectProductByProductNo(SqlSessionTemplate session,int productNo);
	
	
	//내가구팔기 관리 - 조회
	List<Resell> resellListPage(SqlSessionTemplate session,Map<String,Integer> param,Map search);
	int resellListCount(SqlSessionTemplate session,Map search);
	
	//내가구팔기 관리 - 요약
	List<Map<String,Integer>> resellSummary(SqlSessionTemplate session);
	
	
	//내가구팔기 관리 - 진행상태 변경
	int updateProgressState(SqlSessionTemplate session,Map param);
	
	//주문관리 - 조회
	List<OrderSheet> orderListPage(SqlSessionTemplate session,Map<String,Integer> param,Map search);
	int orderListCount(SqlSessionTemplate session,Map search);
	
	//주문관리 - 요약
	List<Map<String,Integer>> orderSummary(SqlSessionTemplate session);
	
	
	
}
