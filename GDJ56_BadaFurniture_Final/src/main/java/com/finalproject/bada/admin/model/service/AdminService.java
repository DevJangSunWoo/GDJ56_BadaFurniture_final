package com.finalproject.bada.admin.model.service;

import java.util.List;
import java.util.Map;

import com.finalproject.bada.product.model.vo.FileProduct;
import com.finalproject.bada.product.model.vo.Product;
import com.finalproject.bada.resell.model.vo.Resell;

public interface AdminService {
	
	//가구 올리기
	int insertProduct(Product product);
	
	//가구관리 - 조회
	List<Product> productList();
	List<Product> productListPage(Map<String,Integer> param,Map search);
	int productListCount(Map search);
	
	//가구관리 - 요약테이블
	List<Map<String,Integer>> productSummary();
	
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
	List<Map<String,Integer>> resellSummary();
	
	//내가구팔기 관리 - 진행상태 변경
	int updateProgressState(Map param);	
	
}
