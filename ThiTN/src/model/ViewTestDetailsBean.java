package model;

import java.io.Serializable;

public class ViewTestDetailsBean implements Serializable  {
	private TestBean test;
	private int numStudent;
	private int numQuestion;
	public TestBean getTest() {
		return test;
	}
	public void setTest(TestBean test) {
		this.test = test;
	}
	public int getNumStudent() {
		return numStudent;
	}
	public void setNumStudent(int numStudent) {
		this.numStudent = numStudent;
	}
	public int getNumQuestion() {
		return numQuestion;
	}
	public void setNumQuestion(int numQuestion) {
		this.numQuestion = numQuestion;
	}
	
	
}
