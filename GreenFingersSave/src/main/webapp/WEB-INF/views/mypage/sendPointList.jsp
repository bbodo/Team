<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<link rel="stylesheet" href="/css/mypage.css" />

<title>게시판 양식</title>

<style type="text/css">
	#title {
		width: 100%;
		text-align: center;
		height: 100px;
		background-color: orange;
	}
	#title p {
		 line-height: 100px;
	}
	
	#sendPaing, #recPaing, #myBoardList{
	display:none;
	}
</style>

<script type="text/javascript">
	window.onload = function() {
		
	}/*  window */
</script>

</head>
<body>
<div id="wrap">
	 <%@include file="/WEB-INF/include/header.jsp" %>
	 
     <div id="title">
     	<p>마이 페이지</p>
     </div>
     
     <div id="main">	
     	<!-- <section2 시작> -->
     	
     	<section id="sec1">
	     	<div class="titleWrap">
	     		<p class="title">쪽지</p>
	     	</div>
  			
			<table id="sec2Cont">
				<tr>
					<th>번호</th>
					<th>나눔 제공자</th>
					<th>내공상태</th>
					<th>내공 보답하기</th>
				</tr>
				
				<c:forEach var = "sendPointList" items="${sendPointList}">
				<tr class="sendPointTr">
					<td>${sendPointList.rnum}</td>
					<td><a href="">${sendPointList.nickname}</a></td>
					<td>내공상태</td>
					<td><button class="sendPointBtn" onclick="sendPointBtn(this)">내공 전송</button></td>
				</tr>
				</c:forEach>
			</table>
			
			<div>
				<button>삭제</button>
				<!-- <button><a href="/mypage/myNoteWriteForm?board_idx=5">쪽지보내기</a></button> -->
			</div>
     	</section>
		
	     <%@include file="/WEB-INF/include/myPagePaging.jsp" %>
    </div><!-- main -->
     
</div>
</body>
</html>