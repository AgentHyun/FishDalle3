package com.puft.feb113.uc;

public class UCResult {
    private double n1;
    private String u1;
    private double n2;
    private String u2;
	
	public UCResult() {
		// TODO Auto-generated constructor stub
	}

	public UCResult(double n1, String u1, double n2, String u2) {
		super();
		this.n1 = n1;
		this.u1 = u1;
		this.n2 = n2;
		this.u2 = u2;
	}

	public double getN1() {
		return n1;
	}

	public void setN1(double n1) {
		this.n1 = n1;
	}

	public String getU1() {
		return u1;
	}

	public void setU1(String u1) {
		this.u1 = u1;
	}

	public double getN2() {
		return n2;
	}

	public void setN2(double n2) {
		this.n2 = n2;
	}

	public String getU2() {
		return u2;
	}

	public void setU2(String u2) {
		this.u2 = u2;
	}
}
