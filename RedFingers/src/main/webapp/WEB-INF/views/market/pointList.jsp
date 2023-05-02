<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판 양식</title>

<style type="text/css">

	* {
		box-sizing: border-box;
	}

	#title {
		width: 100%;
		text-align: center;
		height: 100px;
		background-color: orange;
	}
	#title p {
		 line-height: 100px; 
	}
	#aside {
		float: left;
		height: 1200px;
		background-color: navy;
		width: 20%;
		padding: 10px;
	}
	#aside a {
	        text-decoration : none;
	        color: #fff;
	        margin: 10px 30px;
	}
	#main {
		width: 80%;
		height: 1200px;
		float: left;
		padding: 10px;
		background-color: gray;
		text-align: center;
	}
	#point-title {
		line-height: 100px;
		font-weight: bold;
		font-size: 30px;
	}
	#pointlist1 { 
	            display: flex;
	            gap : 0.3px;
	            text-decoration : none;
	            margin-top: 50px;
	            margin-left: 230px;
    }
	#pointlist2 { 
	            display: flex;
	            gap : 0.3px;
	            text-decoration : none;
	            margin-top: 50px;
	            margin-left: 230px;
    }
    
    .plant  { 
             margin: 0 0 15px 0;
    }
	#list {
		background-color: #fff;
	}
	#list th {
		background-color: #666;
	}
	.right {
		text-align: right;
	} 
	
	#main { display: block; }
	
	img { width : 250px; 
	      height: 250px;
	}
	.tag {
		font-weight: bold;
	}
	#cont {
		background-color: #fff;
		margin: 0 auto;
		margin-bottom: 30px;
		width: 60%;
	}
	#cont th {
		background-color: #666;
	}
	

</style>

</head>
<body>
	 <%@include file="/WEB-INF/include/header.jsp" %>
     <div id="title">
     	<p>포인트 스토어</p>
     </div>
     <div id="aside">
     	<a href="">나눔합니다</a><br />
     	<a href="">입양원해요</a><br />
     	<a href="">포인트 스토어</a><br />
     </div>
     <div id="main">
     
     <p id="point-title">지금까지 모은 포인트로 물건을 구입하세요</p>
     
     <div id="pointlist1">
      <figure>
      <a href="">
     <div class="plant">
	     <img src="/img/market/포인트스토어1.jpg" >
	  </div>
	  </a>
	     <span class="tag">3000p</span>
	     <p>귀여운 코끼리 물뿌리개</p>
	  </figure>
      <figure>
      <a href="">
     <div class="plant">
	     <img src="/img/market/포인트스토어2.jpg" >
	  </div>
	  </a>
	     <span class="tag">4500p</span>
	     <p>파쯔파쯔 국내생산 흙</p>
	  </figure>
      <figure>
      <a href="">
     <div class="plant">
	     <img src="/img/market/포인트스토어3.jpg">
	  </div>
	  </a>
	     <span class="tag">1800p</span>
	     <p>원예 모종삽 3종세트</p> 
	  </figure>
	 </div>

     <div id="pointlist2">
      <figure>
      <a href="">
     <div class="plant">
	     <img src="/img/market/포인트스토어4.jpg">
	  </div>
	  </a>
	     <span class="tag">4500p</span>
	     <p>식물영양제 대유 터바태</p> 
	  </figure>
      <figure>
      <a href="">
     <div class="plant">
	     <img src="/img/market/포인트스토어5.jpg">
	  </div>
	  </a>
	     <span class="tag">4500p</span>
	     <p>파스텔 컬러 토분 10호</p> 
	  </figure>
      <figure>
      <a href="">
     <div class="plant">
	     <img src="/img/market/포인트스토어6.jpg">
	  </div>
	  </a>
	     <span class="tag">8000p</span>
	     <p>닥터조 벅스킬 스프레이</p> 
	  </figure>
	  </div>
	  
	</div>  <!-- main end  -->
	
	
		<input type="button" class="right" value="새글 작성" />
	    <%@include file="/WEB-INF/include/paging.jsp" %>
     </div>
     
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>