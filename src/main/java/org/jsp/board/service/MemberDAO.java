package org.jsp.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.jsp.board.vo.Member;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO implements MemberMapper {

	@Inject
	private SqlSession session;

	@Override
	public int joinMember(Member mem) {
		return session.getMapper(MemberMapper.class).joinMember(mem);
	}

	@Override
	public int updateMember(Member mem) {
		return session.getMapper(MemberMapper.class).updateMember(mem);
	}

	@Override
	public int deleteMember(HashMap<String, String> map) {
		return session.getMapper(MemberMapper.class).deleteMember(map);
	}

	@Override
	public Member login(Member mem) {
		return session.getMapper(MemberMapper.class).login(mem);
	}

	@Override
	public String checkId(String id) {
		return session.getMapper(MemberMapper.class).checkId(id);
	}

	@Override
	public Member selectMember(String id) {
		return session.getMapper(MemberMapper.class).selectMember(id);
	}

	@Override
	public ArrayList<Member> MemberList(String searchText) {
		return session.getMapper(MemberMapper.class).MemberList(searchText);
	}

	@Override
	public ArrayList<Member> AllMember() {
		return session.getMapper(MemberMapper.class).AllMember();
	}

}
