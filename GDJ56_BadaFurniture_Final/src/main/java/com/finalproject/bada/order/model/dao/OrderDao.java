package com.finalproject.bada.order.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.finalproject.bada.order.model.vo.OrderDetail;
import com.finalproject.bada.order.model.vo.OrderSheet;
import com.finalproject.bada.product.model.vo.Product;

public interface OrderDao {

	Product selectOrderSheet(SqlSessionTemplate session, int productNo);

	List<Product> selectOrderSheetProductList(SqlSessionTemplate session, HashMap map);

	int insertOrderSheet(SqlSessionTemplate session, HashMap map);

	int insertOrderDetail(SqlSessionTemplate session, HashMap map);

	List<OrderSheet> selectOrderComplete(SqlSessionTemplate session, int orderSheetNo);

	int updateSoldOutState(SqlSessionTemplate session, HashMap map);

	int deleteMemberCart(SqlSessionTemplate session, HashMap map);

	int selectCartCount(SqlSessionTemplate session, HashMap map);

	List<OrderSheet> selectOrderSheetUndepositedList(SqlSessionTemplate session);

	int updateOrderSheetUndeposited(SqlSessionTemplate session, HashMap param);

	int updateOrderDetailRefundState(SqlSessionTemplate session, HashMap param);

	List<OrderDetail> selectOrderDetailCancelCompleted(SqlSessionTemplate session);

	int insertRefund(SqlSessionTemplate session, int orderDetailNo);

	int updateRefundProductSoldOutState(SqlSessionTemplate session, HashMap param);

	List<Product> selectProductListShowState(SqlSessionTemplate session);

	int updateProductShowState(SqlSessionTemplate session, HashMap param);

	List<OrderDetail> selectOrderDetailConfirmStateN(SqlSessionTemplate session);

	int updateOrderDetailConfirmStateNtoY(SqlSessionTemplate session, HashMap param);
}
