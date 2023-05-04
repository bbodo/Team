 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<title>${ map.submenu_name } 게시글 보기</title>

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
		width: 650px;
	}
	.floatright {
		float:right;
	}
	.floatleft {
		float:left;
	}

</style>

<script src="https://code.jquery.com/jquery.min.js"></script>

<script>
		
		function comment_display(data) {
			console.log(data);
			
			let html = '';
			for (let comm of data) {
				html += '<div class="floatleft"><h2>'+ comm.nickname +'</h2></div>';
				html += '<div class="floatright"><h2>'+ comm.coment_regdate +'</h2></div><br />';
				html += '<div class="floatleft reComment">'+ comm.coment_cont +'</div>';
				html += '<div class="floatright"><input type="button" value="수정" /> <input type="button" value="삭제" /></div><br />';
				html += '<div id="replyComment" style="display:none;">';
				html += '<textarea id="reply_coment_cont"></textarea>';
				html += '<button id="replyBtn">작성</button></div>';
			}
			
			const commentZoneEl = document.getElementById("commentZone");
			commentZoneEl.innerHTML = html;
			
		}
	window.onload = function() {
		
		const writeBtnEl = document.getElementById("writeBtn");
		const coment_contEl = document.getElementById("coment_cont");
		const readCEl = document.getElementById("readC");
		const writeCEl = document.getElementById("writeC");
		
		let datar = new FormData(readCEl);
		
		let optionR = {
				method : "POST",
				body : datar
		};
		
		fetch("/Comment/Read", optionR)
			.then( res => res.json() )
			.then( data => {
				comment_display(data);
				
				const commentZoneEl = document.getElementById("commentZone");
				commentZoneEl.addEventListener("click", function(e) {
				    e.preventDefault();
				    const target = e.target;
				    if (target.classList.contains("reComment")) {
				        const replyCommentEl = document.getElementById("replyComment");
				        replyCommentEl.style.display = "block";
				    }
				});
				
			})
			.catch( err => {
				console.log(err);
				alert("오류발생 : " + err);
			});
		
		writeBtnEl.addEventListener("click", function(e) {
			let dataw = new FormData(writeCEl);
			
			let optionW = {
					method : "POST",
					body : dataw
			};
			
			fetch("/Comment/Write", optionW)
				.then( res => res.json() )
				.then( data => {
					comment_display(data);
					coment_contEl.value = '';
					coment_contEl.focus();
				})
				.catch( err => {
					console.log(err);
					alert("오류발생 : " + err);
				})
		})
		
		
	}

</script>

</head>
<body>
	 <%@include file="/WEB-INF/include/header.jsp" %>
     <div id="title">
     	<p>식물 연합</p>
     </div>
     <div id="aside">
     	포이즌<br />
     	포이즌<br />
     	포이즌<br />
     	포이즌<br />
     	포이즌<br />
     	포이즌<br />
     </div>
     <div id="main">
		<table id="cont">
			<caption class="left">${ map.submenu_name }게시글 보기</caption>
			<tr>
				<th>제목</th>
				<td>${vo.board_title }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${vo.nickname }</td>
				<th>작성일</th>
				<td>${vo.board_regdate }</td>
				<th>조회수</th>
				<td>${vo.readcount }</td>
			</tr>
				<tr><td colspan="6"><hr /></td></tr>
			<tr>
				<th>내용</th>
				<td>${vo.board_cont }</td>
			</tr>
			<tr>
				<th>파일 첨부</th>
				<td> 
				<c:forEach var="file"  items="${ fileList }" >
				<div>
					<a href="/Board/download/external/${ file.sfilename }">
					${ file.filename }
					</a>
				</div>
				</c:forEach> 
   	    	 </td>
			</tr>
		</table>
		<!-- 나중에 if 문 -->
		<div class="right">
		<a href="/Board/WriteForm?submenu_id=${vo.submenu_id}&board_idx=${vo.board_idx}&bnum=${vo.bnum}&lvl=${vo.lvl}&step=${vo.step}&nref=${vo.nref}&nowpage=${map.nowpage}&userid=${login.userid}">답글쓰기</a>
		<a href="/Board/UpdateForm?submenu_id=${vo.submenu_id}&board_idx=${vo.board_idx}&nowpage=${map.nowpage}">수정</a>
		<a href="/Board/Delete?submenu_id=${vo.submenu_id}&board_idx=${ vo.board_idx }&nowpage=${map.nowpage}">삭제</a> <br />
		</div>
	
		<br />
		
		<div id="writeComment">
			<form id="writeC">
			<input type="hidden"  name="board_idx" value="${ vo.board_idx }" />
			<input type="hidden"  name="usercode" value="${ login.usercode }" />
			<table>
				<tr>
					<th>${ login.nickname }</th>
					<td>
						<textarea name="coment_cont" placeholder="내용을 작성하세요."
					     required id="coment_cont"></textarea>
					</td>
					<td><input type="button" id="writeBtn" value="등록"/></td>
				</tr>
			</table>
			</form>
		</div>
		<br />
		<div id="readComment">
			<form id="readC">
			<input type="hidden"  name="board_idx" value="${ vo.board_idx }" />
			<div id="commentZone"></div>
			</form>
		</div>
     </div>
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>