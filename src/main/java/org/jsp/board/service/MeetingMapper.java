package org.jsp.board.service;

import java.util.ArrayList;

import org.jsp.board.vo.Meeting;

public interface MeetingMapper {

	public int insertMeeting(Meeting mt);

	public int updateMeetingtext(Meeting mt);

	public Meeting selectOneMeeting(Meeting mt);

	public Meeting selectMeetingTitle(Meeting mt);

	public ArrayList<Meeting> selectPjMeetings(int pjno);
}