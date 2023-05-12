
window.onload = function () {
	// $, $$ 함수 정의
	   var $$ = function( selector ) {
		   return document.querySelectorAll(selector);   // tag 배열을 찾아줌
	   };
	   var $  = function( selector ) {
		   return document.querySelector(selector);  // tag 한개만 찾아줌
	   };
	   
	   let loginCheck = "${sessionScope.login}";
	   /*수정중*/
	   console.log(loginCheck);
	   
	   if(loginCheck != null){
		   $('#menu1').style.marginLeft = "190px";
		    console.log("해당 객체 존재함");
		}else if(loginCheck == null){
			$('#menu1').style.marginLeft = "0";
			 console.log("해당 객체 존재no");
		}
}//end