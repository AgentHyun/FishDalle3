package com.puft.game;

public class Inventory {

	
	private String f_name;
	private int f_price;
	private int f_size;
	
public Inventory() {
	// TODO Auto-generated constructor stub
}

public Inventory(String f_name, int f_price, int f_size) {
	super();
	this.f_name = f_name;
	this.f_price = f_price;
	this.f_size = f_size;
}

public String getF_name() {
	return f_name;
}

public void setF_name(String f_name) {
	this.f_name = f_name;
}

public int getF_price() {
	return f_price;
}

public void setF_price(int f_price) {
	this.f_price = f_price;
}

public int getF_size() {
	return f_size;
}

public void setF_size(int f_size) {
	this.f_size = f_size;
}
	
@Override
public String toString() {
    return "Inventory [f_name=" + f_name + ", f_price=" + f_price + ", f_size=" + f_size + "]";
}
	
}
