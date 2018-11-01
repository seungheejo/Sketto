package org.jsp.board.vo;

public class Plan {

	private int pno;
	private String planname;
	private String pstartdate;
	private String penddate;
	private int pjno;
	private String id;
	private int priority;
	private double progress;
	private String color;

	public Plan() {
		super();
	}

	public Plan(int pno, String planname, String pstartdate, String penddate, int pjno, String id, int priority,
			double progress, String color) {
		super();
		this.pno = pno;
		this.planname = planname;
		this.pstartdate = pstartdate;
		this.penddate = penddate;
		this.pjno = pjno;
		this.id = id;
		this.priority = priority;
		this.progress = progress;
		this.color = color;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getPlanname() {
		return planname;
	}

	public void setPlanname(String planname) {
		this.planname = planname;
	}

	public String getPstartdate() {
		return pstartdate;
	}

	public void setPstartdate(String pstartdate) {
		this.pstartdate = pstartdate;
	}

	public String getPenddate() {
		return penddate;
	}

	public void setPenddate(String penddate) {
		this.penddate = penddate;
	}

	public int getPjno() {
		return pjno;
	}

	public void setPjno(int pjno) {
		this.pjno = pjno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getPriority() {
		return priority;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}

	public double getProgress() {
		return progress;
	}

	public void setProgress(double progress) {
		this.progress = progress;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	@Override
	public String toString() {
		return "Plan [pno=" + pno + ", planname=" + planname + ", pstartdate=" + pstartdate + ", penddate=" + penddate
				+ ", pjno=" + pjno + ", id=" + id + ", priority=" + priority + ", progress=" + progress + ", color="
				+ color + "]";
	}

}
