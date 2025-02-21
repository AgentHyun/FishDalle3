$(function() {
	goResign();
	logoutEvent();
	idCheckEvent();
	noticeEvent();
	searchAddressEvent();
	signupImageUpload();
	titleEvent();
	// test();
});


//function test() {
//	$("#signup_gs_id").blur(function() {
//		let iVal = $("#signup_gs_id").val();
//		if (iVal === 'kkkkk') {
//			$("#msg").text("ID 중복").css("color", "red");
//		} else {
//			$("#msg").empty();
//		}
//	});
//}

function signupImageUpload() {
	$("#gs_photo").change(function() {
		let fileName = $("#gs_photo").val();
		$(".uploadName").val(fileName);
	});
}

function titleEvent(){
	setTimeout(() => {
		setTimeout(() => {
			$("#G").text("o");
			setTimeout(() => {
				$("#O").text("ut");
				setTimeout(() => {
					$("#L").text("augh");
					setTimeout(() => {
						$("#F").text("requently");
					}, 500);
				}, 500);
			}, 500);
		}, 500);
	}, 500);
}

function noticeEvent() {
	let noticeVisible = false;
	$("#noticeHandle").click(() => {
		if (!noticeVisible) {
			$("#siteNoticeArea").css("left", "-280px");
		} else {
			$("#siteNoticeArea").css("left", "0px");
		}
		noticeVisible = !noticeVisible;
	});
}

function searchAddressEvent() {
	$("#signup_gs_addr1, #signup_gs_addr2").click(() => {
		new daum.Postcode({
			oncomplete: function(data) {
				$("#signup_gs_addr1").val(data.zonecode);
				$("#signup_gs_addr2").val(data.roadAddress);
			}
		}).open();
		
	});
    
}

function idCheckEvent() {
	$("#signup_gs_id").keyup(function() {
		let gs_id = $(this).val();
		// alert(gs_id);
		$.getJSON("member.id.check?gs_id=" + gs_id, function(memberJSON) {
			if (memberJSON.member[0] == null) {
				$("#signup_gs_id").css("color", "white");
			} else {
				$("#signup_gs_id").css("color", "red");
			}
		});
	});
}

function logoutEvent() {
	$("#logoutBtn").click(() => {
		let msg = confirm('로그아웃 하시겠습니까?');
		if (msg) {
			location.href = "member.logout";
		}
	});
}

function goResign() {
	$("#resignBtn").click(() => {
		let msg = prompt('탈퇴 하시겠습니까 ? Y/N');
		if (msg == 'Y') {
			let msg2 = confirm('정말 탈퇴하시겠습니까 ?');
			if (msg2) {
				alert('안녕히 가세요~');
				location.href = "member.resign";
			}
		}
	});
}














