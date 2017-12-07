package model;

import java.io.Serializable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
public class QuestionBean implements Serializable  {
	private String id;
	private String partID;
	private String correct;
	private String wrongs;
	private String content;
	private String birth;
	private String[] answers = new String[4];
	private int[] mapAnswers = new int[4];
	private int mapCorrectIndex;
	
	public int[] getMapAnswers() {
		return mapAnswers;
	}
	public void setMapAnswers(int[] mapAnswers) {
		this.mapAnswers = mapAnswers;
	}
	public int getMapCorrectIndex() {
		return mapCorrectIndex;
	}
	public void setMapCorrectIndex(int mapCorrectIndex) {
		this.mapCorrectIndex = mapCorrectIndex;
	}
	public String[] getAnswers() {
		return answers;
	}
	public void setAnswers(String[] answers) {
		this.answers = answers;
	}

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
		answers[0] = correct;
		
	}
	public String getWrongs() {
		return wrongs;
	}
	public void setWrongs(String wrongs) {
		this.wrongs = wrongs;
		String regPattern = "^\\[(.+)\\]\\[(.+)\\]\\[(.+)\\]$";
		Pattern pattern = Pattern.compile(regPattern);
		Matcher matcher = pattern.matcher(this.wrongs);
		if(matcher.find()) {
			this.answers[0] = this.correct;
			this.answers[1] = matcher.group(1);
			this.answers[2] = matcher.group(2);
			this.answers[3] = matcher.group(3);
		}
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}

}
