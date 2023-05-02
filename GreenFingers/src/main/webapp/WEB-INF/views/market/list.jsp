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
	            margin-top: 20px;
    }
    .plant  { 
             margin: 0 0 15px 0;
    }
	#sell_list { 
	            display: flex;
	            gap : 0.3px;
	            text-decoration : none;
	            margin-top: 20px;
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

</style>

</head>
<body>
	 <%@include file="/WEB-INF/include/header.jsp" %>
     <div id="title">
     	<p>그린마켓</p>
     </div>
     <div id="aside">
     	입양<br />
     	분양<br />
     	소모품<br />
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
	
     
     <div id="sell_list">
      <figure>
      <a href="">
     <div class="plant">
	     <img src="/img/판매1.png" >
	  </div>
	  </a>
	     <span class="tag">판매</span>
	     <p>찔레 장미 사실 분</p>
	     <p>30000원</p>
	  </figure>
      <figure>
      <a href="">
     <div class="plant">
	     <img src="/img/판매2.png" >
	  </div>
	  </a>
	     <span class="tag">판매</span>
	     <p>공조팝나무</p>
	     <p>40000원</p>
	  </figure>
      <figure>
      <a href="">
     <div class="plant">
	     <img src="/img/판매3.png">  
	  </div>
	  </a>
	     <span class="tag">판매</span>
	     <p>미니구골목서입니다</p>   
	     <p>10000원</p>  
	  </figure>
	</div> 
	
	
		<input type="button" class="right" value="새글 작성" />
	    <%@include file="/WEB-INF/include/paging.jsp" %>
     </div>
     
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>