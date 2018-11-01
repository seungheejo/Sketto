package org.jsp.board.service;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.jsp.board.vo.Meeting;
import org.springframework.stereotype.Repository;

@Repository
public class MeetingDAO implements MeetingMapper {

	@Inject
	private SqlSession session;

	@Override
	public int insertMeeting(Meeting mt) {
		return session.getMapper(MeetingMapper.class).insertMeeting(mt);
	}

	@Override
	public int updateMeetingtext(Meeting mt) {
		return session.getMapper(MeetingMapper.class).updateMeetingtext(mt);
	}

	@Override
	public Meeting selectOneMeeting(Meeting mt) {
		return session.getMapper(MeetingMapper.class).selectOneMeeting(mt);
	}

	@Override
	public Meeting selectMeetingTitle(Meeting mt) {
		return session.getMapper(MeetingMapper.class).selectMeetingTitle(mt);
	}

	@Override
	public ArrayList<Meeting> selectPjMeetings(int pjno) {
		return session.getMapper(MeetingMapper.class).selectPjMeetings(pjno);
	}

}
