$(function() {
	trClickEvent();
});


function trClickEvent() {
	let divVisible = false;
	$(".boardTbl").click(function() {
		if (!divVisible) {
			let th1 = $("<th></th>").text('제목');
			let th2 = $("<th></th>").text('작성자');
			let th3 = $("<th></th>").text('시간');
			let tr1 = $("<tr></tr>").append(th1, th2, th3);
			
			let tb = $("<table id='testt'></table>").append(tr1);
			tb.css("border", "pink solid 3px");
			
			let div1 = $("<div></div>").append(tb);
			let div2 = $("<div align='right'></div>").html("<button onclick='gogo();'>수정</button> ").append(" <button>삭제</button>");
			$(this).find(".boardDiv").append(div1, div2);
			$(this).find(".boardDiv").attr("align", "center");
			alert(divVisible);
			$(".boardTbl").not(this).off('click');
		} else {
			$(this).find(".boardDiv").empty();
			alert(divVisible);
//			$(".boardTbl").on('click', function() {
//				alert(divVisible);
//				trClickEvent();
//			});
			$(".boardTbl").off('click');
			trClickEvent();
		}
		divVisible = !divVisible;
	});
}

