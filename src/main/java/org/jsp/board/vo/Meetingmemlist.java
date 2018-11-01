package org.jsp.board.vo;

public class Meetingmemlist {

	private int meetingno;
	private String id;
	private String name;

	public Meetingmemlist(int meetingno, String id, String name) {
		super();
		this.meetingno = meetingno;
		this.id = id;
		this.name = name;
	}

	public int getMeetingno() {
		return meetingno;
	}

	public void setMeetingno(int meetingno) {
		this.meetingno = meetingno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Meetingmemlist [meetingno=" + meetingno + ", id=" + id + ", name=" + name + "]";
	}

}
