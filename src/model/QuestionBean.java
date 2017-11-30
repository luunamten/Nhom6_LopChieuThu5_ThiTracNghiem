package model;

import java.sql.Date;

/*
MACH varchar(255) PK 
MAPHAN varchar(255) 
CAUTRALOI longtext 
CAUTRALOIKHAC longtext 
MOTA longtext 
THOIDIEMTHEM datetime*/
public class QuestionBean {
	private String id;
	private String partID;
	private String correct;
	private String wrongs;
	private String content;
	private Date birth;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPartID() {
		return partID;
	}
	public void setPartID(String partID) {
		this.partID = partID;
	}
	public String getCorrect() {
		return correct;
	}
	public void setCorrect(String correct) {
		this.correct = correct;
	}
	public String getWrongs() {
		return wrongs;
	}
	public void setWrongs(String wrongs) {
		this.wrongs = wrongs;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	

}
