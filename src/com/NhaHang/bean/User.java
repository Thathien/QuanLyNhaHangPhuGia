package com.NhaHang.bean;

public class User {
	private String userName;
	private String password;
	private int quyen;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(String userName, String password, int quyen) {
		super();
		this.userName = userName;
		this.password = password;
		this.quyen = quyen;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getQuyen() {
		return quyen;
	}
	public void setQuyen(int quyen) {
		this.quyen = quyen;
	}
	
}
