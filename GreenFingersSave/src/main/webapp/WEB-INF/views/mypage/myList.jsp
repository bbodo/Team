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
	
	/*현 페이지에서만 쓰는 것*/
	.sendList {
	display: none;
	}
	
	.recList {
		display: table-row;
	}
</style>

<script type="text/javascript">

	window.onload = function() {
		//쪽지 삭제여부 확인
		let noteDeleteCheck = "${noteDelete}";
		
		if(noteDeleteCheck == 1){
			alert("쪽지 삭제 완료!");
		}
		
		//등급 계산
		let graderName    =    "";
		let gradepoint    =    "${userVo.gradepoint}";
		let inWidth       =     document.getElementById('gradeInbox');
		let gradeMark       =     document.getElementById('gradeMark');
		
		if(0 <= gradepoint && gradepoint < 2000) {
			graderName = "씨앗";
		}else if(2000 <= gradepoint && gradepoint < 4000) {
			graderName = "새싹";
		}else if(4000 <= gradepoint && gradepoint < 6000) {
			graderName = "잎새";
		}else if(6000 <= gradepoint && gradepoint < 8000) {
			graderName = "가지";
		}else if(8000 <= gradepoint && gradepoint < 10000) {
			graderName = "열매";
		}else if(10000 <= gradepoint && gradepoint < 12000) {
			graderName = "나무";
		}
		
		let inWidthCal = calculatePercentage(gradepoint, 2000);
		
		inWidth.style.width = inWidthCal + "%";
		
		gradeMark.style.marginLeft = inWidthCal + "%";
		
		gradeMark.style.transform = "translateX(" + -inWidthCal + "%)";
		
		function calculatePercentage(part, whole) {
			return (part / whole) * 100;
		}
		
		
		gradeMark.addEventListener('DOMContentLoaded', (event) => {
			gradeMark.animate(
		      {
		        transform: [
		          'translateX(0px)',
		          'translateX(300px)'
		        ]
		      },
		      {
		        duration: 500, // 밀리초 지정
		        fill: 'forwards', // 종료 시 속성을 지님
		        easing: 'ease' // 가속도 종류
		      }
		    );
		});
	
		
		
		
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
		
		//쪽지 전체 보기
		document.getElementById("NoteSelect").href = "/mypage/noteRecList?nowpage=1";
	}
	
	function sendClick(){
		
		for (var i = 0; i < recList.length; i++) {
			recList[i].style.display = "none";
		}
		
		for (var i = 0; i < sendList.length; i++) {
			sendList[i].style.display = "table-row";
		}
		
		noteTitle[1].innerHTML = "보낸 쪽지";
		
		//쪽지 전체 보기
		document.getElementById("NoteSelect").href = "/mypage/noteSendList?nowpage=1";
	}
	
	//내공 보답
	function sendPointBtn(classBtn) {
		let sendPointWrap = document.getElementById('sendPointWrap');
		let sendPointBtn = document.getElementsByClassName('sendPointBtn');
		let sendPointNic = document.getElementById('sendPointNic');
		
		sendPointWrap.style.display = "block";
		
		let pointNickName = classBtn.parentNode.previousSibling.previousSibling.previousSibling.previousSibling;
		let pointNickNameResult = pointNickName.textContent;
		
		sendPointNic.value = pointNickNameResult;
		
	}
	
	//내공 보답 닫기
	function PointCanBtn() {
		document.getElementById('sendPointWrap').style.display = "none";
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
     				<div id="gradeMark">
     					<p>내공</p>
     					<p>현등급점수</p>
     				</div>
     				<div  id="gradeWrapbox">
     					<div id="gradeInbox"></div>
     				</div>	
     				<div id="gradeFont">
     					<p>1 씨앗 변수</p> 
     					<p>2 새싹 변수</p>
     				</div>
     			</div>
     			
     			<div>
     				<p><span>씨앗</span> 등업에 필요한 조건을 만족시켜주세요</p>
     				<div><p>내공 :</p> <p>294필요</p></div>
     				<div><p>게시글 수:</p> <p>10</p></div>
     			</div>
     		</div>
     		
     		<div id="con3">
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
	     		<p><a id="NoteSelect" href="/mypage/noteRecList?nowpage=1">전체보기</a></p>
	     	</div>
     	
			<div>
				<button id="recBtn" onclick="recClick();">받은 쪽지</button>
				<button id="sendBtn"  onclick="sendClick();">보낸 쪽지</button>
			</div>         
			
			<table id="sec2Cont">
				<tr>
					<th>번호</th>
					<th>보낸 사람</th>
					<th>제목</th>
					<th>날짜</th>
					<th>읽음 상태</th>
				</tr>
				
				<c:forEach var = "recNoteVo" items="${recPagePaingList}">	
					<c:if test="${recNoteVo.delnote eq 1}" var="delnote">
					<tr class="recList">
						<td><a href="#" onclick="return false;">${recNoteVo.rnum}</a></td>
						<td><a href="#" onclick="return false;">${recNoteVo.send_usercode}</a></td>
						<td style="text-decoration: line-through;"><a href="#" style="color:#959595;" onclick="return false;">삭제 된 쪽지입니다</a></td>
						<td><a href="#" onclick="return false;">${recNoteVo.note_regdate}</a></td>
						<c:if test="${recNoteVo.readmark eq 0}" var="delnote">					
							<td class="readMark"><a href="#" onclick="return false;">x</a></td>
						</c:if>
						<c:if test="${recNoteVo.readmark eq 1}" var="delnote">					
							<td class="readMark"><a href="#" onclick="return false;">o</a></td>
						</c:if>
					</tr>
					</c:if>
				
					<c:if test="${recNoteVo.delnote eq 0}" var="delnote">
					<tr class="recList">
						<td><a href="/mypage/myNoteView?note_idx=${recNoteVo.note_idx}">${recNoteVo.rnum}</a></td>
						<td><a href="/mypage/myNoteView?note_idx=${recNoteVo.note_idx}">${recNoteVo.send_usercode}</a></td>
						<td><a href="/mypage/myNoteView?note_idx=${recNoteVo.note_idx}">${recNoteVo.note_title}</a></td>
						<td><a href="/mypage/myNoteView?note_idx=${recNoteVo.note_idx}">${recNoteVo.note_regdate}</a></td>
						<c:if test="${recNoteVo.readmark eq 0}" var="delnote">					
							<td class="readMark"><a href="/mypage/myNoteView?note_idx=${recNoteVo.note_idx}">x</a></td>
						</c:if>
						<c:if test="${recNoteVo.readmark eq 1}" var="delnote">					
							<td class="readMark"><a href="/mypage/myNoteView?note_idx=${recNoteVo.note_idx}">o</a></td>
						</c:if>
					</tr>
					</c:if>
				</c:forEach>

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
			
			<!-- <div>
				<button>삭제</button>
			</div> -->
     	</section>
     	
     	<!-- <section3 시작> -->
     	
     	<section id="sec3">
	     	<div class="titleWrap">
	     		<p class="title">내공 보답</p>
	     		<p><a id="NoteSelect" href="/mypage/noteRecList?nowpage=1">전체보기</a></p>
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
    			<form action="/mypage/sendPoint" method="POST">
					<input id="sendPointNic" type="hidden" name="nickname" value="" />
					
					<label for="selectPoint1">50점</label>
	               	<input type="radio" name="point" value="50" id="selectPoint1" checked />
	    			<label for="selectPoint2">40점</label>
	               	<input type="radio" name="point" value="40" id="selectPoint2" />
	               	<label for="selectPoint3">30점</label>
	               	<input type="radio" name="point" value="30" id="selectPoint3" />
	               	<label for="selectPoint4">20점</label>
	               	<input type="radio" name="point" value="20" id="selectPoint4" />
	               	<label for="selectPoint5">10점</label>
	               	<input type="radio" name="point" value="10" id="selectPoint5" />    			
    			</div>
    			
    			<div>
    				<button id="submitPointBtn"  type="submit">전송</button>
    			</div>
    			</form>
    				<button class="ponBtn" onclick="PointCanBtn()">취소</button>
    		</div>
   		</div>	
   	</div>
     
</div>
</body>
</html>