package com.hu.gov.business;

public class User extends Employee {

	private int userId;

	private String username;
	private String password ; 
	private boolean isAdmin;
     
	public User() {
		
		
	}
	
	public User(int userId,  String username , String password ,  boolean isAdmin) {
		this.userId = userId; 
		this.username = username;
		this.isAdmin = isAdmin;
		this.password = password ; 
		
 
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	
	

	

	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isAdmin() {
		return isAdmin;
	}

	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

}
