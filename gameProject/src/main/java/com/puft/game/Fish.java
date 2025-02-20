package com.puft.game;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Fish {
   private int f_no;
	private String f_name;
   private int f_price;
   
   
   public Fish() {
	// TODO Auto-generated constructor stub
}


public Fish(int f_no, String f_name, int f_price) {
	super();
	this.f_no = f_no;
	this.f_name = f_name;
	this.f_price = f_price;
}


public int getF_no() {
	return f_no;
}

@XmlElement
public void setF_no(int f_no) {
	this.f_no = f_no;
}


public String getF_name() {
	return f_name;
}

@XmlElement
public void setF_name(String f_name) {
	this.f_name = f_name;
}


public int getF_price() {
	return f_price;
}


public void setF_price(int f_price) {
	this.f_price = f_price;
}
   
   
   
   
   
   
   
   
   
   
   
   
}
