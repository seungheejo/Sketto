package org.jsp.board.vo;

public class Pjinvitedlist {

	private String id;
	private int pjno;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getPjno() {
		return pjno;
	}

	public void setPjno(int pjno) {
		this.pjno = pjno;
	}

	public Pjinvitedlist() {
		super();
	}

	public Pjinvitedlist(String id, int pjno) {
		super();
		this.id = id;
		this.pjno = pjno;
	}

	@Override
	public String toString() {
		return "Pjinvitedlist [id=" + id + ", pjno=" + pjno + "]";
	}

}
