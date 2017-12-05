package model;

import java.io.Serializable;

public class StudentCheckBean implements Serializable {
	private StudentBean student;
	private boolean checked;
	public StudentBean getStudent() {
		return student;
	}
	public void setStudent(StudentBean student) {
		this.student = student;
	}
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	
}
