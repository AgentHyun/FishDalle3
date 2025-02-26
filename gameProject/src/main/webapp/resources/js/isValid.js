function check(){
	let u_id = document.f.u_id;
	let u_pw = document.f.u_pw;
	let u_pw_check = document.f.u_pw_check;
	
	if(isEmpty(u_id)){
		alert("아이디를 다시 입력해주세요!");
		return false;
	}else if(isEmpty(u_pw)){
		alert("비밀번호를 다시 입력해주세요!");
		return false;
	}else if(atLeastLetter(u_pw, 7)){
		alert("비밀번호는 7글자 이상 입력해주세요!");
		return false;
	}else if(isEmpty(u_pw_check)){
		alert("확인용 비밀번호를 다시 입력해주세요!");
		return false;
	}else if(notEqualPw(u_pw, u_pw_check)){
		alert("비밀번호가 확인용 비밀번호와 다릅니다.");
		return false;
	}
		
		return true;

}