/**
 * 
 */

 
 
 function checkJoin(){
	 if(document.user_info.userID.value.length < 2 || document.user_info.userID.value.length > 16){
		 alert("아이디는 2~16자 사이로 입력하세요");
		 return false;
	 }
	 if(document.user_info.userPW.value.length < 4){
		 alert("비밀번호는 5이상으로 입력하세요");
		 return false;
	 }
	 if(document.user_info.userMAIL.value.length == 0){
		 alert("이메일은 필수 입력사항 입니다.");
		 return false;
	 }
	 return true;
 }