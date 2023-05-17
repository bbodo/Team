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
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
 <link rel="stylesheet" href="/css/home.css" />
 <script src="/js/home.js"></script>
 <!--<script src="/js/common.js"></script> -->

<style>
.layerPopup {
	display:none;
	}
.layerPopup:before {
	display:block; 
	content:""; 
	position:fixed; 
	left:0; 
	top:0; 
	width:100%; 
	height:100%; 
	background:rgba(0,0,0,.5);
	}
.layerPopup .layerBox {
	position:fixed; 
	left:50%; 
	top:50%; 
	transform:translate(-50%, -50%); 
	padding:20px; 
	background:black; 
	border-radius:6px;
	}
.layerPopup .layerBox .cont {
	/* margin-bottom:20px; */
	}
.layerPopup .layerBox .btnClose {
	display:inline-block; 
	position:absolute; 
	right:30px; top:25px; 
	padding:6px 12px; 
	color:#fff; 
	font-size:18px; 
	text-decoration:
	underline;
	}
.layerPopup .layerBox .btnTodayHide {
	font-size:15px; 
	font-weight:600; 
	color: #fff;
	text-decoration:underline;
	
	}	
</style>
</head>

<body>
<!-- 원데이 클래스 팝업창  -->
<div style="position: relative; z-index: 2;" class="layerPopup">
    <div class="layerBox">
        <figure class="cont">
            <img src="/img/home/popup_oneday1.png" alt="" width="400" height="500">
        </figure>
        	<a href="javascrfipt:;" class="btnClose">닫기</a>
        	<a href="javascript:;" class="btnTodayHide">오늘 하루 보지 않기✔</a>
    </div>
</div>

<div style="position: relative; z-index: 1;" id="wrap">
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
	
	<div id="homeWrap">
		<section id="sec1" style="height: auto; ">
			<div id="sec1Con1">
				<p class="mainTitle"><span>씨앗나누리에</span> 오신 걸 환영합니다</p>
				<div class="titleDeco"></div>
				
				<div>
					<div class="sec1Con1Box">
						<a href="#">
							<img src="/img/home/mainImg1.png" alt="mainImg"/>
							<p>식물의 날</p>
							<div></div>
						</a>
					</div>
					<div class="sec1Con1Box">
						<a href="#">
							<img src="/img/home/mainImg2.jpg" alt="mainImg"/>
							<p>다양한 그린마켓</p>
							<div></div>
						</a>
					</div>
					<div class="sec1Con1Box">
						<a href="#">
							<img src="/img/home/mainImg3.jpg" alt="mainImg"/>
							<p>다양한 </p>
							<div></div>
						</a>
					</div>
					<div class="sec1Con1Box">
						<a href="#">
							<img src="/img/home/mainImg3.jpg" alt="mainImg"/>
							<p>다양한 </p>
							<div></div>
						</a>
					</div>
				</div>
			</div>
		</section>
		
		<section id="sec2">
			<div id="sec2Con1">
				<img src="/img/home/seednanori.png" alt="mainImg"/>
				<p class="mainTitle">매주 활동들을 확인하세요</p>
				<div class="titleDeco"></div>
			</div>
			
			<div id="sec2Con2">
				<div id="sec2Con2Wrap">
					<div>
						<a href="#"> 
							<img src="/img/home/mainImg5.jpg" alt="mainImg" />
							<p>식물 키우기 꿀팁<br/><span>전문가가 말해주는 꿀팁! 놓치지마세요</span></p>
							<div></div>
						</a>
					</div>
					
					<div>
						<a href="#"> <img src="/img/home/mainImg3.jpg" alt="mainImg" />
							<p>다양한</p>
							<div></div>
						</a>
					</div>
					
					<div>
						<a href="#"> <img src="/img/home/mainImg3.jpg" alt="mainImg" />
							<p>다양한</p>
							<div></div>
						</a>
					</div>
					
					<div>
						<a href="#"> <img src="/img/home/mainImg3.jpg" alt="mainImg" />
							<p>다양한</p>
							<div></div>
						</a>
					</div>
				</div>
			</div>
		</section>
		
	</div>
	
	
  <!-- footer -->
  <%-- <%@include file="/WEB-INF/include/footer.jsp" %> --%>
  
  <!-- Swiper JS -->
  <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
 
</div>

<!-- 원데이 클래스 팝업창  -->
<script>
/* Javascript */
 

var $layerPopup = document.querySelector('.layerPopup');
var $btnLayerPopupClose = document.querySelector('.layerPopup .btnClose');
var $btnLayerPopupTodayHide = document.querySelector('.layerPopup .btnTodayHide');

//최초 레이어팝업 노출 (testCookie라는 이름의 쿠키가 존재하지 않으면 레이어 노출)
if(!$.cookie('testCookie')){
layerPopupShow();
 

}

//레이어팝업 닫기 버튼 클릭
$btnLayerPopupClose.addEventListener('click', function(){
    layerPopupHide(0);
});

//레이어팝업 오늘 하루 보지 않기 버튼 클릭
$btnLayerPopupTodayHide.addEventListener('click', function(){
    layerPopupHide(1);
});

//레이어팝업 노출
function layerPopupShow(){
    $layerPopup.style.display = 'block'
}
//레이어팝업 비노출
function layerPopupHide(state){
    //닫기버튼 오늘하루보지않기 버튼 무관하게 레이어팝업은 닫는다.
    $layerPopup.style.display = 'none'

    //오늘하루보지않기 버튼을 누른 경우
    if(state === 1){
    	//'testCookie' 이름의 쿠키가 있는지 체크한다.
        if($.cookie('testCookie') == undefined){
            //쿠키가 없는 경우 testCookie 쿠키를 추가
            $.cookie('testCookie', 'Y', { expires: 1, path: '/' });
            /*
                설명 :
                임의로 testCookie라는 이름에 Y라는 값을 넣어주었고,
                expires값으로 1을 주어 1일 후 쿠키가 삭제되도록 하였다
                path값을 '/'로 주면 해당사이트 모든페이지에서 유효한 쿠키를 생성한다
                특정페이지에서만 작동하려면 페이지 경로를 작성하면 된다
            */
        }        
    }
}
</script>
<%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>