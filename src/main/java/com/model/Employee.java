package com.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Employee {

	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String ename;
	private String password;
	private long phone;

	public int getId() {
		return id;
	}

	public String getEname() {
		return ename;
	}

	public Employee() {
		super();
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public long getPhone() {
		return phone;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}

	public Employee(String ename, String password, long phone) {
		super();
		this.ename = ename;
		this.password = password;
		this.phone = phone;
	}

}
