package org.jsp.board.service;

import java.util.ArrayList;

import org.jsp.board.vo.Chatlibrary;

public interface ChatlibraryMapper {

	// 파일 등록
	public int insertFile(Chatlibrary ch);

	// 하나의 파일만 가져옴
	public Chatlibrary selectOneFile(Chatlibrary ch);

	// 회의에 속한 파일을 전부 가져옴
	public ArrayList<Chatlibrary> selectAllFiles(Chatlibrary ch);

}
