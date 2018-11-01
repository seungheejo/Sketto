package org.jsp.board.vo;

public class Pjmemlist {

	private String id;
	private String name;
	private int pjno;

	public Pjmemlist() {
		super();
	}

	public Pjmemlist(String id, int pjno) {
		super();
		this.id = id;
		this.pjno = pjno;
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

	public int getPjno() {
		return pjno;
	}

	public void setPjno(int pjno) {
		this.pjno = pjno;
	}

	@Override
	public String toString() {
		return "Pjmemlist [id=" + id + ", pjno=" + pjno + "]";
	}

}
