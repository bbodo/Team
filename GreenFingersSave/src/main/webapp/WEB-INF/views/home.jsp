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
 <script src="/js/home.js"></script>

  <!-- Demo styles -->
  <style>
html, body {
	position: relative;
	height: 100%;
}

.swiper {
	width: 1560px;
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
	height: 650px;
	object-fit: fill;
}

.swiper {
	margin-left: auto;
	margin-right: auto;
}

.swiper-button-next:after, .swiper-button-prev:after{
	color: #609966;
}

.swiper-pagination-bullet{
	background-color: #609966;
}

/* popup 시작 */
#popup {
	width: 1560px;
	height: 120px;
	overflow: hidden;
	margin: 0 auto;
}

.popups-list {
	display: flex;
	transition: .3s ease-out;
	height: 100%;
}

.popuplist img { 
	object-fit:contain;
	position: relative;
	left:50%;
	transform:translateX(-50%);
}
/* popup 끝 */
</style>

</head>
<body>
<div id="wrap">

	<div id="popup">
		<div class="popups-list">
			<div class="popuplist">
				<a href="">
					<img src="/img/home/popup1.png" alt="popup" />
				</a>
			</div>
			<div class="popuplist">
				<a href="">
					<img src="/img/home/popup2.png" alt="popup" />
				</a>
			</div>
			<div class="popuplist">
				<a href="">
					<img src="/img/home/popup3.png" alt="popup" />
				</a>
			</div>
		</div>
	</div>

	<!-- header	 -->
	<%-- <c:choose>
		<c:when test="${ sessionScope.login eq null }">
			<%@include file="/WEB-INF/include/header.jsp" %>
		</c:when>
		<c:otherwise>
			<%@include file="/WEB-INF/include/header2.jsp" %>
		</c:otherwise>
	</c:choose> --%>
	<%@include file="/WEB-INF/include/header.jsp" %>
	
	<!-- Swiper -->
  	<div class="swiper mySwiper">
    	<div class="swiper-wrapper">
      	  <div class="swiper-slide">
      	  	<a href="">
      	  		<img src="/img/home/mainbanner2.jpg" alt="banner"/>
      	  	</a>
      	  </div>
      	  
      	  <div class="swiper-slide">
      	  	<a href="">
      	  		<img src="/img/home/mainbanner1.jpg" alt="banner"/>
      	  	</a>
      	  </div>
      	  
      	  <div class="swiper-slide">
      	  	<a href="">
      	  		<img src="/img/home/mainbanner3_1.jpg" alt="banner"/>
      	  	</a>
      	  </div>
    	</div>
	    	<div class="swiper-button-next"></div>
	    	<div class="swiper-button-prev"></div>
    	<div class="swiper-pagination"></div>
  </div>
	
	<h2>Home</h2>
	<a href="/Manager/Home">관리자 홈</a>
	<a href="/Manager/Menu">메뉴관리</a>
	<a href="/Manager/Member">회원관리</a>
	<!-- <a href="/Board/List?submenu_id=SUBMENU01&nowpage=1">식물연합 포이즌 게시판 가는길</a> <br />
	<a href="/write">write 가는길</a> <br />
	<a href="/view">view 가는길</a> <br />
	<a href="/update">update 가는길</a> <br />
	<a href="/Event/EventList?submenu_id=SUBMENU18&nowpage=1"">이벤트 리스트 가는길</a> <br />
	<a href="/Market/List?submenu_id=SUBMENU15&nowpage=1">market 입양 리스트 가는길</a> <br />
	<a href="/Market/List?menu_id=MENU03&submenu_id=SUBMENU15&nowpage=1">market 메인 테스트 가는길</a> <br />
	<a href="/marketWrite">market write 가는길</a> <br />
	<a href="/marketUpdate">market update 가는길</a> <br /> 
	<a href="/marketView">market view 가는길</a> <br />
	<a href="/marketPointList">market pointList 가는길</a> <br />
	<a href="/myList">자기가 쓴글</a> <br />  
	<a href="/myPage/myList?nowpage=1">쪽지</a> <br />
	<a href="/myPage/myNoteWriteForm?board_idx=6">쪽지작성</a> <br />
	<a href="">길 찾아가세요</a> 
	
	<a href="/myPage/myList?nowpage=1">마이페이지</a>
	<h2>Home</h2> -->
	
  <!-- footer -->

  <!-- Swiper JS -->
  <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
 
</div>
</body>
</html>