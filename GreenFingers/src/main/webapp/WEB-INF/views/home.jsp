<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<title>홈</title>

 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />

  <!-- Demo styles -->
  <style>
    html,
    body {
      position: relative;
      height: 100%;
    }

    body {
      background: #eee;
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color: #000;
      margin: 0;
      padding: 0;
    }

    .swiper {
      width: 100%;
      height: 500px;
    }

    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .swiper-slide img {
      display: block;
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    .swiper {
      margin-left: auto;
      margin-right: auto;
    }
  </style>

</head>
<body>
<div id="wrap">
	
	<aside>
		<div>이벤트배너부분</div>
	</aside>
	
	<div id="banner">
		<div id="wrap">
			
		</div>
	</div>
	
	<!-- header	 -->
	<%@include file="/WEB-INF/include/header.jsp" %>
	
	<!-- Swiper -->
  	<div class="swiper mySwiper">
    	<div class="swiper-wrapper">
      	  <div class="swiper-slide">Slide 1</div>
	      <div class="swiper-slide">Slide 2</div>
	      <div class="swiper-slide">Slide 3</div>
	      <div class="swiper-slide">Slide 4</div>
	      <div class="swiper-slide">Slide 5</div>
	      <div class="swiper-slide">Slide 6</div>
	      <div class="swiper-slide">Slide 7</div>
	      <div class="swiper-slide">Slide 8</div>
	      <div class="swiper-slide">Slide 9</div>
    	</div>
    	<div class="swiper-button-next"></div>
    	<div class="swiper-button-prev"></div>
    	<div class="swiper-pagination"></div>
  </div>
	
	<h2>Home</h2>
		<a href="/board">board 가는길</a> <br />
	<a href="/write">write 가는길</a> <br />
	<a href="/view">view 가는길</a> <br />
	<a href="/update">update 가는길</a> <br />
	<a href="/eventList">이벤트 리스트 가는길</a> <br />
	<a href="/market">market 가는길</a> <br />
	<a href="/marketWrite">market write 가는길</a> <br />
	<a href="/myList">자기가 쓴글</a> <br />  
	<a href="/myNote">쪽지</a> <br />
	<a href="/myNoteWrite">쪽지작성</a> <br />
	<a href="">길 찾아가세요</a> 
	<h2>Home</h2>
	
  <!-- footer -->
  <%@include file="/WEB-INF/include/footer.jsp" %>

  <!-- Swiper JS -->
  <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>

  <!-- Initialize Swiper -->
  <script>
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
    });
  </script>
  
</div>
</body>
</html>