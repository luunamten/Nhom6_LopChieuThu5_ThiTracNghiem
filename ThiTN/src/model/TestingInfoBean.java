package model;

public class TestingInfoBean {
	private TestingBean testing;
	private SubjectBean subject;
	private int numQuestion;
	
	public int getNumQuestion() {
		return numQuestion;
	}
	public void setNumQuestion(int numQuestion) {
		this.numQuestion = numQuestion;
	}
	public TestingBean getTesting() {
		return testing;
	}
	public void setTesting(TestingBean testing) {
		this.testing = testing;
	}
	public SubjectBean getSubject() {
		return subject;
	}
	public void setSubject(SubjectBean subject) {
		this.subject = subject;
	}
}
