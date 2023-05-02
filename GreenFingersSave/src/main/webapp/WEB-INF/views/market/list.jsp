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
		height: 1000px;
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
		height: 1000px;
		float: left;
		padding: 10px;
		background-color: gray;
		text-align: center;
	}
	#givelist { 
	            display: flex;
	            gap : 0.3px;
	            text-decoration : none;
	            margin-top: 50px;
	            margin-left: 250px;
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
     	<p>그린마켓</p>
     </div>
     <div id="aside">
     	<a href="">나눔합니다</a><br />
     	<a href="">입양원해요</a><br />
     	<a href="">포인트 스토어</a><br />
     </div>
     <div id="main">
     
     <p>그린핑거는 판매 혹은 구매 회원 간의 상품 거래 정보<br>
     및 거래에 관여하지 않으며 어떠한 의무와 책임도 부담하지 않습니다</p>
     
     <div id="givelist">
      <figure>
      <a href="">
     <div class="plant">
	     <img src="/img/그린마켓1.png" >
	  </div>
	  </a>
	     <span class="tag">나눔</span>
	     <p>루브라 나눔합니다</p>
	  </figure>
      <figure>
      <a href="">
     <div class="plant">
	     <img src="/img/그린마켓2.png" >
	  </div>
	  </a>
	     <span class="tag">나눔</span>
	     <p>제라늄 데려가실 분</p>
	  </figure>
      <figure>
      <a href="">
     <div class="plant">
	     <img src="/img/그린마켓3.png">
	  </div>
	  </a>
	     <span class="tag">나눔</span>
	     <p>유니플로라 데려가세요</p> 
	  </figure>
	</div>
	
    <table id="cont">
			<caption><h2>입양원해요</h2></caption>
			<tr>
				<th>제목</th>
				<th>작성일</th>
				<th>작성자</th>
				<th>조회수</th>
			</tr>
			<tr>
				<td><a href="/view">찔레 장미 키우시는 분</a></td>
				<td>2023-05-01</td>
				<td>독초애호가</td>
				<td>123</td>
			</tr>
			<tr>
				<td><a href="/view">바오밥 씨앗 원해요!</a></td>
				<td>2023-05-01</td>
				<td>바오밥은 사랑</td>
				<td>12</td>
			</tr>
			<tr>
				<td><a href="/view">임파첸스 입양하고 싶어요</a></td>
				<td>2023-05-02</td>
				<td>식물사랑단</td>
				<td>3</td>
			</tr>
		</table> 
    
	
	
		<input type="button" class="right" value="새글 작성" />
	    <%@include file="/WEB-INF/include/paging.jsp" %>
     </div>
     
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>