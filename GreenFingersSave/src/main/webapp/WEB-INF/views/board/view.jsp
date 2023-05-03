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

</style>

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
			<table>
				<tr>
					<th>달러 아이디 넣을곳</th>
					<td><textarea></textarea></td>
					<td><a href="">등록</a></td>
				</tr>
			</table>
		</div>
		<div id="readComment">
			<table>
				<tr>
					<th>달러 아이디 넣을곳</th>
					<td>댓글 내용 불러올곳</td>
				</tr>
				<!-- 답글/수정/삭제 이 칸만 조금만 작게 -->
				<tr>
					<td>답글</td>
					<!-- 나중에 if 문 -->
					<td><a href="">수정</a></td>
					<td><a href="">삭제</a></td>
				</tr>
			</table>
		</div>
		
     <%@include file="/WEB-INF/include/paging.jsp" %>
     </div>
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>