package com.finalproject.bada.mypage.model.dao;

import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalproject.bada.mypage.model.vo.Alert;
import com.finalproject.bada.product.model.vo.Product;
import com.finalproject.bada.resell.model.vo.Resell;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class MypageDaoImpl implements MypageDao {

	@Override
	public List<Product> selectCartProduct(SqlSessionTemplate session, int memberNo) {
		return session.selectList("mypage.selectCartProduct", memberNo);
	}

	@Override
	public int deleteCart(SqlSessionTemplate session, Map param) {
		return session.delete("mypage.deleteCart", param);
	}

	@Override
	public List<Alert> selectAlertList(SqlSessionTemplate session, int memberNo, int cPage, int numPerpage) {
		return session.selectList("mypage.selectAlertList", memberNo, new RowBounds((cPage-1)*numPerpage, numPerpage));
	}

	@Override
	public int selectAlertCount(SqlSessionTemplate session, int memberNo) {
		return session.selectOne("mypage.selectAlertCount",memberNo);
	}

	@Override
	public int insertAlert(SqlSessionTemplate session, Alert alert) {
		log.debug("test : ",alert);
		return session.insert("mypage.insertAlert", alert);
	}

	@Override
	public String getAlertMsg(String path, String state, Object obj) {
		String msg = "";
		DecimalFormat formatter = new DecimalFormat("###,###");
		switch(state) {
		case "resellComment" : 
			//log.debug(path+" / " +state + " / " + (Resell)obj);
			Resell resell = (Resell)obj;
			msg = "<a href=\""+path+"/resell/read.do?resellNo="+resell.getResellNo()+"\">"+resell.getItem()+" 판매신청("+formatter.format(resell.getHopePrice()) +")"+"</a>"
			+"에 운영자가 댓글을 달았습니다.";
			//log.debug(msg);
			break;
		default: 
			break;
		}
		return msg;
	}

	@Override
	public int deleteAlert(SqlSessionTemplate session, List<Integer> alertNos) {
		return session.delete("mypage.deleteAlert", alertNos);
	}

	@Override
	public int updateAlertReadState(SqlSessionTemplate session, int memberNo) {
		return session.update("mypage.updateAlertReadState",memberNo);
	}

	@Override
	public int selectAlertCountReadStateN(SqlSessionTemplate session, int memberNo) {
		return session.selectOne("mypage.selectAlertCountReadStateN", memberNo);
	}

}
