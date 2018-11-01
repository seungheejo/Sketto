package org.jsp.board.service;

import java.util.ArrayList;

import org.jsp.board.vo.Chatlibrary;

public interface ChatlibraryMapper {

	// ファイル登録
	public int insertFile(Chatlibrary ch);

	// 一つのファイルだけ持って来る
	public Chatlibrary selectOneFile(Chatlibrary ch);

	// 会議に属するファイルを全部持ってくる
	public ArrayList<Chatlibrary> selectAllFiles(Chatlibrary ch);

}