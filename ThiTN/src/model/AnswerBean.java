package model;

public class AnswerBean {
	private TestBean test;
	private int[] answerIndex;
	public TestBean getTest() {
		return test;
	}
	public void setTest(TestBean test) {
		this.test = test;
		this.answerIndex = new int[this.test.getMapQuestions().length];
	}
	public int[] getAnswerIndex() {
		return answerIndex;
	}
	public void setAnswerIndex(int[] answerIndex) {
		this.answerIndex = answerIndex;
	} 
}
