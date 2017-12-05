package model;

import java.io.Serializable;

public class PartAndNumQuestionBean implements Serializable  {
	private PartBean part;
	private int numberOfQuestion;
	public PartBean getPart() {
		return part;
	}
	public void setPart(PartBean part) {
		this.part = part;
	}
	public int getNumberOfQuestion() {
		return numberOfQuestion;
	}
	public void setNumberOfQuestion(int numberOfQuestion) {
		this.numberOfQuestion = numberOfQuestion;
	}
}
