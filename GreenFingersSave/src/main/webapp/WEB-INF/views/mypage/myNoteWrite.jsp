<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<!-- <script type="text/javascript" src="/js/myNote.js"></script> -->
<title>쪽지 쓰기</title>

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
	#cont {
		background-color: #fff;
		margin: 0 auto;
		width: 100%;
	}
	#cont th {
		background-color: #666;
	}
	.right {
		text-align: right;
	}
	.left {
		text-align: left;
	}
	textarea {
		width: 100%;
		height: 500px;
	}
	input[type=text] {
		width: 100%;
	}

</style>

<script>
	window.onload = function() {
		const  submitBtn = document.getElementById('submitBtn');
		const  notetitle = document.getElementById('notetitle');
		const  notecont = document.getElementById('notecont');
		
		console.log(notetitle);
		
		//빈칸 채우기 작업중
		function nullCheck(e) {
			e.preventDefault();
			console.log(notetitle);
			if(notetitle.value.length == 0){
				alert("빈칸을 채워주세요");
				return false;
			}
			return true;
		}
		
		/* submitBtn.onclick = function(){
			if(notetitle == null || notecont == null){
				alert("빈칸을 채워주세요");
				return false;
			}
		}; */
		
		//취소 버튼
		document.getElementById('cencelBtn').onclick = function(){
			notetitle.value = null;
			notecont.value = null;
			console.log("ddd" + notetitle.append);
			/* e.preventDefault(); */
		}; 		
	}
</script>

</head>
<body>
	 <%@include file="/WEB-INF/include/header.jsp" %>
     <div id="title">
     	<p>쪽지 쓰기</p>
     </div>
     <div id="aside">
     	내정보<br />
     	작성글<br />
     	쪽지<br />
     </div>
     
     <div id="main">
		<form action="/myNoteWrite/myNoteWrite" method="POST" onsubmit="return nullCheck();">
			<input type="hidden" name="receiver_usercode" value="${param.receiver_usercode}" />

			<table id="cont">
				<tr>
					<th>받는 사람</th>
					<td><input name="nickname" type="text" value="${myNoteVo.nickname}" />${myNoteVo.nickname}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input id="notetitle" name="notetitle" type="text" /></td>
				</tr>
				<tr>
					<th>그린마켓</th>
					<td><a href="">${myNoteVo.board_title}</a></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea id="notecont" name="notecont"></textarea></td>
				</tr>
			</table>
			<%@include file="/WEB-INF/include/paging.jsp"%>
			<input style="float: right;" id="submitBtn" type="submit" value="전송"/>
		</form>
		<button id="cencelBtn" style="float: left;">취소 버튼</button>
	</div>
	
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>