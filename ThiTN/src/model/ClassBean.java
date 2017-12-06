package model;

import java.io.Serializable;

/*
 MALOP varchar(255) PK 
TENLOP varchar(255) 
MAHK varchar(255) 
MAGV varchar(255) 
MAMH varchar(255)
 * */
public class ClassBean implements Serializable {
	private String id;
	private String name;
	private SemesterBean semester;
	private TeacherBean teacher;
	private SubjectBean subject;
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
	public SemesterBean getSemester() {
		return semester;
	}
	public void setSemester(SemesterBean semester) {
		this.semester = semester;
	}
	public TeacherBean getTeacher() {
		return teacher;
	}
	public void setTeacher(TeacherBean teacher) {
		this.teacher = teacher;
	}
	public SubjectBean getSubject() {
		return subject;
	}
	public void setSubject(SubjectBean subject) {
		this.subject = subject;
	}

}
