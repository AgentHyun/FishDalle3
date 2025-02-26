/**
 * 
 */
function check(){
	let height = document.f.height;
	let weight = document.f.weight;
	let name = document.f.name;
	let photo = document.f.photo;
	if(isEmpty(height) || isNotNumber(height)){
		alert("키를 다시 입력해주세요!");
		return false;
	}else if(isEmpty(weight) || isNotNumber(weight)){
		alert("체중을 다시 입력해주세요!");
		return false;
	}else if(atLeastLetter(height, 2)){
		alert("키는 100cm를 넘겨주세요!");
		return false;
	}else if(atLeastLetter(weight, 1)){
		alert("체중은 10kg를 넘겨주세요!");
		return false;
	}else if(isEmpty(name) || atLeastLetter(name, 2)){
		alert("이름을 다시 입력해주세요!");
		return false;
	}else if(isEmpty(photo)){
		alert("사진을 다시 올려주세요!");
		return false;
	}  
    alert("회원 가입이 완료되었습니다✅");
	
	return true;

}