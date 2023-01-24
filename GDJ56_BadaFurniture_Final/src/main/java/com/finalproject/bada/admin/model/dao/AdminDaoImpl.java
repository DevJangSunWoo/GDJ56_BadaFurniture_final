package com.finalproject.bada.admin.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalproject.bada.admin.model.service.AdminServiceImpl;
import com.finalproject.bada.product.model.vo.FileProduct;
import com.finalproject.bada.product.model.vo.Product;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class AdminDaoImpl implements AdminDao {
	
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
	

}
