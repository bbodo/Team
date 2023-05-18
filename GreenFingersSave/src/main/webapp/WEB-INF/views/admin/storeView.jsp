<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
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
	#section {
		height: auto;
	}
	#aside {
		float: left;
		height: 1500px;
		background-color: white;
		width: 15%;
		padding: 10px;
	}
	#main {
		width: 85%;
		height: auto;
		min-height: 1500px;
		float: left;
		padding: 10px;
		background-color: white;
		padding-right : 15%;
		min-height: calc(100% - 120px);
		padding-bottom: 100%;
	}
	#cont {
		background-color: #fff;
		margin: 0 auto;
		width: 90%;
		border-collapse: collapse;
		margin-top: 10px;
		border-top: 3px solid #228B22;
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

	#cont th td {
		padding: 15px;
		border-bottom: 1px solid #C0C0C0;
	}
	.right {
		text-align: right;
		margin-top: 20px;
		margin-right: 150px;
	}
	textarea {
		width: 1000px;
	}
	.floatright {
		float:right;
	}
	.floatleft {
		float:left;
	}
    #bc {
    	height: 500px;
    	vertical-align: top;
    	padding-top: 10px;
    }  

</style>

</head>
<body>
	<%@include file="/WEB-INF/include/adminHeader.jsp" %>
	<%@include file="/WEB-INF/include/adminsubBanner.jsp" %>
	<div id="section">
    <!--  <div id="title">
     	<p>그린마켓</p>
     </div> -->
     <div id="aside">
      <ul id="sidemenu">
     		<li><a href="/Manager/Member">회원 관리</a><br /></li>
       		<li><a href="/Manager/Menu">메뉴 관리</a> <br /></li>
     		<li><a href="/Manager/subMenu"> - 하위 메뉴</a><br /></li>
     		<li><a href="/Manager/EventList?menu_id=Event&nowpage=1">이벤트 관리</a><br /></li>
     		<li><a href="/Manager/WinnerList?menu_id=Winner&nowpage=1">당첨자관리</a><br /></li>
     		<li><a href="/Manager/SeminarList?menu_id=Festival&submenu_id=SUBMENU21&nowpage=1">행사 관리</a></li>
     		<li><a href="/Manager/Store?menu_id=Store">스토어 관리</a><br /></li>
      </ul>
     </div>
     
     <div id="main">
     
	   <div><a style="padding-left: 80px;" id="board_title" >스토어 상품 상세보기</a></div>
	    
		<table id="cont">
			<tr>
				<td class="padd8">제목</td>
				<td class="padd8">${ vo.board_title }</td>
			</tr>
			<tr>
				<td class="padd8">작성일</td>
				<td class="padd8">${ vo.board_regdate }</td>
			</tr>
			<tr>	
				<td class="padd8" >조회수</td>
				<td class="padd8">${ vo.readcount }</td>
			</tr>
			<tr>
			   <td class="padd8">가격</td>
			   <td class="padd8">${ vo.market_value }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="5" id="bc">
				<c:forEach var="file"  items="${ fileList }" >
				 <div>
					<img src="/upload/${ file.sfilename }">
				 </div>
				</c:forEach>
				${ vo.board_cont }
				</td>
			</tr>
			<tr>
				<th>파일 첨부</th>
				<td colspan="5"> 
				<c:forEach var="file"  items="${ fileList }" >
				<div>
					<a href="/Manager/download/external/${ file.sfilename }">
					${ file.filename }
					</a>
				</div>
				</c:forEach> 
   	    	 </td>
			</tr>
		</table>
		
		<div class="right">
		<a href="/Manager/storeUpdateForm?menu_id=Store&submenu_id=${vo.submenu_id}&board_idx=${vo.board_idx}">수정</a>&nbsp
		<a href="/Manager/storeDelete?menu_id=Store&submenu_id=${vo.submenu_id}&board_idx=${ vo.board_idx }" onclick="if(!confirm('정말로 삭제하시겠습니까?')){return false;}">삭제</a>&nbsp
		<a href="/Manager/Store?menu_id=Store">목록으로</a>
		</div>
	
      </div>
     </div>
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>