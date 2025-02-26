/**
 * 
 */
// 잘못됐으면 true 값 (뭔가 문제가 있으면 true, 정상적이면 false)
//<input>을 넣었을 때
// 아무것도 안썼으면 true, 뭐라도 썼으면 false
function isEmpty(input){
	return(!input.value);
}

//<input>을 넣었을 때
// 한글 / 특수문자 값이 들어있다면 true, 없다면 false
//메일 같은거 입력할 때 한글 값 안들어가게 막아놓는 함수
function containsAnother(input){
	let pass = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@_.";
	let iv = input.value;
	for (let i = 0; i < pass.length; i++){
		if(pass.indexOf(iv[i]) == -1){
			return true;
		}
	}
	return false;
}

//<input>, 글자 수를 넣었을 때
// 지정한 글자수보다 적으면 true, 지정한 글자수 이상이면 false

function atLeastLetter(input, len){
	return (input.value.length < len);
}

//<input> x2 넣었을 때
//내용이 다르면 true, 같으면 false

function notEqualPw(input1, input2){
	return (input1.value != input2.value);
}

// <input>, 문자열셋 넣었을 때
// 없으면 true, 있으면 false (입력한 pw에 지정한 문자열이 없는 경우)
//문자열이 포함되어 있는가


function notContain(input, passSet) {
	let iv = input.value;
	for(let i = 0; i < passSet.length; i++){
		if(iv.indexOf(passSet[i]) != -1){
			return true;
		}
	}}

//<input> 넣었을 때
// 숫자 아닌거 있으면 true, 숫자만 있으면 false
function isNotNumber(input){
	return isNaN(input.value);
}

// <input>, 확장자 넣었을 때
// 확장자명이 아니면 true, 맞으면 false
function isNotType(input,type){
	// .gif, .png, ...
	type = "." + type;
	return (input.value.indexOf(type) == -1);
	
}















