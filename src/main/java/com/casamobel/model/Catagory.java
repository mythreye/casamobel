package com.casamobel.model;

import javax.persistence.*;

@Entity
public class Catagory
{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	int catagoryid;
	@Column
	String catagoryname;
	@Column
	String description;
	public Catagory()
	{
		
	}
	
	public int getCatagoryid() {
		return catagoryid;
	}
	public void setCatagoryid(int catagoryid) {
		this.catagoryid = catagoryid;
	}
	public String getCatagoryname() {
		return catagoryname;
	}
	public void setCatagoryname(String catagoryname) {
		this.catagoryname = catagoryname;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	

}
