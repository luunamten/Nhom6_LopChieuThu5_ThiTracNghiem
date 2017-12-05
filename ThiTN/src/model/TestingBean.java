package model;

import java.io.Serializable;

public class TestingBean implements Serializable {
	private float point;
	private String start;
	private String answers;
	private String testContent;
	private int numCorrect;
	private StudentBean student;
	private TestBean test;
	public float getPoint() {
		return point;
	}
	public void setPoint(float point) {
		this.point = point;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getAnswers() {
		return answers;
	}
	public void setAnswers(String answers) {
		this.answers = answers;
	}
	public String getTestContent() {
		return testContent;
	}
	public void setTestContent(String testContent) {
		this.testContent = testContent;
	}
	public int getNumCorrect() {
		return numCorrect;
	}
	public void setNumCorrect(int numCorrect) {
		this.numCorrect = numCorrect;
	}
	public StudentBean getStudent() {
		return student;
	}
	public void setStudent(StudentBean student) {
		this.student = student;
	}
	public TestBean getTest() {
		return test;
	}
	public void setTest(TestBean test) {
		this.test = test;
	}
	
}
