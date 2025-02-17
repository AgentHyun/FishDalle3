package com.puft.feb171.Fruit;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Fruits {

	
	//Ajax를 위한 1번 준비물
	
    private List<Fruit> fruit;
    public Fruits() {
		// TODO Auto-generated constructor stub
	}
	public Fruits(List<Fruit> fruit) {
		super();
		this.fruit = fruit;
	}
	public List<Fruit> getFruit() {
		return fruit;
	}
	public void setFruit(List<Fruit> fruit) {
		this.fruit = fruit;
	}
    
    
	
	
}
