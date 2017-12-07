package model;

import java.io.Serializable;
import java.util.List;

public class TestBean implements Serializable  {
	private String id;
	private String name;
	private String birth;
	private	String start;
	private String end;
	private String teacherID;
	private int duration;
	private List<QuestionBean> questions;
	private int[] mapQuestions;
	
	public List<QuestionBean> getQuestions() {
		return questions;
	}
	public void setQuestions(List<QuestionBean> questions) {
		this.questions = questions;
		mapQuestions = new int[questions.size()];
	}
	
	public int[] getMapQuestions() {
		return mapQuestions;
	}
	public void setMapQuestions(int[] mapQuestions) {
		this.mapQuestions = mapQuestions;
	}
	public String getId() {
		return id;
	}
	public String getName() {
		return this.name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getTeacherID() {
		return teacherID;
	}
	public void setTeacherID(String teacherID) {
		this.teacherID = teacherID;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
}
