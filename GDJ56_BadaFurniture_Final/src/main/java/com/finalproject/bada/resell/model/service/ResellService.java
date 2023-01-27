package com.finalproject.bada.resell.model.service;

import java.util.List;

import com.finalproject.bada.resell.model.vo.Resell;
import com.finalproject.bada.resell.model.vo.ResellComment;

public interface ResellService {

	void insertResell(Resell resell);
	
	List<Resell> selectResellList(int memberNo);
	
	Resell selectResell(int resellNo);
	
	int updateResell(Resell resell);
	
	int deleteResell(int resellNo);
	
	int insertResellComment(ResellComment resellComment);
}
