package org.jsp.board.vo;

public class Datalibrary {

	private int filenum;
	private String id;
	private String originalfile;
	private String savedfile;
	private String inputdate;
	private int pjno;

	public Datalibrary() {
		super();
	}

	public Datalibrary(int filenum, String id, String originalfile, String savedfile, String inputdate, int pjno) {
		super();
		this.filenum = filenum;
		this.id = id;
		this.originalfile = originalfile;
		this.savedfile = savedfile;
		this.inputdate = inputdate;
		this.pjno = pjno;
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

	public String getInputdate() {
		return inputdate;
	}

	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}

	public int getPjno() {
		return pjno;
	}

	public void setPjno(int pjno) {
		this.pjno = pjno;
	}

	@Override
	public String toString() {
		return "Datalibrary [filenum=" + filenum + ", id=" + id + ", originalfile=" + originalfile + ", savedfile="
				+ savedfile + ", inputdate=" + inputdate + ", pjno=" + pjno + "]";
	}

}
