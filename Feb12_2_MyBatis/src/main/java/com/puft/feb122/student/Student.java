package com.puft.feb122.student;

import java.math.BigDecimal;

// MyBatis : ORM(Object Relationship Mapping) Framework
// => 객체와 데이터베이스의 데이터를 자동으로 연결(매핑)해주는 Framework
// => 결과를 자바 객체로 내보내줌
// 자동으로 연결해주기 위한 객체는
// DB컬럼명 = Java멤버변수명(조건)
// Oracle ) number 는 정수, 실수도 받을 수 있었지만
// Java에서도 정수, 실수를 모두 포함하는 자료형인
// BigDecimal이 있음.
//이 선행 되어야함.
// Spring MVC : 요청파라미터를 자동으로 객체로...
// 그때의 조건은 요청파라미터명 = Java의 멤버변수명(조건)

// Spring MVC + Maven + MyBatis
// 요청파라미터명 = Java멤버변수명 = DB컬럼명 (조건) ****



public class Student {
  
   private BigDecimal s_no;
   private String s_name;
   private String s_nickname;
   public Student() {
	
}
public Student(BigDecimal s_no, String s_name, String s_nickname) {
	super();
	this.s_no = s_no;
	this.s_name = s_name;
	this.s_nickname = s_nickname;
}
public BigDecimal getS_no() {
	return s_no;
}
public void setS_no(BigDecimal s_no) {
	this.s_no = s_no;
}
public String getS_name() {
	return s_name;
}
public void setS_name(String s_name) {
	this.s_name = s_name;
}
public String getS_nickname() {
	return s_nickname;
}
public void setS_nickname(String s_nickname) {
	this.s_nickname = s_nickname;
}
	
	
	
	
	
}
