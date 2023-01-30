package com.finalproject.bada.resell.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.finalproject.bada.resell.model.vo.Resell;
import com.finalproject.bada.resell.model.vo.ResellComment;

public interface ResellService {

	void insertResell(Resell resell);
	
	List<Resell> selectResellList(int memberNo, int cPage, int numPerpage);
	
	Resell selectResell(int resellNo);
	
	int updateResell(Resell resell);
	
	int deleteResell(int resellNo);
	
	void insertResellComment(ResellComment resellComment, HttpSession session);
	
	int selectResellCount(int memberNo);
}
