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
		
	}/*  window */
	
	//받는 쪽지 보낸 쪽지 구분
	let noteTitle = document.getElementsByClassName('title');
	let recList = document.getElementsByClassName('recList');
	let sendList = document.getElementsByClassName('sendList');
	function recClick(){
		
		for (var i = 0; i < recList.length; i++) {
			recList[i].style.display = "table-row";
		}
		
		for (var i = 0; i < sendList.length; i++) {
			sendList[i].style.display = "none";
		}
		
		noteTitle[1].innerHTML = "받은 쪽지";
		console.log(noteTitle);
		
		//쪽지 전체 보기
		document.getElementById("NoteSelect").href = "/myPage/noteRecList?nowpage=1";
	}
	
	function sendClick(){
		
		for (var i = 0; i < recList.length; i++) {
			recList[i].style.display = "none";
		}
		
		for (var i = 0; i < sendList.length; i++) {
			sendList[i].style.display = "table-row";
		}
		
		noteTitle[1].innerHTML = "보낸 쪽";
		
		//쪽지 전체 보기
		document.getElementById("NoteSelect").href = "/myPage/noteSendList?nowpage=1";
	}
	
	//내공 보답
	function sendPointBtn() {
		let sendPointWrap = document.getElementById('sendPointWrap');
		let sendPointBtn = document.getElementsByClassName('sendPointBtn');
		
		sendPointWrap.style.display = "block";
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
     					<p>씨앗d</p>
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
	     		<p class="title">받은 쪽지</p>
	     		<p><a id="NoteSelect" href="/myPage/noteRecList?nowpage=1">전체보기</a></p>
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
     	
     	<!-- <section3 시작> -->
     	
     	<section id="sec3">
	     	<div class="titleWrap">
	     		<p class="title">내공 보답</p>
	     		<p><a id="NoteSelect" href="/myPage/noteRecList?nowpage=1">전체보기</a></p>
	     	</div>     
			
			<table id="sec2Cont">
				<tr>
					<th>번호</th>
					<th>받는 사람</th>
					<th>내공상태</th>
					<th>내공 보답하기</th>
				</tr>
				
				<c:forEach var = "sendPointList" items="${sendPointList}">
				<tr>
					<a href="">
						<td>${sendPointList.rnum}</td>
						<td>${sendPointList.nickname}</td>
						<td>내공상태</td>
						<td><button class="sendPointBtn" onclick="sendPointBtn()">내공 전송</button></td>
					</a>
				</tr>
				</c:forEach>
			</table>
			
			<div>
				<button>삭제</button>
				<button><a href="/myPage/myNoteWriteForm?board_idx=5">쪽지보내기</a></button>
			</div>
     	</section>
     	
	    
    </div><!-- main -->
    
    <!-- 내공 주기 창 -->
   	<div id="sendPointWrap">
   		<div id="sendPointInWrap">
   			<div id="PointHeader">
   				<div><p>내공 주기</p></div>
   				<div>X</div>
   			</div>
   		
    		<div id="PointMain">
    			<div class="con1">
    			 	내공을 선택해주세요.
    			</div>
    			
    			<div>
					<label for="selectPoint1">50점</label>
	               	<input type="radio" name="selectPoint" value="s2" id="selectPoint1" checked />
	    			<label for="selectPoint2">40점</label>
	               	<input type="radio" name="selectPoint" value="s2" id="selectPoint2" />
	               	<label for="selectPoint3">30점</label>
	               	<input type="radio" name="selectPoint" value="s2" id="selectPoint3" />
	               	<label for="selectPoint4">20점</label>
	               	<input type="radio" name="selectPoint" value="s2" id="selectPoint4" />
	               	<label for="selectPoint5">10점</label>
	               	<input type="radio" name="selectPoint" value="s2" id="selectPoint5" />    			
    			</div>
    			
    			<div>
    				<button>전송</button>
    				<button>취소</button>
    			</div>
    		</div>
   		</div>	
   	</div>
     
</div>
</body>
</html>