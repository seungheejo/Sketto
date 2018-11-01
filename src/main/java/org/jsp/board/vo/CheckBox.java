package org.jsp.board.vo;

public class CheckBox {

	private int cno;
	private int pno;
	private int pjno;
	private String text;
	private int checked;

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getPjno() {
		return pjno;
	}

	public void setPjno(int pjno) {
		this.pjno = pjno;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public int getChecked() {
		return checked;
	}

	public void setChecked(int checked) {
		this.checked = checked;
	}

	public CheckBox(int cno, int pno, int pjno, String text, int checked) {
		super();
		this.cno = cno;
		this.pno = pno;
		this.pjno = pjno;
		this.text = text;
		this.checked = checked;
	}

	public CheckBox() {
		super();
	}

	@Override
	public String toString() {
		return "CheckBox [cno=" + cno + ", pno=" + pno + ", pjno=" + pjno + ", text=" + text + ", checked=" + checked
				+ "]";
	}

}
