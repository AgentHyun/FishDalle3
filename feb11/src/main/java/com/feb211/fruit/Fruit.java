package com.feb211.fruit;

public class Fruit {

	
	
	//객체를 여러개 등록해서 사용하려면..
	// src/main/resources에 xxxbeans.xml
	// singleton
	// root-context.xml : 톰캣에 실려있는 '프로젝트 전체'에 영향
	// servlet-context.xml : 이 프로젝트에 영향 (주된 작업)
	// → 이곳에 객체 등록
	//고정적으로 값을 지정할게 아니라 가변적인 값을 사용,
	//beans.xml을 만들일은 잘 없음
	//src/main/webapp/WEB-INF/Spring/appServlet/servlet-context.xml
	
	
	
	private String name;
	private int price;public Fruit() {
		// TODO Auto-generated constructor stub
	}
	public Fruit(String name, int price) {
		super();
		this.name = name;
		this.price = price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
