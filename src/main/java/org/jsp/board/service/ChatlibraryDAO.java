package org.jsp.board.service;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.jsp.board.vo.Chatlibrary;
import org.springframework.stereotype.Repository;

@Repository
public class ChatlibraryDAO implements ChatlibraryMapper {

	@Inject
	private SqlSession session;

	@Override
	public int insertFile(Chatlibrary ch) {
		return session.getMapper(ChatlibraryMapper.class).insertFile(ch);
	}

	@Override
	public Chatlibrary selectOneFile(Chatlibrary ch) {
		return session.getMapper(ChatlibraryMapper.class).selectOneFile(ch);
	}

	@Override
	public ArrayList<Chatlibrary> selectAllFiles(Chatlibrary ch) {
		return session.getMapper(ChatlibraryMapper.class).selectAllFiles(ch);
	}

}
