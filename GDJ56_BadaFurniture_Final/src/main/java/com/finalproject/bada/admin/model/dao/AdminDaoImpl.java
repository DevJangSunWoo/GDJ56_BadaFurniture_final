package com.finalproject.bada.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalproject.bada.admin.model.service.AdminServiceImpl;
import com.finalproject.bada.product.model.vo.FileProduct;
import com.finalproject.bada.product.model.vo.Product;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class AdminDaoImpl implements AdminDao {
	
	//가구 올리기
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
	
	//가구 관리 - 조회
	@Override
	public List<Product> productList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("admin.productList");
	}

	@Override
	public List<Product> productListPage(SqlSessionTemplate session, Map<String, Integer> param) {
		// TODO Auto-generated method stub
		return session.selectList("admin.productList",null,
				new RowBounds((param.get("cPage")-1)*param.get("numPerpage"),param.get("numPerpage")));
	}

	@Override
	public int productListCount(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.productListCount");
	}

	//요약테이블
	@Override
	public List<Map<String,Integer>> productSummary(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("admin.productSummary");
	}

	//가구관리 - 삭제
	@Override
	public int deleteProduct(SqlSessionTemplate session, int id) {
		// TODO Auto-generated method stub
		return session.delete("admin.deleteProduct",id);
	}
	
	//가구 관리 - 판매상태 변경
	@Override
	public int updateSoldOutState(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.update("admin.updateSoldOutState",param);
	}

	//가구 관리 - 공개상태 변경
	@Override
	public int updateShowState(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.update("admin.updateShowState",param);
	}
	
	
	
	
	
	

}
