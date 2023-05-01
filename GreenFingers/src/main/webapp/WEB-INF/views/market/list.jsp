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
		height: 800px;
		background-color: navy;
		width: 20%;
		padding: 10px;
	}
	#main {
		width: 80%;
		height: 800px;
		float: left;
		padding: 10px;
		background-color: gray;
		text-align: center;
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
	 <section>
	   <a href="">
	     <img src="/img/그린마켓1.png">
	     <span class="tag">나눔</span>
	     <p>루브라 나눔합니다</p>
	   </a>
	   <a href="">
	     <img src="/img/그린마켓2.png">
	     <span class="tag">나눔</span>
	     <p>제라늄 데려가실 분</p>
	   </a>
	   <a href="">
	     <img src="/img/그린마켓3.png">
	     <span class="tag">나눔</span>
	     <p>유니플로라 데려가세요</p>
	   </a>
	 </section>
	
	
	
     </div>
		<input type="button" class="right" value="새글 작성" />
	    <%@include file="/WEB-INF/include/paging.jsp" %>
     
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>