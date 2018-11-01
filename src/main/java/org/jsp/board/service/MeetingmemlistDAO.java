package org.jsp.board.service;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.jsp.board.vo.Meetingmemlist;
import org.springframework.stereotype.Repository;

@Repository
public class MeetingmemlistDAO implements MeetingmemlistMapper {

	@Inject
	private SqlSession session;

	@Override
	public int insertMml(Meetingmemlist mml) {
		return session.getMapper(MeetingmemlistMapper.class).insertMml(mml);
	}

	@Override
	public Meetingmemlist selectOneMml(Meetingmemlist mml) {
		return session.getMapper(MeetingmemlistMapper.class).selectOneMml(mml);
	}

	@Override
	public ArrayList<String> selectNames(int meetingno) {
		return session.getMapper(MeetingmemlistMapper.class).selectNames(meetingno);
	}

	@Override
	public int deleteMml(Meetingmemlist mml) {
		return session.getMapper(MeetingmemlistMapper.class).deleteMml(mml);
	}

}
