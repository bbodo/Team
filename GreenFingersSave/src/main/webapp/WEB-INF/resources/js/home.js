window.onload = function () {
	// $, $$ 함수 정의
   var $$ = function( selector ) {
	   return document.querySelectorAll(selector);   // tag 배열을 찾아줌
   };
   var $  = function( selector ) {
	   return document.querySelector(selector);  // tag 한개만 찾아줌
   };
   
   /*Initialize Swiper*/
   var swiper = new Swiper(".mySwiper", {
      slidesPerView: 1,
      spaceBetween: 30,
      loop: true,
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
      autoplay: {
 	     delay: 5000,
 	     disableOnInteraction: false,
 	   },
    });
    
    let $slides = document.querySelectorAll('.swiper-slide');
    for (let i of $slides) {
      i.addEventListener('mouseover', function(){
        swiper.autoplay.stop();
      });
      i.addEventListener('mouseout', function(){
        swiper.autoplay.start();
      });
    }
    
    /*
    div사이즈 동적으로 구하기
  */
  const popup = document.querySelector('#popup');
  const Lists = document.querySelector('.popups-list');
  const list = document.querySelectorAll('.popuplist');
  let currentIndex = 0;

  list.forEach((list) => {
	 list.style.width = "100%";
  })

  Lists.style.width = "300%"; 

  /*자동*/
  const getInterval = () => {
    return setInterval(() => {
      currentIndex++;
      currentIndex = currentIndex >= list.length ? 0 : currentIndex;
      Lists.style.marginLeft = -(100 * currentIndex) + "%";
    }, 3000);
  }

  let interval = getInterval(); // interval 등록
   
}