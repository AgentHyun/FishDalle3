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

        
        
        
        // onclick 이벤트
        function toggleInventory() {
            $("#inventory").fadeToggle(500); 
        }

        function toggleUserInfo() {
            $("#UserInfo").fadeToggle(500); 
        }
        function toggleShop() {
            $("#Shop").fadeToggle(500); 
        }
      function toggleRecovery(){
    	  $("#status").css("background-image", "url('resources/img/background/status.png')");
    	  
      }  
      function toggleBlack(){
    	  
    	  $("h3").css("color", "black");
      }
      function toggleWhite(){
    	  $("h3").css("color", "white");
    	  
      }  
     function toggleNight(){
    	  $("body").css("filter", "brightness(85%)");
    	  $("body").css("background-image", "url('resources/img/background/lake_night.jpg')");
    	  $("body").css("background-color", "black");
          $("body").css("background-size", "cover");
     }
      

      
      function toggleMorning(){
    	     $("body").css("filter", "brightness(100%)");

    	  	  $("body").css("background-image", "url('resources/img/background/lake.jpg')");
    	  	  $("body").css("background-color", "none");

     }
       
        
        //인벤토리 내 물고기 클릭시 showInfo 메소드 실행
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

                
            //인벤토리 내 택배 아이콘을 누르면 sellMode가 되고
            //sellMode인 상태에서 물고기를 누르면 showInfor가 아닌 판매 로직 진행
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
                        
                        //판매 성공 후 인벤토리 갱신
                        updateInventory(fishPrice, fishSize, fishName);
                       
                     
     
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

        //판매 후 실행할 메소드
        function updateInventory(fishPrice, fishSize, fishName) {
            $.ajax({
                url: '/game/getAllInventory',
                type: 'GET',
                success: function(response) {
                    console.log("판매 후 인벤토리 목록 갱신:", response); 
                   
                    
                    //물고기의 가격은 사이즈 별마다 다르게 책정
                    userMoney += Math.floor( fishPrice * (fishSize / 30));
                    $("#userMoney").html("💵 " + userMoney);
                    $("#shop-money").html("💵 " + userMoney);
      
                    //판매 후 메세지 출력
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
        
        
        //낚시대 구입 메소드
        function buyOld() {
            const rodName = "낡은";
            const rodPrice = 3000;
            rodDamage = 1;
            damage += rodDamage; //유저 데미지에 구입한 낚시대의 데미지를 추가
            if ((userMoney - rodPrice) >= 0) {
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
            if ((userMoney - rodPrice) >= 0) {
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
        //로또 구입 메소드 가격 : 5000 (0 ~ 10000)까지 랜덤 머니 획득
        function buyLotto() {
            if ((userMoney - 5000) >= 0) {
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
           rodDamage =  3; 

            if ((userMoney - rodPrice) >= 0) {
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
            rodDamage = Math.floor(Math.random() * (5 - 3 + 1)) + 3; //이상한 낚시대의 데미지는 (3~5)
           

            if((userMoney - rodPrice) >= 0){
            	updateShop(rodName, rodPrice, rodDamage);
            	$("#status").html("<h3><span class = 'gold'>"+rodName +"</span> 낚싯대를 구입했습니다!</h3>");
            	$("#damage-td").html("💪전투력 : " + rodDamage);
            	$("#rod-td").html(rodName + "낚싯대 착용중");
     
                }else{
                	$("#status").html("<h3><span class = 'green'>돈</span>이 부족합니다🙉🙉🙉🙉</h3>");
                }
        }

        //구입 요청 메소드
        function updateShop(rodName,rodPrice, rodDamage) {

            $.ajax({
                url: '/game/buyRod',
                type: 'POST',
                data: { r_name: rodName, r_price: rodPrice, r_damage : rodDamage },
                success: function(response) {
              
                   
                    console.log("유저 돈 " + userMoney);
                    
                    $("#userMoney").html("💵 " + userMoney);
                    $("#shop-money").html("💵 " + userMoney);
                    $("#status").html(
                        "<div class='sell-msg'>" +
                        "<img src='resources/img/rod/" + rodName + ".png' width='50px' height='50px'>" + 
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
            let gagePercent = 30; //기본 게이지는 30
            
            
            let isFishing = false; // 낚시 중인가? 
            let canFightFishing = false;  // 캐스팅 중인가?(can을 잘못표시)
            let intervalId = null; //반복 상태 관리
            let isFishingZone = false; //Fishing존에 들어갔는가?

            $("#userMoney").html("💵 " + userMoney);
            $("#shop-money").html("💵 " + userMoney);
            $("#sell-button").html("<button id = 'sell-btn' class='sell-btn'>🚚</button>");
           
            $("#sell-btn").click(function() { //택배 아이콘 클릭시
               console.log(sellMode);
            	if (sellMode) {  
                	sellMode = false; 
                	$("#sell-btn").css("background-color", "transparent");
                   
                } else {
                	sellMode = true;
                	  $("#sell-btn").css("background-color", "#B6FFA1"); 
                }
            });
            
            //인벤토리 갱신
            $.ajax({
                url: '/game/getAllInventory', 
                type: 'GET',
                success: function(response) {
          },
                error: function(xhr, status, error) {
                    console.error("인벤토리 목록 갱신 실패", error);
                }
            });

            
            //캐릭터 이동 이벤트
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
                
                //fishing-section의 크기를 가져와서
                if (charLeft + 50 > sectionLeft && charLeft < sectionLeft + sectionWidth && charTop + 50 > sectionTop && charTop < sectionTop + sectionHeight) {
                    if (!isFishingZone) {
                    	//피싱존에 들어왔을 때
                        isFishingZone = true;
                        $("#fishing-section").css("border","4px solid #578FCA");
                        $("#fishing-section-h4").css("color","#D1F8EF");
                        $("#status").html("<h3><span class='space-bar'> SpaceBar</span>누르면 낚시 시작</h3>");
                    }

                    $(document).one('keydown', function(e) {
                        if ((e.keyCode === 32) && !isFishing && !canFightFishing) { 
                        	//스페이스바를 누르면 낚시 시작
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
                            //$("#status").css("background-image", "url('resources/img/background/fishing-sea.jpg')");
                           $("#status").css("background-image", "url('resources/img/background/sea-in.jpg')");
                            $("#status").css("background-color", "#0A3981");
                            
                            $("#status").css("background-size", "cover");
                            $("#status").css("background-repeat", "no-repeat;");

                            
                        

                            let randomTime = Math.floor(Math.random() * (10000 - 5000 + 1)) + 5000;

                            setTimeout(function() {
                                $("#down-img").attr("src", "resources/img/catching.png").stop().animate({
                                    width: "10%",
                                    height: "10%",
                                    opacity: 1
                                }, 200, function() {
                                    $("#status").html("<h3><span class='Enter'>Enter ⏎ </span>누르면 캐스팅 시작</h3>");
                                    $(this).stop().animate({
                                        width: "50px",
                                        height: "50px",
                                        opacity: 1
                                    }, 200, function() {
                                        $(document).one('keydown', function(e) {
                                            if (e.keyCode === 13) { //엔터키
                                          
                                            	 $("#status").html("");
                                                 
                                                 $("#status").append("<div class = 'catching-msg'><h3 class = 'fish-typing4'>🎣</h3><h3 class = 'fish-typing5'>🎣</h3>");
                                                 
                                                 $("#status").append("<h3 class = 'fish-typing2'>🦈 </h3>");
                                                 $("#status").append("<h3 class = 'fish-typing2'>🐳</h3>");
                                          
                                                 $("#status").append("<h3 class = 'fish-typing3'>   🦑 </h3>");
                                                 $("#status").append("<h3 class = 'fish-typing3'>       🐡    </h3>");
                                                 $("#status").append("<h3 class = 'fish-typing3'>🐢</h3></div>");
                                                $("#fight-fishing").append("<h4>0</h4>");
                                                isFishing = false; 
                                                canFightFishing = true; 
                                                $("#fight-fishing").css("display", "block"); 
                                                gagePercent = 30; //캐스팅 게이지 초기화
                                                if (intervalId === null) {
                                                    intervalId = setInterval(function() {
                                                      
                                                    	if (gagePercent > 0) { //지속적으로 게이지 5씩 감소
                                                            gagePercent -= 8; 
                                                            $("#gage").animate({
                                                                width: gagePercent + "%" 
                                                            }, 300);
                                                            
                                                            $("#gage-img").animate({
                                                                marginLeft: gagePercent + "%" // 게이지 길이에 맞춰 그림자 이동
                                                            }, 300)
                                                            if (gagePercent > 70) {
                                                                $("#gage").css("background-color", "green"); 
                                                                $("#gage-section").html("");
                                                           
                                                                $("#gage-section").append("❤️"); 
                                          
                                                            }else if (gagePercent > 30) {
                                                                $("#gage").css("background-color", "yellow"); 
                                                                $("#gage-section").html("");
                                                                $("#gage-section").append("⚠️"); 
                                                          
                                                            }else if (gagePercent <= 30) {
                                                                $("#gage").css("background-color", "red"); 
                                                                $("#gage-section").html("");
                                                                $("#gage-section").append("🩹"); 
                                                          
                                                            }



                                                           
                                                        
                                                        }
                                                        
                                                        
                                                        //게이지 별 시각 효과
                                                        if (gagePercent <= 30) {
                                                            $("#gage").css("background-color", "red");
                                                        } else if (gagePercent <= 70) {
                                                            $("#gage").css("background-color", "yellow");
                                                        } else {
                                                            $("#gage").css("background-color", "green");
                                                        }
                                                        
                                                        
                                                        $("#fight-fishing-dmg").text(gagePercent + "%")
                                                       
                                                        //물고기 놓쳤을 때
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
                                                        
                                                        
                                                        //물고기 잡았을 때
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
                                                                        $("#status").html("<h3>" + "<span class='Enter'>" + f.f_name + "</span>" + "획득!" + " 💰<span class = 'gold'>" + Math.floor(f.f_price * (randomNumber / 30)) + "</span>" + " 크기 : " + randomNumber + "</h3>");
                                                                        
                                                                
                                                                        $.ajax({
                                                                            url: '/game/insertInventory',
                                                                            type: 'POST',
                                                                            data: { f_name: f.f_name, f_price: f.f_price, f_size: randomNumber },
                                                                            success: function(response) {
                                                                                console.log("Insert Inventory 성공:", response);
                                                                                $("#fish-list").append(
                                                                                	    "<img id='catched-fish-" + f.f_name + randomNumber+ "' class='catched-fish' src='resources/img/Fish/" + f.f_name + ".png' onclick='showInfo(\"" + f.f_name + "\", \"" + f.f_price + "\", \"" + randomNumber + "\", event)' />"
                                                                                	); 
                                                                                $("#catched-fish-" + f.f_name + randomNumber).css("border", "none");
                                                                                $.ajax({
                                                                                    url: '/game/getAllInventory', 
                                                                                    type: 'GET',
                                                                                    success: function(response) {
                                                                                        console.log("물고기 사이즈:", randomNumber); 

                                                                                        $(".fish-img").css("width", randomNumber);
                                                                                        $(".fish-img").css("height", randomNumber);
                                                                                        $(".catched-fish").css("border", "none");

                                                                                        //인벤토리에 id값이 각자 다른 물고기의 이미지를 추가
                                                                                 


                                                                                        console.log("추가된 이미지:", '#catched-fish-' + f.f_name + randomNumber); 

                                                                                        $("#catched-fish-" + f.f_name + randomNumber).css("border", "yellow 2px solid");
                                                                                        $("#catched-fish-" + f.f_name + randomNumber).css("width", randomNumber + "px");
                                                                                        $("#catched-fish-" + f.f_name + randomNumber).css("height", randomNumber + "px");
                                                                                        $("#catched-fish-" + f.f_name + randomNumber + ":hover").css("cursor", "pointer");
                                                                                        
                                                                                        
                                                                                        
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

            
            //캐스팅 시 a키나 s키를 누르면 3씩 데미지
            $(document).keydown(function(e) {
                if (canFightFishing) {
                    if (e.keyCode === 65) { //a키
                        gagePercent = gagePercent + 3 + rodDamage; 
                        $("#akey").css("opacity", "0.5");
                    } else if(e.keyCode === 83){ //s키
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
            let isColor = false;
            
            
            
            
            //우측 메뉴 단축키 이벤트
            $(document).keydown(function(e) { 
            	console.log('isShop:', isShop, 'isColor:', isColor);

            	if (e.keyCode === 69) {  //E키
                    isInventory = !isInventory;
                    $("#inventory").fadeToggle(500);
                }

                if (e.keyCode === 85) {   //U키
                    isUserInfo = !isUserInfo;
                    $("#UserInfo").fadeToggle(500);
                }

                if (e.keyCode === 80) {  //P키
                    isShop = !isShop;
                    if (isShop) {
                        $("#Shop").fadeIn(500);
                       
                        $("#Color-Section").fadeOut(500);
                    } else {
                        $("#Shop").fadeOut(500);
                    }
                }

                if (e.keyCode === 67) {  //C키
                	let randomColor = Math.floor(Math.random() * 12) + 1;
                	$("#status").css("background-image", "none");
                   	$("#status").css("border", "none");
                	if(randomColor === 1){
                		$("#status").css("background-color", "#D3F1DF");
                	}else if(randomColor === 2){
                		$("#status").css("background-color", "#D4EBF8");
                	}else  if(randomColor === 3){
                		$("#status").css("background-color", "#FFE6A9");
                	}else  if(randomColor === 4){
                		$("#status").css("background-color", "#B3C8CF");
                	}else  if(randomColor === 5){
                		$("#status").css("background-color", "#CA7373");
                	}else  if(randomColor === 6){
                		$("#status").css("background-color", "#FBD288");
                	}else  if(randomColor === 7){
                		$("#status").css("background-color", "#F0C1E1");
                	}else  if(randomColor === 8){
                		$("#status").css("background-color", "#C6E7FF");
                	}else  if(randomColor === 9){
                		$("#status").css("background-color", "#F3F3E0");
                	}else  if(randomColor === 10){
                		$("#status").css("background-color", "#FFB38E");
                	}else  if(randomColor === 11){
                		$("#status").css("background-color", "#FFE3E3");
                	}else  if(randomColor === 12){
                		$("#status").css("background-color", "#A5B68D");
                	} 
                	
                	
                }
               
                if (e.keyCode === 84) {  //T키
                    $("h3").css("color", "black");
                }
                if (e.keyCode === 87) {  //W키
                    $("h3").css("color", "white");
                }
                if (e.keyCode === 90) {  //Z키
                    $("#status").css("background-image", "url('resources/img/background/status.png')");
                }
 
                 if (event.keyCode === 78) { // N키 
                	
                	  $("body").css("filter", "brightness(85%)");
                	  $("body").css("background-image", "url('resources/img/background/lake_night.jpg')");
                	  $("body").css("background-color", "black");

                	  $("body").css("background-size", "cover");
         } 
                 if (event.keyCode === 77) { // M키 
                 	
               	  $("body").css("filter", "brightness(100%)");

               	  $("body").css("background-image", "url('resources/img/background/lake.jpg')");
               	  $("body").css("background-color", "none");

               	     
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
        <img src = "resources/img/Fish/shadow.png" width = "80" height = "40" id = "gage-img">
      
        <div id="fight-fishing-dmg">     
        
        </div>
    </div>
  
    <img id="akey" src="resources/img/akey.png"> 
    <img id="skey" src="resources/img/skey.png">  
  <div id = "gage-section">
       
        </div>
</div>
<div class="right-bar">
    <div class="inventory-menu" onclick="toggleInventory()">🎣 <br>인벤토리<strong>[E]</strong></div>
        <div class="inventory-menu" onclick="toggleUserInfo()">🧑‍ <br>유저<strong>[U]</strong></div>
          <div class="inventory-menu" onclick="toggleShop()">🏬‍ <br>상점<strong>[P]</strong></div>
           <div class="inventory-menu" onclick="toggleColor()">🎨‍ <br>상태창 색상<strong>[C]</strong></div>
                   <div class="inventory-menu" onclick="toggleRecovery()">↩️‍ <br>상태창 복구<strong>[Z]</strong></div>
                   <div class="inventory-menu" onclick="toggleBlack()">⚫<br>글자 색상<strong>[T]</strong></div>
                   <div class="inventory-menu" onclick="toggleWhite()">⚪<br>글자 색상<strong>[W]</strong></div>
                     <div class="inventory-menu" onclick="toggleMorning()">🌞<br>모닝 모드<strong>[M]</strong></div>
                     <div class="inventory-menu" onclick="toggleNight()">🌙<br>나이트 모드<strong>[N]</strong></div>
                     
</div>

<div id="inventory" class="inventory" style="display:none;">
    <h2>Inventory 🎒</h2>

   
    <div class="fish-list" id="fish-list">
        <c:forEach var="f" items="${inventoryList}">
            <div class="fish-item">
                <img class="fish-img" id="fish-img-${f.f_name}${f.f_size}" 
                     src="resources/img/Fish/${f.f_name}.png" 
                     style="width: ${f.f_size}px; height: ${f.f_size}px"
                     onclick="showInfo('${f.f_name}', '${f.f_price}', '${f.f_size}', event)" />
            </div>
        </c:forEach>
    </div>


    <div class="inventory-footer">
        <div id="userMoney"></div>
        <div id="sell-button"></div>
    </div>
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