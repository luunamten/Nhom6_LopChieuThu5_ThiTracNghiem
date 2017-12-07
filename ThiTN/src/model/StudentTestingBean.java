package model;

public class StudentTestingBean {
	private int totalDuration;
	private int pageIndex;
	private int totalPage;
	private String timeRemaining;
	private String start;
	
	public String getTimeRemaining() {
		return timeRemaining;
	}
	public void setTimeRemaining(String timeRemaining) {
		this.timeRemaining = timeRemaining;
	}
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
	
}
