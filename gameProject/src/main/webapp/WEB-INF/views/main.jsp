<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Hi+Melody&family=Jua&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <title>Fishing Game</title>
    <link rel="stylesheet" href="resources/css/game.css">
    <script type="text/javascript" src="resources/jQuery.js"></script>

    <script type="text/javascript">
        let sellMode = false;
        let userMoney = 0;

        function toggleInventory() {
            $("#inventory").fadeToggle(500); 
        }

        function toggleUserInfo() {
            $("#inventory").fadeToggle(500); 
        }
        function toggleShop() {
            $("#Shop").fadeToggle(500); 
        }
        function showInfo(fishName, fishPrice, fishSize, event) {
        	 console.log("Fish Size: ", fishSize); 
        	var clickX = event.pageX; 
            var clickY = event.pageY;
            let selected = fishName;
            if ($("#info-modal").length > 0) {
                $("#info-modal").remove();
                return;
            }

            if (sellMode) {
                $.ajax({
                    url: '/game/sellFish',
                    type: 'POST',
                    data: { f_name: fishName, f_price: fishPrice, f_size: fishSize },
                    success: function(response) {
                    	$.ajax({
                    	    url: '/game/sellFish',
                    	    type: 'POST',
                    	    data: { f_name: fishName, f_price: fishPrice, f_size: fishSize },
                    	    success: function(response) {
                    	   
                    	        $.ajax({
                    	            url: '/game/getAllInventory',
                    	            type: 'GET',
                    	            success: function(response) {
                    	            	console.log("인벤토리 목록delete 갱신:", response); 
                    	                userMoney += fishPrice * (fishSize / 30);
                    	                $("#userMoney").html("💵 " + userMoney);
                    	                
                    	                $("#shop-money").html("💵 " + userMoney);
                    	                $("#userMoney").append("<button id='sell-btn' class='sell-btn'>🚚</button>");

                    	                $("#status").html(
                    	                    "<div class='sell-msg'>" +
                    	                    "<br>" + fishName + "(이)가 판매되었습니다!<br>" +
                    	                    "<br>판매가: " + Math.floor(fishPrice * (fishSize / 30)) +
                    	                    "<br><div class='sellMoney'><br>💵 " + Math.floor(userMoney) +
                    	                    "</div>" +
                    	                    "</div>"
                    	                );
                    	     
                    	            
                    	            },
                    	            error: function(xhr, status, error) {
                    	                console.error("인벤토리 목록 갱신 실패", error);
                    	            }
                    	        });
                    	    },
                    	    error: function(xhr, status, error) {
                    	        console.error("인벤토리 삭제 추가 실패", error);
                    	    }
                    	});

                    },
                    error: function(xhr, status, error) {
                        console.error("인벤토리 삭제 추가 실패", error);
                    }
                });
            }

            var infoHtml = 
                '<div class="info-modal" id="info-modal" style="' +
                    'display: none;' + 
                    'position: absolute; ' + 
                    'top: ' + clickY + 'px; ' +  
                    'left: ' + (clickX + 20) + 'px; ' + 
                    'text-align: center;' + 
                    'background-color: #6A9AB0;' + 
                    'padding: 20px; ' + 
                    'color: black; ' +
                    'border-radius: 10px; ' + 
                    'box-shadow: 0px 0px 10px rgba(0,0,0,0.3); ' + 
                    'font-family: \'Jua\', sans-serif;">' +
                    '<h2 class="info-title">' + fishName + '</h2>' +
                    '<p class="gold"> 💵' + Math.floor(fishPrice * (fishSize / 30)) + ' ₩ </p>' +
                    '<p class="size"> size: ' + fishSize + '</p>' + 
                    '<br><button class="close-btn" onclick="closeInfo()">✖️</button>' +
                '</div>';

            if (!sellMode) {
                $("body").append(infoHtml);
            }
            $("#info-modal").fadeIn(500); 
        }

        function closeInfo() {
            $("#info-modal").fadeOut(500, function() { 
                $(this).remove(); 
            });
        }

        $(function() {
            let topPosition = 500;
            let leftPosition = 1000;
            let gagePercent = 30; 
            let isFishing = false; 
            let canFightFishing = false; 
            let intervalId = null;
            let isFishingZone = false;

            $("#userMoney").html("💵 " + userMoney);
            $("#shop-money").html("💵 " + userMoney);
            $("#userMoney").append("<button id = 'sell-btn' class='sell-btn'>🚚</button>");
            $("#sell-btn").click(function() {
                sellMode = !sellMode;
                console.log("Sell Mode is now: " + sellMode); 
                if (sellMode) {
                    $("#sell-btn").css("background-color", "#B6FFA1");
                } else {
                    $("#sell-btn").css("background-color", "");
                }
            });


            $(document).keydown(function(e) {
                switch (e.keyCode) {
                    case 37:
                        leftPosition -= 15;
                        $("#down-img").attr("src", "resources/img/left.png");
                        break;
                    case 38:
                        topPosition -= 15;
                        $("#down-img").attr("src", "resources/img/up.png");
                        break;
                    case 39:
                        leftPosition += 15;
                        $("#down-img").attr("src", "resources/img/right.png");
                        break;
                    case 40:
                        topPosition += 15;
                        $("#down-img").attr("src", "resources/img/down.png");
                        break;
                }

                $("#down-img").stop().animate({
                    top: topPosition + "px",
                    left: leftPosition + "px"
                }, 100);

                let charPosition = $("#down-img").position();
                let charTop = charPosition.top;
                let charLeft = charPosition.left;
                $("#fight-fishing").css({
                    "top": (charPosition.top - 50) + "px", 
                    "left": charLeft + "px"
                });

                let sectionPosition = $(".fishing-section").position();
                let sectionTop = sectionPosition.top;
                let sectionLeft = sectionPosition.left;
                let sectionWidth = $(".fishing-section").width();
                let sectionHeight = $(".fishing-section").height();

                if (charLeft + 50 > sectionLeft && charLeft < sectionLeft + sectionWidth && charTop + 50 > sectionTop && charTop < sectionTop + sectionHeight) {
                    if (!isFishingZone) {
                        isFishingZone = true;
                        $("#status").html("<h3><span class='space-bar'> SpaceBar</span>누르면 낚시 시작</h3>");
                    }

                    $(document).one('keydown', function(e) {
                        if (e.keyCode === 32 && !isFishing && !canFightFishing) { 
                            isFishing = true;
                            $("#down-img").attr("src", "resources/img/fishing.png");
                            $("#status").html("<h3>🐟🐠🐡🐟🐠🐡</h3>");

                            let randomTime = Math.floor(Math.random() * (10000 - 5000 + 1)) + 5000;

                            setTimeout(function() {
                                $("#down-img").attr("src", "resources/img/catching.png").stop().animate({
                                    width: "10%",
                                    height: "10%",
                                    opacity: 1
                                }, 200, function() {
                                    $("#status").html("<h3><span class='space-bar'> SpaceBar</span>누르면 낚시 시작</h3>");
                                    $(this).stop().animate({
                                        width: "50px",
                                        height: "50px",
                                        opacity: 1
                                    }, 200, function() {
                                        $(document).one('keydown', function(e) {
                                            if (e.keyCode === 32) { 
                                                isFishing = false; 
                                                canFightFishing = true; 
                                                $("#fight-fishing").css("display", "block");
                                                gagePercent = 30;
                                                if (intervalId === null) {
                                                    intervalId = setInterval(function() {
                                                        if (gagePercent > 0) {
                                                            gagePercent -= 5; 
                                                            $("#gage").animate({
                                                                width: gagePercent + "%" 
                                                            }, 300);
                                                        }
                                                        if (gagePercent <= 30) {
                                                            $("#gage").css("background-color", "red");
                                                        } else if (gagePercent <= 70) {
                                                            $("#gage").css("background-color", "yellow");
                                                        } else {
                                                            $("#gage").css("background-color", "green");
                                                        }
                                                        $("#fight-fishing-dmg").text(gagePercent + "%")
                                                       
                                                        
                                                        if (gagePercent <= 0) {
                                                            clearInterval(intervalId);
                                                            intervalId = null; 
                                                            $("#fight-fishing").css("display", "none");
                                                            $("#status").html("<h3>놓쳤습니다😥</h3>");
                                                            isFishing = false;
                                                            canFightFishing = false;
                                                            gagePercent = 30;
                                                            $("#gage").css("width", gagePercent + "%");
                                                        }
                                                        if (gagePercent >= 100) {
                                                            isFishing = false; 
                                                            canFightFishing = false; 
                                                            gagePercent = 30;
                                                            clearInterval(intervalId);
                                                            intervalId = null; 
                                                            $("#fight-fishing").css("display", "none");
                                                            let randomNumber = Math.floor(Math.random() * (70 - 30 + 1)) + 30;
                                                            let randomNum = Math.floor(Math.random() * 5) + 1;
                                                            $.getJSON("fish.searchJSON?f_no=" + randomNum, function(zxc) {
                                                                $.each(zxc.fish, function(i, f) {
                                                                    $("#status").html("<h3>" + "<span class='blue'>" + f.f_name + "</span>" + "획득!" + " 💰<span class = 'gold'>" + f.f_price + "</span>" + " 크기 : " + randomNumber + "</h3>");
                                                                    $.ajax({
                                                                        url: '/game/insertInventory',
                                                                        type: 'POST',
                                                                        data: { f_name: f.f_name, f_price: f.f_price , f_size : randomNumber},
                                                                        success: function(response) {
                                                                        	  console.log("Insert Inventory 성공:", response);
                                                                            $.ajax({
                                                                                url: '/game/getAllInventory', 
                                                                                type: 'GET',
                                                                                
                                                                                success: function(response) {
                                                                                	console.log("물고기 사이즈:",  randomNumber); 
                                                                                  
                                                                                    $(".fish-img").css("width",  randomNumber);
                                                                                    $(".fish-img").css("height",  randomNumber);
                                                                                    $(".catched-fish").css("border", "none");
                                                                                    $("#added-td").append(
                                                                                        "<img id='catched-fish-" + f.f_name + "' class='catched-fish' src='resources/img/" + f.f_name + ".png' onclick='showInfo(\"" + f.f_name + "\", \"" + f.f_price + "\", \"" +  randomNumber + "\", event)' />"
                                                                                    );
                                                                                    console.log("추가된 이미지:", '#catched-fish-' + f.f_name +  f.f_price + f.f_size ); 
                                                                                    $("#catched-fish-" + f.f_name).css("border", "yellow 2px solid");
                                                                                    $("#catched-fish-" + f.f_name).css("width", randomNumber + "px");
                                                                                    $("#catched-fish-" + f.f_name).css("height", randomNumber + "px");
                                                                                },
                                                                                error: function(xhr, status, error) {
                                                                                    console.error("인벤토리 목록 갱신 실패", error);
                                                                                }
                                                                            });
                                                                        },
                                                                        error: function(xhr, status, error) {
                                                                            console.error("인벤토리 항목 추가 실패", error);
                                                                        }
                                                                    });
                                                                });
                                                            });
                                                        }

                                                    }, 600);
                                                }
                                            }
                                        });
                                    });
                                });
                            }, randomTime);
                        }
                    });
                } else {
                    if (isFishingZone) {
                        isFishingZone = false;
                        $("#down-img").css("width", "50px");
                        $("#down-img").css("height", "50px");
                        $("#status").html("<h3>낚시하기 좋은 날씨네요 🌞</h3>");
                    }
                }
            });

            $(document).keydown(function(e) {
                if (canFightFishing) {
                    if (e.keyCode === 65) { 
                        gagePercent += 3; 
                        $("#akey").css("opacity", "0.5");
                    } else if(e.keyCode === 83 && !isFishing){
                        gagePercent += 3;
                        $("#skey").css("opacity", "0.5");
                    }
                }
            });

            $(document).keyup(function(e) {
                if (canFightFishing) {
                    if (e.keyCode === 65) { 
                        $("#akey").css("opacity", "1");
                    } else if (e.keyCode === 83) { 
                        $("#skey").css("opacity", "1");
                    }
                }
            });

            let isInventory = false;
            let isUserInfo = false;
            let isShop = false;
            $(document).keydown(function(e) {
                if (e.keyCode == 69) { 
                    isInventory = !isInventory;
                    if (isInventory) {
                        $("#inventory").fadeIn();
                    } else {
                        $("#inventory").fadeOut();
                    }
                }
          
                if (e.keyCode == 85) {  
                    isUserInfo = !isUserInfo;
                    if (isUserInfo) {
                        $("#UserInfo").fadeIn();
                    } else {
                        $("#UserInfo").fadeOut();
                    }
                }
             
                    if (event.keyCode === 80) { 
                    	isShop = !isShop;
                    	if(isShop){
                    	   $("#Shop").fadeIn();
                    	}
                    else {
                        $("#Shop").fadeOut();
                    }
                    }
             
            
               
            
            });
            
         
            
        });
    </script>

</head>
<body>

<img id="down-img" class="down-img" src="resources/img/down.png" alt="다운 이미지">
<div class="fishing-section"><h4>낚시 가능 구역</h4></div>
<div class="status" id="status">           </div>
<div class="price" id="price"></div>
<div class="fight-fishing" id="fight-fishing">
    <div class="gage" id="gage">
        <div id="fight-fishing-dmg">     </div>
    </div>
    <img id="akey" src="resources/img/akey.png"> 
    <img id="skey" src="resources/img/skey.png">
</div>
<div class="left-bar">
    <div class="inventory-menu" onclick="toggleInventory()">🎣 <br>인벤토리<strong>[E]</strong></div>
        <div class="inventory-menu" onclick="toggleUserInfo()">🧑‍ <br>유저<strong>[U]</strong></div>
          <div class="inventory-menu" onclick="toggleShop()">🏬‍ <br>상점<strong>[P]</strong></div>
</div>

<div id="inventory" class="inventory" style="display:none;">
    <table class="inventory-tbl" id="inventory-tbl">
        <tr><th><h2>Inventory 🎒</h2></th></tr>
        <c:set var="itemsPerRow" value="4" /> <!-- 한 줄에 표시할 아이템 수 -->
        <c:set var="itemCount" value="0" /> <!-- 아이템 카운트 초기화 -->

        <tr>
            <c:forEach var="f" items="${inventoryList}">
                <c:set var="count" value="${inventoryCount[f.f_name] != null ? inventoryCount[f.f_name] : 0}" />
           
                <c:if test="${itemCount % itemsPerRow == 0 && itemCount > 0}">
                    </tr>
                    
                    
                    <tr> 
                </c:if>
          <td class='" + "catched" + "'>
    <img class="fish-img" id="fish-img" src="resources/img/${f.f_name}.png" 
         style="width: ${f.f_size}px; height: ${f.f_size}px"
         onclick="showInfo('${f.f_name}', '${f.f_price}', '${f.f_size}', event)" />
         
         

</td>


                <td id = "added-td">
       
                </td>
                <c:set var="itemCount" value="${itemCount + 1}" /> 
            </c:forEach>
            <div id = "add"></div>
            
        </tr>
        <tr>
        <td id = "userMoney">
        
        </td>
        </tr>
    </table>
</div>
<div id="UserInfo" class="UserInfo" style="display:none;">
<table id = "UserInfoTbl" class = "UserInfoTbl">
<tr><div class = "user-title">Status 🧑‍</div></tr>
<tr>
<td class = "user-td">
    User : <br><br>
</td>

</tr>

<tr>
<td class = "user-td">
    전투력 : 3 <br><br><br><br>
</td>
</tr>


</table>

</div>


<div id="Shop" class="Shop" style="display:none;">
<table id = "ShopTbl" class = "ShopTbl">
<tr><div class = "user-title">Shop👩‍💼‍</div></tr>
<div class = "shop-section">
<tr>
<div class = "rod-section">
<td>

<img class = "fishing-rod" src = "resources/img/낡은.png"/><p>낡은 낚시대 </p><p>3000₩</p></td></div>
<div class = "rod-section">
 <td><img class = "fishing-rod" src = "resources/img/좋은.png"/><p>좋은 낚시대 </p><p>5000₩</p></td>
  </div>
  <div class = "rod-section">
  <td> <img class = "fishing-rod" src = "resources/img/대단한.png"/><p>대단한 낚시대 </p><p>8000₩</p></td>
</div>
<div class = "rod-section">
<td>

<img  class = "fishing-rod" src = "resources/img/이상한.png"/><p>이상한 낚시대 </p><p>10000₩</p></td> </div></tr>


<tr><td><img src = "resources/img/luckybox.png" class = "lotto-img">
<p>🍀5000₩🍀</p>
</td></tr>

<tr><td  id = "shop-money"> </td></tr>


</div>


</table>

</div>

</body>
</html>