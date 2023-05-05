window.onload = function () {
	// $, $$ 함수 정의
   var $$ = function( selector ) {
	   return document.querySelectorAll(selector);   // tag 배열을 찾아줌
   };
   var $  = function( selector ) {
	   return document.querySelector(selector);  // tag 한개만 찾아줌
   };
   
   
   
}