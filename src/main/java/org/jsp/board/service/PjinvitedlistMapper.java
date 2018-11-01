package org.jsp.board.service;

import java.util.ArrayList;

import org.jsp.board.vo.Pjinvitedlist;

public interface PjinvitedlistMapper {

	public int inviteToPj(Pjinvitedlist ivtlist);

	public ArrayList<Pjinvitedlist> invitedList(int pjno);

	// 招待リストとSkettoのメンバーリストのジョイン
	public ArrayList<Pjinvitedlist> checkIfJoined(int pjno);

	public int deleteFromInvited(Pjinvitedlist ivt);

	public ArrayList<Pjinvitedlist> pjnolistById(String id);

}
