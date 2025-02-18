<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type = "text/javascript" src = "resources/jQuery.js"></script>
<script type = "text/javascript">
$(function (){
/* zxc = 문서전체 */
	$("button").click(function(){
		let iVal = $("input").val();
		$.getJSON("error.searchJSON?e_what=" + iVal, function(zxc){
			$("table").empty();
			$.each(zxc.error, function(i, e){
				
				
				let td1 = $("<td></td>").text(e.e_what);
				let td2 = $("<td></td>").text(e.e_where);
				let tr = $("<tr></tr>").append(td1,td2);
				$("table").append(tr);
				
				
			});
			
			
			
		});
		
	});
		
		
		
	});
	
	/* $.ajax({
		url : "error.getJSON",
		success: function(zxc){
			
			alert(JSON.stringify(zxc));
		}});
	
	$.("button").click(function(){    
	$.getJSON("error.searchError", function(zxc){
		let iInput = $("input").val();
		let ar = zxc.error;
		data: { e_what: iInput }
		$.each(ar, function(i,e){
			let td1 = $("<td></td>").text(e.e_what);
			let td2 = $("<td></td>").text(e.e_where);
			let tr = $("<tr></tr>").append(td1,td2);
			$("table").append(tr);
			
		});
	};
	
	});
	
	
	
	
	
	
	}); */
	
	//JSON으로 AJAX하기 간단한 ver.
	//$.getJSON("요청주소", 값을 받아오는데 성공하면 발동하는 콜백함수)
	/* $.getJSON("error.getJSON", function(zxc){
		//alert(JSON.stringify(zxc));
		
		let ar = zxc.error;
		//alert(ar[0].e_where);
		
		//jQuery의 반복문 - 배열을 대상으로
		 $.each(ar, function(i,e){
			let td1 = $("<td></td>").text(e.e_what);
			let td2 = $("<td></td>").text(e.e_where);
			let tr = $("<tr></tr>").append(td1,td2);
			$("table").append(tr);
			
		});
		 
		
		$("button").click(function(){
			
			$("table").empty();
			let ar = zxc.error;
			let iInput = $("input").val();
			alert(iInput);
			$.each(ar, function(i,e){
				if(iInput === e.e_what){
				
				let td1 = $("<td></td>").text(e.e_what);
				let td2 = $("<td></td>").text(e.e_where);
				let tr = $("<tr></tr>").append(td1,td2);
				$("table").append(tr);
				}
			});
			
			
		});
		
		
		
		
		
		
	});
	
	 */
	
	
	//버튼을 클릭했을 때
	// => input에 입력한 e_what에 대한 내용이
	// error테이블에 포함되어 있으면
	// 그데이터를 <table>의 형태로 출력
	
	  


</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


   <input> <button>button</button>
   <table border = "1"></table>
</body>
</html>