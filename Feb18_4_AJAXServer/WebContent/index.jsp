<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type = "text/javascript" src = "jQuery.js"></script>
<script type="text/javascript">
$(function() {
  $("button").click(function() {
    let iVal = $("input").val();
    $.ajax({
      url: "https://dapi.kakao.com/v3/search/book",
      data: { query: iVal },
      beforeSend: function(req) {
        req.setRequestHeader("Authorization", "KakaoAK 8d2e282a4bd0da67042f8cfcf8ac3a51");
      },
      success: function(bookJSON) {
        
    	  
    	  
    	  $("table").empty(); 
     
        $("table").append(
          "<tr><th>썸네일</th><th>제목</th><th>출판사</th><th>정가</th><th>판매가</th></tr>"
        );
      
        $.each(bookJSON.documents, function(i, e) {
           
          	let tdimg = "<img src = " + e.thumbnail + ">";
        	let td1 = $("<td></td>").html(tdimg);
  
          let td2 = $("<td></td>").text(e.title);
          let td3 = $("<td></td>").text(e.publisher);
          let td4 = $("<td></td>").text(e.price + "원");
          let td5 = $("<td></td>").text(e.sale_price + "원");
          let tr = $("<tr></tr>").append(td1, td2, td3, td4, td5);
          $("table").append(tr);
        });
      },
      
    });
  });
});
</script>
</head>
<body>
    <input> <button>찾기</button>
    <hr>
    <table border = "1"></table>
</body>
</html>