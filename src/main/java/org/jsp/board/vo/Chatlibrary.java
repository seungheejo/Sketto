package org.jsp.board.vo;

public class Chatlibrary { // 회의중의 파일을 관리

	private int filenum;
	private String id;
	private int meetingno;
	private String inputdate;
	private String originalfile;
	private String savedfile;

	public Chatlibrary() {
		super();
	}

	public Chatlibrary(int filenum, String id, int meetingno, String inputdate, String originalfile, String savedfile) {
		super();
		this.filenum = filenum;
		this.id = id;
		this.meetingno = meetingno;
		this.inputdate = inputdate;
		this.originalfile = originalfile;
		this.savedfile = savedfile;
	}

	public int getFilenum() {
		return filenum;
	}

	public void setFilenum(int filenum) {
		this.filenum = filenum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getMeetingno() {
		return meetingno;
	}

	public void setMeetingno(int meetingno) {
		this.meetingno = meetingno;
	}

	public String getInputdate() {
		return inputdate;
	}

	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}

	public String getOriginalfile() {
		return originalfile;
	}

	public void setOriginalfile(String originalfile) {
		this.originalfile = originalfile;
	}

	public String getSavedfile() {
		return savedfile;
	}

	public void setSavedfile(String savedfile) {
		this.savedfile = savedfile;
	}

	@Override
	public String toString() {
		return "Chatlibrary [filenum=" + filenum + ", id=" + id + ", meetingno=" + meetingno + ", inputdate="
				+ inputdate + ", originalfile=" + originalfile + ", savedfile=" + savedfile + "]";
	}

}
