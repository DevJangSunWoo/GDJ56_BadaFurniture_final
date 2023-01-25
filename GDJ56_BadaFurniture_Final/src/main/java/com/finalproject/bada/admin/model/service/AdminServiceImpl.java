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

	@Override
	public List<Product> productList() {
		
		List<Product> list=dao.productList(session);
		return list;
	}

	@Override
	public List<Product> productListPage(Map<String, Integer> param) {
		// TODO Auto-generated method stub
		return dao.productListPage(session,param);
	}

	@Override
	public int productListCount() {
		// TODO Auto-generated method stub
		return dao.productListCount(session);
	}
	
	
	
}
