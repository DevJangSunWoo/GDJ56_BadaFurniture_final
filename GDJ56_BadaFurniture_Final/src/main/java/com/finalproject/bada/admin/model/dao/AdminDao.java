package com.finalproject.bada.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.finalproject.bada.product.model.vo.FileProduct;
import com.finalproject.bada.product.model.vo.Product;

public interface AdminDao {
	
	int insertProduct(SqlSessionTemplate session,Product product);
	int insertFileProduct(SqlSessionTemplate session,FileProduct f);
	
	List<Product> productList(SqlSessionTemplate session);
	List<Product> productListPage(SqlSessionTemplate session,Map<String,Integer> param);
	int productListCount(SqlSessionTemplate session);
	
}
