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
    <script type="text/javascript" src="resources/js/jQuery.js"></script>

    <script type="text/javascript">
        let sellMode = false;
        let userMoney = 0;
        let rodDamage = 0;
        let damage = 0;

        function toggleInventory() {
            $("#inventory").fadeToggle(500); 
        }

        function toggleUserInfo() {
            $("#UserInfo").fadeToggle(500); 
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
                    '<p class = "mustard"> 💵' + Math.floor(fishPrice * (fishSize / 30)) + ' ₩ </p>' +
                    '<p class="size"> size: ' + fishSize + '</p>' + 
                    '<br><button class="close-btn" onclick="closeInfo()">✖️</button>' +
                '</div>';

            if (sellMode) {
                $.ajax({
                    url: '/game/sellFish',
                    type: 'POST',
                    data: { f_name: fishName, f_price: fishPrice, f_size: fishSize },
                    success: function(response) {
                        fishName = fishName.trim();
                        console.log("사이즈" + fishSize);
                        console.log("이름" + fishName);
                        var fishId = "#catched-fish-" + fishName + fishSize;
                        console.log("삭제할 ID: ", fishId);
                        $(fishId).remove();
                        $("#fish-img-" + fishName + fishSize).remove();
                        updateInventory(fishPrice, fishSize, fishName);
                       
                     
                        console.log("Sell Mode after AJAX: " + sellMode);
                    },
                    error: function(xhr, status, error) {
                        console.error("인벤토리 삭제 실패", error);
                    }
                });
            }else{

                $("body").append(infoHtml);
            }


         


            
            $("#info-modal").fadeIn(500); 
        }

        function updateInventory(fishPrice, fishSize, fishName) {
            $.ajax({
                url: '/game/getAllInventory',
                type: 'GET',
                success: function(response) {
                    console.log("판매 후 인벤토리 목록 갱신:", response); 
                   
                    userMoney += Math.floor( fishPrice * (fishSize / 30));
                    $("#userMoney").html("💵 " + userMoney);
                    $("#shop-money").html("💵 " + userMoney);
      
           
                    $("#status").html(
                    	    "<div class='sell-msg'>" +
                    	    "<br><img src='resources/img/Fish/" + fishName + ".png' width='30' height='30'>(이)가 판매되었습니다!<br>" +
             
                    	    "<div class='sellMoney'><br>💵 " + Math.floor(userMoney) + "</div>" +
                    	    "</div>"
                    	);

                },
                error: function(xhr, status, error) {
                    console.error("판매 후 인벤토리 목록 갱신 실패", error);
                }
            });
        }


        function closeInfo() {
            $("#info-modal").fadeOut(500, function() { 
                $(this).remove(); 
            });
        }

        function buyOld() {
            const rodName = "낡은";
            const rodPrice = 3000;
            rodDamage = 1;
            damage += rodDamage;
            if (userMoney >= rodPrice) {
                userMoney -= rodPrice;
                $("#userMoney").html("💵 " + userMoney);
                $("#shop-money").html("💵 " + userMoney);
                updateShop(rodName, rodPrice, rodDamage);
                $("#status").html("<h3><span class='gold'>" + rodName + "</span> 낚싯대를 구입했습니다!</h3>");
                $("#damage-td").html("💪전투력 : " + rodDamage);
                $("#rod-td").html(rodName + "낚싯대 착용중");
            } else {
                $("#status").html("<h3><span class='green'>돈</span>이 부족합니다🙉</h3>");
            }
        }

        
        function buyGood() {
            const rodName = "좋은";
            const rodPrice = 5000;
           rodDamage = 2;
           damage += rodDamage;
            if (userMoney >= rodPrice) {
                userMoney -= rodPrice;
                $("#userMoney").html("💵 " + userMoney);
                $("#shop-money").html("💵 " + userMoney);
                updateShop(rodName, rodPrice, rodDamage);
                $("#status").html("<h3><span class='gold'>" + rodName + "</span> 낚싯대를 구입했습니다!</h3>");
                $("#damage-td").html("💪전투력 : " + rodDamage);
                $("#rod-td").html(rodName + "낚싯대 착용중");
            } else {
                $("#status").html("<h3><span class='green'>돈</span>이 부족합니다🙉🙉</h3>");
            }
        }

        function buyLotto() {
            if (userMoney >= 5000) {
                userMoney -= 5000;
            
                let RandomMoney = Math.floor(Math.random() * (10000 - 0 + 1)) + 1000;
                userMoney += RandomMoney;
                $("#userMoney").html("💵 " + userMoney);
                $("#shop-money").html("💵 " + userMoney);
                
                $("#status").html("<h3>럭키비키 😽 <span class='green'>" + RandomMoney + "</span>원을 얻었습니다!</h3>");
                
            } else {
                $("#status").html("<h3><span class='gold'>탕진</span>하신 것 같은데요!?</h3>");
            }
        }

        function buyAwesome() {
            const rodName = "대단한";
            const rodPrice = 8000;
            damage += rodDamage;
           rodDamage = Math.floor(Math.random() * (5 - 3 + 1)) + 3; // 3~5 랜덤

            if (userMoney >= rodPrice) {
                userMoney -= rodPrice;
                $("#userMoney").html("💵 " + userMoney);
                $("#shop-money").html("💵 " + userMoney);
                updateShop(rodName, rodPrice, rodDamage);
                $("#status").html("<h3><span class='gold'>" + rodName + "</span> 낚싯대를 구입했습니다! (데미지: " + rodDamage + ")</h3>");
                $("#damage-td").html("💪전투력 : " + rodDamage);
                $("#rod-td").html(rodName + "낚싯대 착용중");
            } else {
                $("#status").html("<h3><span class='green'>돈</span>이 부족합니다🙉🙉🙉</h3>");
            }
        }


        function buyStrange() {

            const rodName = "이상한";
            const rodPrice = 10000;
            damage += rodDamage;
            rodDamage = Math.floor(Math.random() * (5 - 3 + 1)) + 3;
           

            if(userMoney > 10000){
            	updateShop(rodName, rodPrice, rodDamage);
            	$("#status").html("<h3><span class = 'gold'>"+rodName +"</span> 낚싯대를 구입했습니다!</h3>");
            	$("#damage-td").html("💪전투력 : " + rodDamage);
            	$("#rod-td").html(rodName + "낚싯대 착용중");
     
                }else{
                	$("#status").html("<h3><span class = 'green'>돈</span>이 부족합니다🙉🙉🙉🙉</h3>");
                }
        }

        function updateShop(rodName,rodPrice, rodDamage) {

            $.ajax({
                url: '/game/buyRod',
                type: 'POST',
                data: { r_name: rodName, r_price: rodPrice, r_damage : rodDamage },
                success: function(response) {
              
                    userMoney -= rodPrice;
                    console.log("유저 돈 " + userMoney);
                    $("#userMoney").html("💵 " + userMoney);
                    $("#shop-money").html("💵 " + userMoney);
                    $("#status").html(
                        "<div class='sell-msg'>" +
                        "<img src='resources/img/" + rodName + ".png' width='50px' height='50px'>" + 
                        "<br>" + "<span class = 'blue'>" + rodName+ "</span>" + "낚싯대가 구입되었습니다!<br>" + //css추가
                        "<br>구매가: " + "<span class = 'red'>" + rodPrice+ "</span>" +
                        "<br><div class='sellMoney'><br>💵 " + Math.floor(userMoney) +
                        "</div>" +
                        "</div>"
                    );
                    $("#fight-fishing").append("<h4>userDmg</h4>");
                },
                error: function(xhr, status, error) {
                    console.error("구입 실패", error);
                }
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
            $("#sell-button").html("<button id = 'sell-btn' class='sell-btn'>🚚</button>");
           
            $("#sell-btn").click(function() {
               console.log(sellMode);
            	if (sellMode) {  
                	sellMode = false; 
                	$("#sell-btn").css("background-color", "transparent");
                   
                } else {
                	sellMode = true;
                	  $("#sell-btn").css("background-color", "#B6FFA1"); 
                }
            });
            $.ajax({
                url: '/game/getAllInventory', 
                type: 'GET',
                
                success: function(response) {
               
               
            
                  
                
              
                },
                error: function(xhr, status, error) {
                    console.error("인벤토리 목록 갱신 실패", error);
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
                        $("#fishing-section").css("border","4px solid #578FCA");
                        $("#fishing-section-h4").css("color","#D1F8EF");
                        $("#status").html("<h3><span class='space-bar'> SpaceBar</span>누르면 낚시 시작</h3>");
                    }

                    $(document).one('keydown', function(e) {
                        if ((e.keyCode === 32 || e.keyCode === 69) && !isFishing && !canFightFishing) { 
                            isFishing = true;
                            $("#down-img").attr("src", "resources/img/fishing.png");
                            $("#status").css("background-color", "#578FCA");
                            $("#status").html("");
                            
                            $("#status").append("<div class = 'catching-msg'><h3 class = 'fish-typing'>🐟</h3>");
                            
                            $("#status").append("<h3 class = 'fish-typing2'>🦑</h3>");
                            $("#status").append("<h3 class = 'fish-typing2'>🐠</h3>");
                     
                            $("#status").append("<h3 class = 'fish-typing3'>    🦀</h3>");
                            $("#status").append("<h3 class = 'fish-typing3'>           🦐</h3>");
                            $("#status").append("<h3 class = 'fish-typing3'>🐡</h3></div>");
                            $("#status").css("background-image", "url('resources/img/background/fishing-sea.jpg')");
                            $("#status").css("background-size", "100%");
                            $("#status").css("background-repeat", "no-repeat;");

                            
                        

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
                                                $("#fight-fishing").append("<h4>0</h4>");
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
                                                           
                                               
                                                            let randomNum = Math.floor(Math.random() * 12) + 1;

                                                            $.ajax({
                                                                url: "fish.searchJSON?f_no=" + randomNum, 
                                                                type: "GET",
                                                                success: function(zxc) {
                                                                    $.each(zxc.fish, function(i, f) {
                                                                        let randomNumber = Math.floor(Math.random() * (70 - 30 + 1)) + 30;
                                                                        $("#status").css("background-image", "url('resources/img/background/status.png')");
                                                                        $("#status").html("<h3>" + "<span class='blue'>" + f.f_name + "</span>" + "획득!" + " 💰<span class = 'gold'>" + Math.floor(f.f_price * (randomNumber / 30)) + "</span>" + " 크기 : " + randomNumber + "</h3>");
                                                                        
                                                                
                                                                        $.ajax({
                                                                            url: '/game/insertInventory',
                                                                            type: 'POST',
                                                                            data: { f_name: f.f_name, f_price: f.f_price, f_size: randomNumber },
                                                                            success: function(response) {
                                                                                console.log("Insert Inventory 성공:", response);
                                                                                
                                                                            
                                                                                $.ajax({
                                                                                    url: '/game/getAllInventory', 
                                                                                    type: 'GET',
                                                                                    success: function(response) {
                                                                                        console.log("물고기 사이즈:", randomNumber); 

                                                                                        $(".fish-img").css("width", randomNumber);
                                                                                        $(".fish-img").css("height", randomNumber);
                                                                                        $(".catched-fish").css("border", "none");

                                                                                        
                                                                                        $("#fish-list").append(
                                                                                        	    "<img id='catched-fish-" + f.f_name + randomNumber+ "' class='catched-fish' src='resources/img/Fish/" + f.f_name + ".png' onclick='showInfo(\"" + f.f_name + "\", \"" + f.f_price + "\", \"" + randomNumber + "\", event)' />"
                                                                                        	);


                                                                                        console.log("추가된 이미지:", '#catched-fish-' + f.f_name + randomNumber); 

                                                                                        $("#catched-fish-" + f.f_name).css("border", "yellow 2px solid");
                                                                                        $("#catched-fish-" + f.f_name + randomNumber).css("width", randomNumber + "px");
                                                                                        $("#catched-fish-" + f.f_name + randomNumber).css("height", randomNumber + "px");
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
                                                                },
                                                                error: function(xhr, status, error) {
                                                                    console.error("물고기 검색 실패", error);
                                                                }
                                                            });

                                                        }

                                                    }, 600);
                                                }
                                            }
                                        });
                                    });
                                });
                            }, randomTime);
                        
                        isFishing = false;
                    
                        }
                    });
                } else {
                    if (isFishingZone) {
                        isFishingZone = false;
                        $("#down-img").css("width", "50px");
                        $("#down-img").css("height", "50px");
                        $("#fishing-section").css("border","2px solid white");
                        $("#fishing-section-h4").css("color","white");
                        $("#status").html("<h3>낚시하기 좋은 날씨네요 🌞</h3>");
                    }
                }
            });

            
          
            $(document).keydown(function(e) {
                if (canFightFishing) {
                    if (e.keyCode === 65) { 
                        gagePercent = gagePercent + 3 + rodDamage; 
                        $("#akey").css("opacity", "0.5");
                    } else if(e.keyCode === 83 && !isFishing){
                        gagePercent =  gagePercent + 3 + rodDamage;
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
<div class="fishing-section" id = "fishing-section"><h4 id = "fishing-section-h4">낚시 가능 구역</h4></div>
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
        <c:set var="itemsPerRow" value="4" /> 
        <c:set var="itemCount" value="0" /> 

        <tr>
            <c:forEach var="f" items="${inventoryList}">
                <c:set var="count" value="${inventoryCount[f.f_name] != null ? inventoryCount[f.f_name] : 0}" />
           
                <c:if test="${itemCount % itemsPerRow == 0 && itemCount > 0}">
                    </tr>
                    
                    
                    <tr> 
                </c:if>
          <td class='" + "catched" + "' id = "fish-list">
   <div id = "fish-img">
  <img class="fish-img" id="fish-img-${f.f_name}${f.f_size}" 
    src="resources/img/Fish/${f.f_name}.png" 
    style="width: ${f.f_size}px; height: ${f.f_size}px"
    onclick="showInfo('${f.f_name}', '${f.f_price}', '${f.f_size}', event)" />

        </div> 
         

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
        <td id = "sell-button">
        </td>
        </tr>
    </table>
</div>
<div id="UserInfo" class="UserInfo" style="display:none;">
<table id = "UserInfoTbl" class = "UserInfoTbl">
<tr><img src = "resources/img/down.png" width = "90px" height = "110px" class = "Profile"></tr>
<tr>
<td class = "user-td">
    User : <span class = "id">${ID}</span><br><br>
</td>

</tr>

<tr>
<td class = "user-td" id = "rod-td">
    <div class = "user-text">장비 없음💸 </div> <br><br><br><br>
</td>
</tr>



<tr>
<td class = "user-td" id = "damage-td">
   <div class = "user-text"> 전투력 : 0 </div><br><br><br><br>
</td>
</tr>


</table>

</div>


<div id="Shop" class="Shop" style="display:none;">
<table id = "ShopTbl" class = "ShopTbl">
<tr><div class = "user-title">Shop👩‍</div></tr>
<div class = "shop-section">
<tr>
<div class = "rod-section">
<td>

<img class = "fishing-rod" src = "resources/img/rod/낡은.png" onclick = "buyOld();"/><p>낡은 낚싯대 </p><p>3000₩</p></td></div>
<div class = "rod-section">
 <td><img class = "fishing-rod" src = "resources/img/rod/좋은.png" onclick = "buyGood();"/><p>좋은 낚싯대 </p><p>5000₩</p></td>
  </div>
  <div class = "rod-section">
  <td> <img class = "fishing-rod" src = "resources/img/rod/대단한.png" onclick = "buyAwesome();"/><p>대단한 낚싯대 </p><p>8000₩</p></td>
</div>
<div class = "rod-section">
<td>

<img  class = "fishing-rod" src = "resources/img/rod/이상한.png" onclick = "buyStrange();"/><p>이상한 낚싯대 </p><p>10000₩</p></td> </div></tr>


<tr><td><img src = "resources/img/rod/luckybox.png" class = "lotto-img" onclick = "buyLotto();"/>
<p>🍀5000₩🍀</p>
</td>


</tr>

<tr><td  id = "shop-money"> </td></tr>


</div>


</table>

</div>

</body>
</html>