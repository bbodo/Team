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
	}
	
	//받는 쪽지 보낸 쪽지 구분
	function recClick(){
		let recPaing = document.getElementById('recPaing');
		let sendPaing = document.getElementById('sendPaing');
		let recList = document.getElementsByClassName('recList');
		let sendList = document.getElementsByClassName('sendList');
		
		for (var i = 0; i < recList.length; i++) {
			recList[i].style.display = "table-row";
		}
		
		for (var i = 0; i < sendList.length; i++) {
			sendList[i].style.display = "none";
		}
		
		recPaing.style.display = "block";
		sendPaing.style.display = "none";
	}
	
	function sendClick(){
		let recPaing = document.getElementById('recPaing');
		let sendPaing = document.getElementById('sendPaing');
		let recList = document.getElementsByClassName('recList');
		let sendList = document.getElementsByClassName('sendList');
		
		for (var i = 0; i < recList.length; i++) {
			recList[i].style.display = "none";
		}
		
		for (var i = 0; i < sendList.length; i++) {
			sendList[i].style.display = "table-row";
		}
		
		recPaing.style.display = "none";
		sendPaing.style.display = "block";
	}
</script>

</head>
<body>
<div id="wrap">
	 <%@include file="/WEB-INF/include/header.jsp" %>
	 
     <div id="title">
     	<p>마이 페이지</p>
     </div>
     
     <div id="main">
     	
     	<!-- <section1 시작> -->
     	<div class="titleWrap">
     		<p class="title">내 정보</p>
     		<p><a href="">내 정보 수정하기</a></p>
     	</div>
     	
     	<section id="sec1">
     		<div id="con1">
     			<div><img src="/img/common/profile.png" alt="myimg"/></div>
     			<div><p>${userVo.userid} 님</p></div>
     			<div><p>등급 :</p> <p>${userVo.usercode}</p></div>
     		</div>
     		
     		<div id="con2">
     			<div>
     				<img src="" alt="myimg"/>
     				<div></div>	
     				<div>
     					<p>씨앗</p>
     					<p>새싹</p>
     				</div>
     			</div>
     			
     			<div id="con3">
     				<p>씨앗 등업에 필요한 조건을 만족시켜주세요</p>
     				<div><p>내공</p> <p>294필요</p></div>
     				<div><p>게시글 수</p> <p>10</p></div>
     			</div>
     		</div>
     		
     		<div>
     			<div id="myGrade">
     				<div><P>씨앗</P></div>
     				<div><P>새싹</P></div>
     				<div><P>잎새</P></div>
     				<div><P>가지</P></div>
     				<div><P>열매</P></div>
     				<div><P>나무</P></div>
     			</div>
     			
     			<div>
     				<div>
     					<img src="" alt="myimg"/>
     				</div>
     				
     				<div>
     					<div><P>씨앗</P></div>
     					<div><P>씨앗평균</P></div>
     					
     					<div>
     						<div>
     							<div id="point1"></div>
     							<div id="point2"></div>
     						</div>
     						<div>
     							<div>거래포인트</div>
     							<div>게시글 포인트</div>
     							<div>100%</div>
     						</div>
     					</div>
     				</div>
     			</div>
     		</div>
     	</section>
     	
     	<!-- <section2 시작> -->
     	
     	<section id="sec2">
	     	<div class="titleWrap">
	     		<p class="title">쪽지</p>
	     	</div>
     	
			<div>
				<button id="recBtn" onclick="recClick();">받은 쪽지</button>
				<button id="sendBtn"  onclick="sendClick();">보낸 쪽지</button>
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
				<tr class="sendList">
					<a href="">
						<td>${sendNoteVo.rnum}</td>
						<td>${sendNoteVo.nickname}</td>
						<td>${sendNoteVo.note_title}</td>
						<td>${sendNoteVo.note_regdate}</td>
						<td class="readMark"></td>
					</a>
				</tr>
				</c:forEach>

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
				<button><a href="/myPage/myNoteWriteForm?board_idx=5">쪽지보내기</a></button>
			</div>
     	</section>
		
	    <%@include file="/WEB-INF/include/myPagePaging.jsp" %>
	    
    </div><!-- main -->
     
     <%@include file="/WEB-INF/include/footer.jsp" %>
</div>
</body>
</html>