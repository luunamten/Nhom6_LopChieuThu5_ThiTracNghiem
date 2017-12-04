package model;
/*
 MALOP varchar(255) PK 
TENLOP varchar(255) 
MAHK varchar(255) 
MAGV varchar(255) 
MAMH varchar(255)
 * */
public class ClassBean {
	private String id;
	private String name;
	private String semesterID;
	private String teacherID;
	private String subjectID;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
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
	
}
