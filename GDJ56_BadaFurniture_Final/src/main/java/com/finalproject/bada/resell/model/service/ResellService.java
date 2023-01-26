package com.finalproject.bada.resell.model.service;

import java.util.List;

import com.finalproject.bada.resell.model.vo.Resell;

public interface ResellService {

	void insertResell(Resell resell);
	
	List<Resell> selectResellList(int memberNo);
	
	Resell selectResell(int resellNo);
}
