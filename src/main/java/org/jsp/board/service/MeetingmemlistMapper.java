package org.jsp.board.service;

import java.util.ArrayList;

import org.jsp.board.vo.Meetingmemlist;

public interface MeetingmemlistMapper {

	// 회의에 참가
	public int insertMml(Meetingmemlist mml);

	// 회의에 참가할 유저를 찾음
	public Meetingmemlist selectOneMml(Meetingmemlist mml);

	// 참가자 리스트에 이름을 넣음
	public ArrayList<String> selectNames(int meetingno);

	// 회의에서 나온 유저를 회의참가 리스트에서 삭제
	public int deleteMml(Meetingmemlist mml);
}
