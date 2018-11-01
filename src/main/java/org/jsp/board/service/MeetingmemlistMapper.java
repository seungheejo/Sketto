package org.jsp.board.service;

import java.util.ArrayList;

import org.jsp.board.vo.Meetingmemlist;

public interface MeetingmemlistMapper {

	// 会議に参加
	public int insertMml(Meetingmemlist mml);

	// 会議に参加するユーザを探す
	public Meetingmemlist selectOneMml(Meetingmemlist mml);

	// 参加者のリストに名前を入れる
	public ArrayList<String> selectNames(int meetingno);

	// 会議から出たユーザを会議参加者のリストから削除
	public int deleteMml(Meetingmemlist mml);
}
