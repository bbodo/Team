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
	
	#sendPaing {
	display:none;
	}
</style>

<script type="text/javascript">
	window.onload = function() {
		//쪽지 읽음 여부 확인
		let readMark = "${readmark}";
		let sendPagingVo = "${sendPagePaingList}";
		let readMarkTag = document.querySelectorAll('.readMark');
		
		for (var i = 0; i < sendPagingVo.length; i++) {
			if(readMark == 1){
				readMarkTag[i].innerHTML = "o";
			}else{
				readMarkTag[i].innerHTML = "x";
			}
		}
		
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
					<th>받는 사람</th>
					<th>제목</th>
					<th>날짜</th>
					<th>읽음 상태</th>
				</tr>

				<c:forEach var = "recNoteVo" items="${recPagePaingList}">
				<tr class="recList">
					<a href="">
						<td>${recNoteVo.rnum}</td>
						<td>${recNoteVo.send_usercode}</td>
						<td>${recNoteVo.note_title}</td>
						<td>${recNoteVo.note_regdate}</td>
						<td class="readMark"></td>
					</a>
				</tr>
				</c:forEach>
			</table>
			
			<div>
				<button>삭제</button>
				<!-- <button><a href="/myPage/myNoteWriteForm?board_idx=5">쪽지보내기</a></button> -->
			</div>
     	</section>
		
	     <%@include file="/WEB-INF/include/myPagePaging.jsp" %>
    </div><!-- main -->
     
</div>
</body>
</html>