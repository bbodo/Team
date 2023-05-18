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
	#section {
		height: auto;
	}
	#main {
		width: 80%;
		height: auto;
		float: left;
		padding: 50px 200px 50px 50px;
	}#img1{
	    max-width: 100%;
	    height: auto;
	    display:block;
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
	<%@include file="/WEB-INF/include/adminsubBanner.jsp" %>
   <div id="wrapper">
      <div id="aside">
       <ul id="sidemenu">
       <li class="sidemenuTitle">SIDEMENU</li>
			<li><a href="/Manager/Member?menu_id=Member">회원 관리</a><br /></li>
       		<li><a href="/Manager/Menu?menu_id=Menu">메뉴 관리</a> <br /></li>
     		<li><a href="/Manager/subMenu?menu_id=subMenu"> - 하위 메뉴</a><br /></li>
     		<li><a href="/Manager/EventList?menu_id=Event&nowpage=1">이벤트 관리</a><br /></li>
     		<li><a href="/Manager/WinnerList?menu_id=Winner&nowpage=1">당첨자 관리</a><br /></li>
     		<li><a href="/Manager/SeminarList?menu_id=Festival&submenu_id=SUBMENU21&nowpage=1">행사 관리</a></li>
     		<li><a href="/Manager/Store?menu_id=Store">스토어 관리</a><br /></li>
       </ul>
     </div>

     <div id="main">
     <div><a id="board_title" href="/Manager/EventList?submenu_id=${ map.submenu_id }&nowpage=1">${ map.submenu_name } 게시판</a></div>
		<table class="cont" style="border-top: 3px solid #228B22;">
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
				<a class="btns" href="/Manager/WinnerUpdateForm?menu_id=Winner&submenu_id=${vo.submenu_id}&board_idx=${vo.board_idx}&nowpage=${map.nowpage}">수정</a>
				<a class="btns" href="/Manager/WinnerDelete?menu_id=Winner&submenu_id=${vo.submenu_id}&board_idx=${vo.board_idx}&nowpage=${map.nowpage}">삭제</a> <br />			
		</div>
		
	
     </div>
</body>
</html>