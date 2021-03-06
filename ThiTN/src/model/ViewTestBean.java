package model;

import java.io.Serializable;

public class ViewTestBean implements Serializable  {
	private String semesterID;
	private String teacherID;
	private String subjectID;
	private String subjectName;
	private String searchString;
	public String getSemesterID() {
		return semesterID;
	}
	public void setSemesterID(String semesterID) {
		this.semesterID = semesterID;
	}
	public String getTeacherID() {
		return teacherID;
	}
	public void setTeacherID(String teacherID) {
		this.teacherID = teacherID;
	}
	public String getSubjectID() {
		return subjectID;
	}
	public void setSubjectID(String subjectID) {
		this.subjectID = subjectID;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public String getSearchString() {
		return searchString;
	}
	public void setSearchString(String searchString) {
		this.searchString = searchString;
	}
	
}
