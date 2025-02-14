package com.puft.feb121.main;

import com.oreilly.servlet.MultipartRequest;

//Java 전세계적으로 많이 사용
//     개발자들이 본인이 만들어 놓은 것들을 공유!
//     소스 자체를 공유 X, .jar파일 만들어서 공유하는 문화
//     .jar파일을 자동으로 관리해주는 시스템 : Maven
//     Maven 중앙 저장소 : http://mvnrepository.com/

// Maven을 활용하면
//    Maven 중앙 저장소에 저장되어있는 .jar파일
//    컴퓨터의 Maven 로컬저장소 : C:/Users/sdedu/.m2/repository

//Maven 중앙저장소에 없는 것들 : 로컬 저장소를 활용하면 됨!
// DBManager, HttpClient, ...
// 프로젝트 우클릭 - configure - convert to Maven
// 그룹 id = 패키지이름
// 패키징 = jar
// pom.xml에서 라이브러리를 관리
// import - select - maven - artifact name

//-----------------------------------------
//Maven 로컬저장소 등록하는 방법
// 프로젝트 우클릭 => import => maven 검색
//     =>install or deploy ~~ 클릭
//  => Browse => 등록할 라이브러리 설정해서 넣기
//    => Group Id, Artifact Id 설정
//    => 버전은 마음대로 => packaging은 jar파일
// pom.xml => Dependencies 탭 클릭 => Add => Id로 검색 => 선택
//------------------------------------------------
// Maven Error
// => 이클립스 종료 => 로컬저장소 지우고 => 이클립스 재시동 => 
// => 자동으로 알아서 설치
// 로컬저장소 위치 : C:\Users\sdedu\.m2\repository
// But ! 개별적으로 등록해놨던 라이브러리는 알아서 설치되지 않음
// => 등록했던 방법으로 다시 등록해야함
//-----------------------------------------------

//오늘부터 이클립스 재시동시 꼭 해야하는 작업!!
// (이클립스 켜기 전에)
// Spring worskpace가 있는 폴더로 가서
// .metadata
//      .plugins
//            org.eclipse.datatools.sqltools.result 폴더 삭제
//    후에 이클립스 켜기

//-----------------------------------------------



public class MMain {
	public static void main(String[] args) {
		MultipartRequest mr;
	}
}
