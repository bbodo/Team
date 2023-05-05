 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<title>${ map.submenu_name } 게시글 상세보기</title>

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
		height: 1500px;
		background-color: navy;
		width: 20%;
		padding: 10px;
	}
	#aside a {
		color: #fff;
	}
	
	#main {
		width: 80%;
		height: 1500px;
		float: left;
		padding: 10px;
		background-color: gray;
	}
	#cont {
		background-color: #fff;
		margin: 0 auto;
		width: 80%;
	}
	table {
		border-collapse: collapse;
	}
	#cont th {
		background-color: #666;
		border: 1px solid black;
		padding: 10px 10px;
	}
	#cont td {
		padding-left: 10px;
		border: 1px solid black;
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
		font-size: 20px;
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
    
    #bc {
    	height: 500px;
    	vertical-align: top;
    	padding-top: 10px;
    }  

</style>

<script>

		function comment_display(data) {
			console.log(data);
			
			let html = `<table id="commentList">`;
			for (let comm of data) {
				html += '<tr>';
				html += '<td><h2>' + comm.nickname + '</h2></td>';				
				html += '<td>' + comm.coment_cont + '</td>';				
				html += `</tr>`;
			}
			html += `</table>`;
			
			const readCommentEl = document.getElementById("readComment");
			readCommentEl.innerHTML = html;
			console.log(readCommentEl);
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
     	<p>그린마켓</p>
     </div>
     <div id="aside">
     	<a href="/Market/List?submenu_id=SUBMENU15&nowpage=1">입양원해요</a><br />
     	<a href="/Market/List?submenu_id=SUBMENU16&nowpage=1">나눔합니다</a><br />
     	<a href="/Market/List?submenu_id=SUBMENU17&nowpage=1">포인트 스토어</a><br />
     </div>
     <div id="main">
		<table id="cont">
			<caption class="left">${ map.submenu_name } 게시글 보기</caption>
			<tr>
				<th>제목</th>
				<td colspan="5">${ vo.board_title }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${ vo.nickname }</td>
				<th>작성일</th>
				<td>${ vo.board_regdate }</td>
				<th>조회수</th>
				<td>${ vo.readcount }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="5" id="bc">${ vo.board_cont }</td>
			</tr>
			<tr>
				<th>파일 첨부</th>
				<td colspan="5"> 
				<c:forEach var="file"  items="${ fileList }" >
				<div>
					<a href="/Market/download/external/${ file.sfilename }">
					${ file.filename }
					</a>
				</div>
				</c:forEach> 
   	    	 </td>
			</tr>
		</table>
		
	<!-- 나중에 if 문 -->
		<div class="right">
		<a href="">쪽지</a>
		<a href="/Market/WriteForm?submenu_id=${vo.submenu_id}&board_idx=${vo.board_idx}&bnum=${vo.bnum}&lvl=${vo.lvl}&step=${vo.step}&nref=${vo.nref}&nowpage=${map.nowpage}&userid=${login.userid}">답글쓰기</a>
		<a href="/Market/UpdateForm?submenu_id=${vo.submenu_id}&board_idx=${vo.board_idx}&nowpage=${map.nowpage}">수정</a>
		<a href="/Market/Delete?submenu_id=${vo.submenu_id}&board_idx=${ vo.board_idx }&nowpage=${map.nowpage}">삭제</a> 
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
			</form>
		</div>
		
       
      	<h3>인기 마켓</h3>
		<div id="hot">
		     <figure>
		     <a href="">
		    <div class="plant">
		     <img src="/img/market/그린마켓1.png" >
		  </div>
		  </a>
		     <span class="tag">나눔</span>
		     <p>루브라 나눔합니다</p>
		  </figure>
		     <figure>
		     <a href="">
		    <div class="plant">
		     <img src="/img/market/그린마켓2.png" >
		  </div>
		  </a>
		     <span class="tag">나눔</span>
		     <p>제라늄 데려가실 분</p>
		  </figure>
		     <figure>
		     <a href="">
		    <div class="plant">
		     <img src="/img/market/그린마켓3.png">
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