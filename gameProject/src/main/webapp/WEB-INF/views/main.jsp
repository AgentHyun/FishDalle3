<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hi+Melody&family=Jua&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "resources/css/game.css">
<script type = "text/javascript" src = "resources/jQuery.js"></script>

<script type = "text/javascript">
function toggleInventory() {
    $("#inventory").fadeToggle(500); 
}

$(function() {
    let topPosition = 500;
    let leftPosition = 1000;
    let gagePercent = 30; 
    let isFishing = false; 
    let canFightFishing = false; 
    let intervalId = null;

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

        if (
            charLeft + 50 > sectionLeft &&
            charLeft < sectionLeft + sectionWidth &&
            charTop + 50 > sectionTop &&
            charTop < sectionTop + sectionHeight
        ) {
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
                            $("#status").html("<h3><span class = 'space-bar'> SpaceBar</span>누르면 낚시 시작</h3>");
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
                                                if (gagePercent >= 0 && gagePercent <= 40) {
                                                    $("#gage").css("background-color", "red");
                                                } else if(gagePercent >= 40 && gagePercent <= 60){
                                                    $("#gage").css("background-color", "#B1F0F7"); 
                                                } else {
                                                    $("#gage").css("background-color", "#88C273");
                                                }

                                                $("#fight-fishing-dmg").html("<div id='dmg'>데미지: " + gagePercent + "</div>");
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
            $("#down-img").css("width", "50px");
            $("#down-img").css("height", "50px");
        }
    });

    $(document).keydown(function(e) {
        if (canFightFishing) {
            if (e.keyCode === 65 || e.keyCode === 83) { 
                gagePercent += 3; 
            }
        }
        if (gagePercent >= 100) {
            clearInterval(intervalId);
            intervalId = null; 
            $("#fight-fishing").css("display", "none");
            $("#status").html("<h3>잡았습니다!</h3>");
            isFishing = false;
            canFightFishing = false; 
            gagePercent = 30;
            $("#gage").css("width", gagePercent + "%");
        }
    });

    $(document).keyup(function(e) {
        if (canFightFishing && isFishing) {
            if (e.keyCode === 65 || e.keyCode === 83) { 
            }
        }
    });

    let isInventory = false;
    $(document).keydown(function(e) {
        if (e.keyCode == 69) { 
            isInventory = !isInventory;
            if (isInventory) {
                $("#inventory").fadeIn();
            } else {
                $("#inventory").fadeOut();
            }
        }
    });
});
</script>

</head>
<body>

<img id="down-img" class="down-img" src="resources/img/down.png" alt="다운 이미지">
<div class="fishing-section"><h4>낚시 가능 구역</h4></div>
<div class="status" id="status"></div>
<div class="fight-fishing" id="fight-fishing">
    <div class="gage" id="gage">
        <div id="fight-fishing-dmg"></div>
    </div>
    <img id="akey" src="resources/img/akey.png"> 
    <img id="skey" src="resources/img/skey.png">
</div>
<div class="left-bar">
    <div class="inventory-menu" onclick="toggleInventory()">🎣 <br>인벤토리<strong>[E]</strong></div>
</div>
<div id="inventory" class="inventory" style="display:none;">
    <h2>Inventory 🎣</h2>
    <ul>
        <li>아이템 1</li>
        <li>아이템 2</li>
        <li>아이템 3</li>
    </ul>
</div>

</body>
</html>
