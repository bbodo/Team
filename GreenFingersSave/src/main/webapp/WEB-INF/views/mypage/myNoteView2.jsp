<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<!-- <script type="text/javascript" src="/js/myNote.js"></script> -->
<title>쪽지 상세보기</title>

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
		background-color: white;
		width: 15%;
		padding: 10px;
	}
	#main {
		width: 85%;
		height: 800px;
		float: left;
		padding: 10px;
		padding-right : 15%;
		background-color: white;
	}
	#cont {
		background-color: #fff;
		margin: 0 auto;
		width: 100%;
		border-collapse: collapse;
		margin-top: 10px;
		border-top: 3px solid #228B22;
	}
	#cont tr td {
		padding: 15px;
		border-bottom: 1px solid #C0C0C0;
	} 
	#cont tr:nth-of-type(2) {
		border-bottom: 1px solid #228B22;
	}
	#board_title {
		font-size: 32px;
		font-weight: bold;
	}
	#sidemenu {
		padding: 30px;
	}
	#sidemenu li {
		padding: 10px;
	}
	#sidemenu li a {
		position: relative;
		display: block;
		font-size: 20px;
	}
	#sidemenu li a:after {
		content: "";
		position: absolute;
		left: 0;
		bottom: 24px;
		width: 0px;
		height: 3px;
		margin: 5px 0 0;
		transition: all 0.2s ease-in-out;
		transition-duration: 0.3s;
		opacity: 0;
		background-color: #2E8B57;
	}
	#sidemenu li a:hover:after {
		width: 100%;
		opacity: 1;
	}
	.right {
		text-align: right;
	}
	.left {
		text-align: left;
	}
	input[type=text] {
		width: 100%;
		padding: 5px;
	}
	textarea {
		width: 100%;
		height: 400px;
		padding: 20px;
	}
	
	/* 현재 페이지에만 속한 css */
	#cencelBtn {display:block;}

</style>

<script>
	window.onload = function() {
		//삭제버튼 생성여부
		const  cencelBtn = document.getElementById('cencelBtn');
		let receiver_usercode = "${myNoteView.receiver_usercode}";
		let usercode = "${userVo.usercode}";
		if(receiver_usercode === usercode){
			cencelBtn.style.display = "none";
		}
		
		
		const  submitBtn = document.getElementById('submitBtn');
		const  notetitle = document.getElementById('notetitle');
		const  notecont = document.getElementById('notecont');
		
		//쪽지 성공여부 확인
		let myNoteInsertCheck = "${myNoteInsertCheck}";
		
		if(myNoteInsertCheck == 1){
			alert("쪽지 전송 완료!");
		}
		
		//빈 칸 체크
		let nullNote = "${nullNote}";
		
		if(nullNote == "값없음"){
			alert("빈 칸을 채워주세요");
		}
		
		//취소 버튼
		document.getElementById('cencelBtn').onclick = function(){
			notetitle.value = null;
			notecont.value = null;
		}; 		
	}
</script>

</head>
<body>
	 <%@include file="/WEB-INF/include/header.jsp" %>
	 <%@include file="/WEB-INF/include/subBanner.jsp" %>
     <div id="aside">
     	내정보<br />
     	작성글<br />
     	쪽지<br />
     </div>
     
     <div id="main">
		<form action="/mypage/myNoteWrite?nowpage=1" method="POST">
			<input type="hidden" name="receiver_usercode" value="${myNoteView.receiver_usercode}" />
			<table id="cont">
				<tr>
					<th>보낸 사람</th>
					<td><input name="nickname" type="text" value="${myNoteView.nickname}"  disabled/></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input id="notetitle" name="notetitle" type="text" value="${myNoteView.note_title}" disabled/></td>
				</tr>
				<%-- <tr>
					<th>그린마켓</th>
					<td><a href="">${myNoteView.board_title}</a></td>
				</tr> --%>
				<tr>
					<th>내용</th>
					<td><textarea id="notecont" name="notecont" disabled>${myNoteView.note_cont}</textarea></td>
				</tr>
			</table>
		</form>
		<button id="answerBtn" style="float: left;"><a href="/mypage/myNoteAnswer?nowpage=1&note_idx=${myNoteView.note_idx}">답장</a></button>
		<button id="cencelBtn" style="float: left;"><a href="/mypage/noteDelete?nowpage=1&note_idx=${myNoteView.note_idx}">삭제</a></button>
	</div>
	
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>