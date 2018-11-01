package org.jsp.board.service;

import java.util.ArrayList;

import org.jsp.board.vo.Pjmemlist;

public interface PjmemlistMapper {

	public int insertPjmem(Pjmemlist pjmem);
	
	public ArrayList<Pjmemlist> pjmemlist (int pjno);

	public int deletePjmem (Pjmemlist pjmem);
	
}
