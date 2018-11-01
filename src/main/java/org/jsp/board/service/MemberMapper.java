package org.jsp.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.jsp.board.vo.Member;

public interface MemberMapper {

	public int joinMember(Member sc);

	public int updateMember(Member sc);

	public int deleteMember(HashMap<String, String> map);

	public Member login(Member sc);

	public String checkId(String id);

	public Member selectMember(String id);

	public ArrayList<Member> MemberList(String searchText);

	public ArrayList<Member> AllMember();
}