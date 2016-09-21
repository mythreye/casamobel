package com.casamobel.model;

import javax.persistence.*;
@Entity
public class Seller 
{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	int sellerid;
	@Column
	String sellername;
	@Column
	String selleraddress;
	@Column
	long sellerphone;
	
	public Seller()
	{
		
	}
	public long getSellerphone() {
		return sellerphone;
	}
	public void setSellerphone(long sellerphone) {
		this.sellerphone = sellerphone;
	}
	public int getSellerid() {
		return sellerid;
	}
	public void setSellerid(int sellerid) {
		this.sellerid = sellerid;
	}
	public String getSellername() {
		return sellername;
	}
	public void setSellername(String sellername) {
		this.sellername = sellername;
	}
	public String getSelleraddress() {
		return selleraddress;
	}
	public void setSelleraddress(String selleraddress) {
		this.selleraddress = selleraddress;
	}
	

}
