package com.finalproject.bada.resell.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalproject.bada.resell.model.vo.FileResell;
import com.finalproject.bada.resell.model.vo.Resell;
import com.finalproject.bada.resell.model.vo.ResellComment;

@Repository
public class ResellDaoImpl implements ResellDao {
	
	@Override
	public List<Resell> selectResellList(SqlSessionTemplate session, int memberNo, int cPage, int numPerpage) {
		return session.selectList("resell.selectResellList",memberNo,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}
	
	@Override
	public int insertResell(SqlSessionTemplate session, Resell resell) {
		return session.insert("resell.insertResell", resell);
	}

	@Override
	public int insertFileResell(SqlSessionTemplate session, FileResell fr) {
		return session.insert("resell.insertFileResell", fr);
	}

	@Override
	public Resell selectResell(SqlSessionTemplate session, int resellNo) {
		return session.selectOne("resell.selectResell",resellNo);
	}

	@Override
	public int updateResell(SqlSessionTemplate session, Resell resell) {
		return session.update("resell.updateResell",resell);
	}

	@Override
	public int deleteResell(SqlSessionTemplate session, int resellNo) {
		return session.delete("resell.deleteResell",resellNo);
	}

	@Override
	public int insertResellComment(SqlSessionTemplate session, ResellComment resellComment) {
		return session.insert("resell.insertResellComment", resellComment);
	}

	@Override
	public int selectResellCount(SqlSessionTemplate session, int memberNo) {
		return session.selectOne("resell.selectResellCount", memberNo);
	}

	

}
