package model;

import java.io.Serializable;

public class TestQuestionBean implements Serializable  {
	private String testID;
	private String questionID;
	public String getTestID() {
		return testID;
	}
	public void setTestID(String testID) {
		this.testID = testID;
	}
	public String getQuestionID() {
		return questionID;
	}
	public void setQuestionID(String questionID) {
		this.questionID = questionID;
	}
}
