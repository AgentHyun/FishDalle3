package com.puft.feb101.human;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;

import com.puft.feb101.cat.Cat;
import com.puft.feb101.dog.Dog;

public class Human {
    //기본형
	private String name;
	private int age;
     
	
	private String[] nickname;
	private ArrayList<String> friend;
	private HashMap<String, Integer> family;
	
	//has A
	private Dog pet;
	
	
	// .xml에 등록한 고양이 객체와 자동으로 연결
	// 생성자, setter 필요없음
	@Autowired
	private Cat pet2;
	public Cat getPet2() {
		return pet2;
	}
	public Human() {
		// TODO Auto-generated constructor stub
	}
	public Human(String name, int age, String[] nickname, ArrayList<String> friend, HashMap<String, Integer> family,
			Dog pet) {
		super();
		this.name = name;
		this.age = age;
		this.nickname = nickname;
		this.friend = friend;
		this.family = family;
		this.pet = pet;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String[] getNickname() {
		return nickname;
	}
	public void setNickname(String[] nickname) {
		this.nickname = nickname;
	}
	public ArrayList<String> getFriend() {
		return friend;
	}
	public void setFriend(ArrayList<String> friend) {
		this.friend = friend;
	}
	public HashMap<String, Integer> getFamily() {
		return family;
	}
	public void setFamily(HashMap<String, Integer> family) {
		this.family = family;
	}
	public Dog getPet() {
		return pet;
	}
	public Cat getPet2(Cat pet2) {
		return pet2;
	}
	public void setPet(Dog pet) {
		this.pet = pet;
	}
	
	
	
}
