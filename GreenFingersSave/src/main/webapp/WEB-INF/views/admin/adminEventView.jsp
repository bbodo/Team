 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	#section {
		height: auto;
	}
	#aside {
		float: left;
		height: auto;
		background-color: white;
		width: 20%;
		padding: 10px;
	}
	#main {
		width: 80%;
		height: auto;
		float: left;
		padding: 50px 200px 50px 50px;
	}#img1{
	    width: 80%;
	    height: 150px;
	    object-fit : contain;
	}
	#cont {
		background-color: #fff;
		margin: 0 auto;
		width: 100%;
		border-collapse: collapse;
		margin-top: 10px;
		border-top: 3px solid #228B22;
	}
	#cont th {
		background-color: #666;
		margin-top: 20px;
	}
	#cont tr:nth-of-type(2) {
		border-bottom: 1px solid #228B22;
	}
	#reply_coment_cont {
		widows: 875px;
		height: 60px;
		resize: none;
	}
	#board_title {
		font-size: 32px;
		font-weight: bold;
	}
	#commentNoti {
		border-bottom: 3px solid #228B22;
		padding: 20px;
	}
	#readComment {
		margin-bottom: 50px;
	}
	#writeComment {
		border-bottom: 1px solid #228B22;
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
	.nameSpace {
		padding: 30px;
	}
	.coment_cont {
		margin: 0 20px;
		width: 95%;
		padding: 3px;
		height: 70px;
		resize: none;
	}
	.contSpace {
		width: 70%;
		padding: 10px;
	}
	.comment_empty {
		padding-left: 80px;
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






</head>
<body>
	<!-- header -->
	 	 <%@include file="/WEB-INF/include/adminHeader.jsp" %>
	<div id="section">
     <div id="title">
     	<p  style="font-size: 40px; font-weight: bold;" >이벤트</p>
     </div>
    <div id="aside">
     	<ul id="sidemenu">
     	     <a href="/Manager/EventList?menu_id=${ map.menu_id }&submenu_id=${ map.submenu_id }&nowpage=1" >이벤트</a>  <br>  	     	  
     	     <a href="/Manager/WinnerList?menu_id=${ map.menu_id }&submenu_id=SUBMENU19&nowpage=1">당첨자</a>   		
     	</ul>
     </div>

     <div id="main">
     <div><a id="board_title" href="/Manager/EventList?submenu_id=${ map.submenu_id }&nowpage=1">${ map.submenu_name } 게시판</a></div>
		<table id="cont">
			<tr>
				<th class="padd8">제목</th>
				<td class="padd8">${vo.board_title }</td>
			</tr>
			<tr>
				<th class="padd8">작성자</th>
				<td class="padd8">관리자</td>
				<th class="padd8">작성일</th>
				<td class="padd8">${vo.board_regdate }</td>
				<th class="padd8">조회수</th>
				<td class="padd8">${vo.readcount }</td>
			</tr>
				<tr><td colspan="6"><hr /></td></tr>
			<tr>				
				<td colspan="5" id="bc" style="height: 600px; padding: 8px;">
				<c:forEach var="file"  items="${ fileList }" >
				 <div>
					<img id="img1" src="/upload/${ file.sfilename }">
				 </div>
				</c:forEach>
				${ vo.board_cont }
				</td>
			</tr>
		</table>
		<div class="right">			
				<a class="btns" href="/Manager/EventUpdateForm?submenu_id=${vo.submenu_id}&board_idx=${vo.board_idx}&nowpage=${map.nowpage}">수정</a>
				<a class="btns" href="/Manager/EventDelete?submenu_id=${vo.submenu_id}&board_idx=${vo.board_idx}&nowpage=${map.nowpage}">삭제</a> <br />			
		</div>
		
</body>
</html>