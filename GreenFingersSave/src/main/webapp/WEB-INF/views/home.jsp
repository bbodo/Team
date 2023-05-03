<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<title>홈</title>

 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />

  <!-- Demo styles -->
  <style>
    html, body {
      position: relative;
      height: 100%;
    }

    .swiper {
      width: 100%;
      height: 100%;
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
      height: 600px;
      object-fit: fill;
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
	<c:choose>
		<c:when test="${ sessionScope.login eq null }">
			<%@include file="/WEB-INF/include/header.jsp" %>
		</c:when>
		<c:otherwise>
			<%@include file="/WEB-INF/include/header2.jsp" %>
		</c:otherwise>
	</c:choose>
	
	<!-- Swiper -->
  	<div class="swiper mySwiper">
    	<div class="swiper-wrapper">
      	  <div class="swiper-slide"><a href=""><img src="/img/home/homeBanner6.jpg" alt="banner"/></a></div>
      	  <div class="swiper-slide"><a href=""><img src="/img/home/homeBanner2.jpg" alt="banner"/></a></div>
      	  <div class="swiper-slide"><a href=""><img src="/img/home/homeBanner5.jpg" alt="banner"/></a></div>
      	  <div class="swiper-slide"><a href=""><img src="/img/home/homeBanner4.jpg" alt="banner"/></a></div>
    	</div>
    	<div class="swiper-button-next"></div>
    	<div class="swiper-button-prev"></div>
    	<div class="swiper-pagination"></div>
  </div>
	
	<h2>Home</h2>
	<a href="/Board/List?submenu_id=SUBMENU01&nowpage=1">식물연합 포이즌 게시판 가는길</a> <br />
	<a href="/write">write 가는길</a> <br />
	<a href="/view">view 가는길</a> <br />
	<a href="/update">update 가는길</a> <br />
	<a href="/eventList">이벤트 리스트 가는길</a> <br />
	<a href="/Market/AdoptList?submenu_id=SUBMENU15&nowpage=1">market 입양 리스트 가는길</a> <br />
	<a href="/market">market 메인 가는길</a> <br />
	<a href="/marketWrite">market write 가는길</a> <br />
	<a href="/marketUpdate">market update 가는길</a> <br /> 
	<a href="/marketView">market view 가는길</a> <br />
	<a href="/marketPointList">market pointList 가는길</a> <br />
	<a href="/myList">자기가 쓴글</a> <br />  
	<a href="/myNote">쪽지</a> <br />
	<a href="/myNoteWrite">쪽지작성</a> <br />
	<a href="">길 찾아가세요</a> 
	
	<a href="/myList">마이페이지</a>
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