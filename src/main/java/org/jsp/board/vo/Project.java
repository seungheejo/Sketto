package org.jsp.board.vo;

public class Project {
	
	private int pjno;
	private String pjtitle;
	private String id;
	private String startdate;
	private String enddate;
	
	public Project() {
		super();
	}
	public Project(int pjno, String pjtitle, String id, String startdate, String enddate) {
		super();
		this.pjno = pjno;
		this.pjtitle = pjtitle;
		this.id = id;
		this.startdate = startdate;
		this.enddate = enddate;
	}
	public int getPjno() {
		return pjno;
	}
	public void setPjno(int pjno) {
		this.pjno = pjno;
	}
	public String getPjtitle() {
		return pjtitle;
	}
	public void setPjtitle(String pjtitle) {
		this.pjtitle = pjtitle;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	@Override
	public String toString() {
		return "Project [pjno=" + pjno + ", pjtitle=" + pjtitle + ", id=" + id + ", startdate=" + startdate
				+ ", enddate=" + enddate + "]";
	}
	

}
