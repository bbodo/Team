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
	
	#recPaing, #myBoardList, #sendPointList {
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
	 <%@include file="/WEB-INF/include/subBanner.jsp" %>
	 
     
     <div id="main">	
     	<!-- <section2 시작> -->
     	
     	<section id="sec1">
	     	<div class="titleWrap">
	     		<p class="title">보낸 쪽지</p>
	     	</div>
			
			<table id="sec2Cont">
				<tr>
					<th>번호</th>
					<th>받는 사람</th>
					<th>제목</th>
					<th>날짜</th>
					<th>읽음 상태</th>
				</tr>
				
				<c:forEach var = "sendNoteVo" items="${sendPagePaingList}">
					<c:if test="${sendNoteVo.delnote eq 1}" var="delnote">
					<tr class="sendList">
						<td><a href="#" onclick="return false;">${sendNoteVo.rnum}</a></td>
						<td><a href="#" onclick="return false;">${sendNoteVo.nickname}</a></td>
						<td style="text-decoration: line-through;"><a href="#" style="color:#959595;" onclick="return false;">삭제 된 쪽지입니다</a></td>
						<td><a href="#" onclick="return false;">${sendNoteVo.note_regdate}</a></td>
						<c:if test="${sendNoteVo.readmark eq 0}" var="delnote">	
							<td class="readMark"><a href="#" onclick="return false;">x</a></td>
						</c:if>
						<c:if test="${sendNoteVo.readmark eq 1}" var="delnote">	
							<td class="readMark"><a href="#" onclick="return false;">o</a></td>
						</c:if>	
					</tr>
					</c:if>
				
					<c:if test="${sendNoteVo.delnote eq 0}" var="delnote">
					<tr class="sendList">
						<td><a href="/mypage/myNoteView?note_idx=${sendNoteVo.note_idx}">${sendNoteVo.rnum}</a></td>
						<td><a href="/mypage/myNoteView?note_idx=${sendNoteVo.note_idx}">${sendNoteVo.nickname}</a></td>
						<td><a href="/mypage/myNoteView?note_idx=${sendNoteVo.note_idx}">${sendNoteVo.note_title}</a></td>
						<td><a href="/mypage/myNoteView?note_idx=${sendNoteVo.note_idx}">${sendNoteVo.note_regdate}</a></td>
						<c:if test="${sendNoteVo.readmark eq 0}" var="delnote">	
							<td class="readMark"><a href="/mypage/myNoteView?note_idx=${sendNoteVo.note_idx}">x</a></td>
						</c:if>
						<c:if test="${sendNoteVo.readmark eq 1}" var="delnote">	
							<td class="readMark"><a href="/mypage/myNoteView?note_idx=${sendNoteVo.note_idx}">o</a></td>
						</c:if>	
					</tr>
					</c:if>
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