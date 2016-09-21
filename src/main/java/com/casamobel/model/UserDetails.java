package com.casamobel.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class UserDetails
{
	@Id
	String username;
	@Column
	String password;
	@Column
	String role="ROLE_USER";
	@Column
	boolean enabled=true;
	
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
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public boolean getStatus() {
		return enabled;
	}
	public void setStatus(boolean status) {
		this.enabled = status;
	}
	
	

}
