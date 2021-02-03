package com.example.demo.member;

public class MemberVo {
	
	String mid;
	String pwd;
	String name;
	String phone;
	String email; 
	
	public String getName() {
		return name;
	}
	public String getPhone() {
		return phone;
	}
	public String getEmail() {
		return email;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public void setName(String name) {
		this.name = name;
		
	}
	public void setPhone(String phone) {
		this.phone = phone;
		
	}
	public void setEmail(String email) {
		this.email = email;
		
	}
}
