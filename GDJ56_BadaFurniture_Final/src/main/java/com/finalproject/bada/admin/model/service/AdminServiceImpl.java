package com.finalproject.bada.admin.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.bada.admin.model.dao.AdminDao;
import com.finalproject.bada.product.model.vo.FileProduct;
import com.finalproject.bada.product.model.vo.Product;

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


	
	
	
	
	
}
