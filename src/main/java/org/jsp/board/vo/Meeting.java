package org.jsp.board.vo;

public class Meeting {

	private int meetingno;
	private String id;
	private String meetingdate;
	private String meetingtitle;
	private String meetingtext;
	private int pjno;

	public Meeting() {
		super();
	}

	public Meeting(int meetingno, String id, String meetingdate, String meetingtitle, String meetingtext, int pjno) {
		super();
		this.meetingno = meetingno;
		this.id = id;
		this.meetingdate = meetingdate;
		this.meetingtitle = meetingtitle;
		this.meetingtext = meetingtext;
		this.pjno = pjno;
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

	public String getMeetingdate() {
		return meetingdate;
	}

	public void setMeetingdate(String meetingdate) {
		this.meetingdate = meetingdate;
	}

	public String getMeetingtitle() {
		return meetingtitle;
	}

	public void setMeetingtitle(String meetingtitle) {
		this.meetingtitle = meetingtitle;
	}

	public String getMeetingtext() {
		return meetingtext;
	}

	public void setMeetingtext(String meetingtext) {
		this.meetingtext = meetingtext;
	}

	public int getPjno() {
		return pjno;
	}

	public void setPjno(int pjno) {
		this.pjno = pjno;
	}

	@Override
	public String toString() {
		return "Meeting [meetingno=" + meetingno + ", id=" + id + ", meetingdate=" + meetingdate + ", meetingtitle="
				+ meetingtitle + ", meetingtext=" + meetingtext + ", pjno=" + pjno + "]";
	}

}
