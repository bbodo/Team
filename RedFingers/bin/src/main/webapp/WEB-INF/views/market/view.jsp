 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<title>그린마켓 게시글 상세보기</title>

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
		color: #fff;
	}
	
	#main {
		width: 80%;
		height: 1200px;
		float: left;
		padding: 10px;
		background-color: gray;
	}
	#cont {
		background-color: #fff;
		margin: 0 auto;
		width: 80%;
	}
	#cont th {
		background-color: #666;
	}
	.right {
		text-align: right;
		margin-top: 20px;
		margin-right: 150px;
	}
	.left {
		text-align: left;
		padding: 20px;
		font-weight: bold;
	}
	h3 {
		font-size: 30px;
		margin-left: 650px;
		padding: 20px;
		font-weight: bold;
	}
	textarea {
		width: 1000px;
	}
	#writeComment {
		margin-left: 100px;
	}
	#readComment {
		margin-left: 100px;
	}
	#hot { 
        display: flex; 
        gap : 30px;
        text-decoration : none;
        text-align: center;
        margin-top: 50px;
        margin-left: 300px;
    }
    img {
    	width : 250px; 
	    height: 250px;
    }

</style>

</head>
<body>
	 <%@include file="/WEB-INF/include/header.jsp" %>
     <div id="title">
     	<p>그린 마켓</p>
     </div>
     <div id="aside">
     	<a href="">나눔합니다</a><br />
     	<a href="">입양원해요</a><br />
     	<a href="">포인트 스토어</a><br />
     </div>
     <div id="main">
		<table id="cont">
			<caption class="left">게시글 열람</caption>
			<tr>
				<th>제목</th>
				<td>루브라 나눔합니다</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>땡겨올 작성자 이름</td>
				<th>작성일</th>
				<td>땡겨올 작성일</td>
				<th>조회수</th>
				<td>땡겨올 조회수</td>
			</tr>
				<tr><td colspan="6"><hr /></td></tr>
			<tr>
				<th>내용</th>
				<td>
				<img src="/img/그린마켓1.png">
				루브라 나눔합니다
				얼른 데려가세요!
				</td>
			</tr>
			<tr>
				<th>파일 첨부</th>
				<td><input type="file" name="file" /></td>
			</tr>
		</table>
		<!-- 나중에 if 문 -->
		<div class="right">
		<a href="">수정</a>
		<a href="">삭제</a> <br />
		</div>
	
		<br />
		
		<div id="writeComment">
			<table>
				<tr>
					<th>달러 아이디 넣을곳</th>
					<td><textarea></textarea></td>
					<td><a href="">등록</a></td>
				</tr>
			</table>
		</div>
		<div id="readComment">
			<table>
				<tr>
					<th>달러 아이디 넣을곳</th>
					<td>댓글 내용 불러올곳</td>
				</tr>
				<!-- 답글/수정/삭제 이 칸만 조금만 작게 -->
				<tr>
					<td>답글</td>
					<!-- 나중에 if 문 -->
					<td><a href="">수정</a></td>
					<td><a href="">삭제</a></td>
				</tr>
			</table>
		</div>
       
      	<h3>인기 마켓</h3>
		<div id="hot">
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
      <%@include file="/WEB-INF/include/paging.jsp" %>
    
     </div> <!-- main end  -->


     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>