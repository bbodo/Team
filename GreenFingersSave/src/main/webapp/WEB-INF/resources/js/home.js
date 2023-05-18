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
  
  /*section2*/
  const Lists1 = document.querySelector('#sec2Con2Wrap');
  const list1 = document.querySelectorAll('#sec2Con2Wrap>div');
  const sec2Con2 = document.querySelector('#sec2Con2');
  /*const img1 = querySelector("#sec2Con2Wrap>div:nth-of-type(1)");
  const img2 = querySelector("#sec2Con2Wrap>div:nth-of-type(2)");
  const img3 = querySelector("#sec2Con2Wrap>div:nth-of-type(3)");*/
  let currentIndex1 = 0;

  list1.forEach((list1) => {
	  list1.style.height = "500px";
  })
  
  Lists1.style.height = "1500px"; 

  /*자동*/
  const getInterval1 = () => {
    return setInterval(() => {
      currentIndex1++;
      currentIndex1 = currentIndex1 >= list1.length ? 0 : currentIndex1;
      Lists1.style.marginTop = -(500 * currentIndex1) + "px";
    }, 3000);
  }
  
  let interval1 = getInterval1();
	
  	sec2Con2.addEventListener('mouseenter', function() {
  		clearInterval(interval1);    
  	})
  	
  	sec2Con2.addEventListener('mouseleave', function() {
  		interval1   = getInterval1();
  	})
  	
  	//top
  	let Top = document.querySelector('#top');
	
	window.addEventListener('scroll', function() {
		if(this.scrollY > 500) {
			Top.classList.remove('on');
		}else {
			Top.classList.add('on');
		}
	})
	
	Top.addEventListener('click', function (e){
		e.preventDefault();
		window.scrollTo({top:0, behavior: 'smooth'});
	})
	   

}