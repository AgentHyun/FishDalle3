package com.puft.game;

public class Rod {

	
	private String r_name;
	private int r_price;
	private int r_damage;
	
	
	public Rod() {
		// TODO Auto-generated constructor stub
	}


	public Rod(String r_name, int r_price, int r_damage) {
		super();
		this.r_name = r_name;
		this.r_price = r_price;
		this.r_damage = r_damage;
	}


	public String getR_name() {
		return r_name;
	}


	public void setR_name(String r_name) {
		this.r_name = r_name;
	}


	public int getR_price() {
		return r_price;
	}


	public void setR_price(int r_price) {
		this.r_price = r_price;
	}


	public int getR_damage() {
		return r_damage;
	}


	public void setR_damage(int r_damage) {
		this.r_damage = r_damage;
	}
	
	
}
