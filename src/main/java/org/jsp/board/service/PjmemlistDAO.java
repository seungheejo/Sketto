package org.jsp.board.service;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.jsp.board.vo.Pjmemlist;
import org.springframework.stereotype.Repository;

@Repository
public class PjmemlistDAO implements PjmemlistMapper {

	@Inject
	SqlSession session;

	@Override
	public int insertPjmem(Pjmemlist pjmem) {
		return session.getMapper(PjmemlistMapper.class).insertPjmem(pjmem);
	}

	@Override
	public ArrayList<Pjmemlist> pjmemlist(int pjno) {
		return session.getMapper(PjmemlistMapper.class).pjmemlist(pjno);
	}

	@Override
	public int deletePjmem(Pjmemlist pjmem) {
		return session.getMapper(PjmemlistMapper.class).deletePjmem(pjmem);
	}

}
