package model;

import java.io.Serializable;

public class LoginErrorBean implements Serializable  {
	private String usernameError;
	private String passwordError;
	public String getUsernameError() {
		return usernameError;
	}
	public void setUsernameError(String usernameError) {
		this.usernameError = usernameError;
	}
	public String getPasswordError() {
		return passwordError;
	}
	public void setPasswordError(String passwordError) {
		this.passwordError = passwordError;
	}
	
}
