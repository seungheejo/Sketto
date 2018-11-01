package org.jsp.board.service;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.jsp.board.vo.Pjinvitedlist;
import org.springframework.stereotype.Repository;

@Repository
public class PjinvitedlistDAO implements PjinvitedlistMapper {

	@Inject
	SqlSession session;

	@Override
	public int inviteToPj(Pjinvitedlist ivtlist) {

		return session.getMapper(PjinvitedlistMapper.class).inviteToPj(ivtlist);
	}

	@Override
	public ArrayList<Pjinvitedlist> invitedList(int pjno) {
		return session.getMapper(PjinvitedlistMapper.class).invitedList(pjno);
	}

	@Override
	public ArrayList<Pjinvitedlist> checkIfJoined(int pjno) {
		return session.getMapper(PjinvitedlistMapper.class).checkIfJoined(pjno);
	}

	@Override
	public int deleteFromInvited(Pjinvitedlist ivt) {
		return session.getMapper(PjinvitedlistMapper.class).deleteFromInvited(ivt);
	}

	@Override
	public ArrayList<Pjinvitedlist> pjnolistById(String id) {
		return session.getMapper(PjinvitedlistMapper.class).pjnolistById(id);
	}

}
