package model;

public class StudentTestingBean {
	private int totalDuration;
	private int pageIndex;
	private int totalPage;
	private String timeRemaing;
	private String start;
	
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public int getTotalDuration() {
		return totalDuration;
	}
	public void setTotalDuration(int totalDuration) {
		this.totalDuration = totalDuration;
	}
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public String getTimeRemaing() {
		return timeRemaing;
	}
	public void setTimeRemaing(String timeRemaing) {
		this.timeRemaing = timeRemaing;
	}
	
}
