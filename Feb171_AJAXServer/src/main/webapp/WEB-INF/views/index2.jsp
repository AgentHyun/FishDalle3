<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<script type = "text/javascript" src = "resources/jQuery.js"></script>
<script type="text/javascript">
$(function() {
    // AJAX 요청을 보내는 버튼 클릭
    $("#btn").click(function() {
        // AJAX 요청
        $.ajax({
            url: "fruit.getXML", // 서버에서 반환하는 XML URL
            success: function(asdf) {
                // XML 응답을 받아 처리
                $(asdf).find("fruit").each(function(i, f) {
                    let f_name = $(f).find("f_name").text();
                    let f_price = $(f).find("f_price").text();

                    let td1 = $("<td></td>").text(f_name);
                    let td2 = $("<td></td>").text(f_price);
                    let tr = $("<tr></tr>").append(td1, td2);
                    $("#fruitTbl").append(tr);
                });
            }
        });
    });

   
    $("#fruitSearchBtn").click(function() {
        let frVal = $("#fruitInput").val();
        if (frVal === "") {
            frVal = 0;
        }

        $.ajax({
            url: "fruit.searchXML", 
            data: { f_price: frVal },
            success: function(qwer) {
             
                $("#fruitTbl").empty();

           
                $(qwer).find("fruit").each(function(i, f) {
                    let f_name = $(f).find("f_name").text();
                    let f_price = $(f).find("f_price").text();

                    let td1 = $("<td></td>").text(f_name);
                    let td2 = $("<td></td>").text(f_price);
                    let tr = $("<tr></tr>").append(td1, td2);
                    $("#fruitTbl").append(tr);
                });
            },
            error: function() {
        
                $("#fruitTbl").empty();
                $("#fruitTbl").append("<tr><td colspan='2'>오류가 났습니다!</td></tr>");
            }
        });
    });

    $("#fruitInput").keyup(function(e) {
        if (e.keyCode == 13) {
            $("#fruitTbl").empty();
            $("#fruitSearchBtn").trigger("click");
        }
    });
});
</script>



<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <table id = "fruitTbl" border = "1">
  </table>
  <hr>
 
  <input id = "fruitInput" name = "iInput"> <button id = "fruitSearchBtn">검색</button>

  <hr>
  <button id="btn">버튼</button>
  
 
  <hr>
</body>
</html>