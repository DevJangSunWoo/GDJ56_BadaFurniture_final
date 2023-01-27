package com.finalproject.bada.order.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.finalproject.bada.product.model.vo.Product;

public interface OrderDao {
	
	Product selectOrderSheet(SqlSessionTemplate session,int productNo);
	List<Product> selectOrderSheetProductList(SqlSessionTemplate session,HashMap map); 
	
	
}
