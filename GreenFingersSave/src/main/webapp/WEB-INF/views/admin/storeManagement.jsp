<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<title>스토어 관리</title>

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
		padding-right: 15%;
		background-color: white;
		text-align: center;
	}
	#tt {
		text-align: left;
	}
	#cont {
		background-color: #fff;
		margin: 0 auto;
		margin-bottom:50px;
		width: 90%;
		border-collapse: collapse;
	}
	#cont th {
		background-color: white;
		border-top: 3px solid #C0C0C0;
		border-bottom: 1px solid #C0C0C0;
		padding: 20px;
	}
	#cont tr td {
		padding: 15px;
		border-bottom: 1px solid #C0C0C0;
	} 
	#cont tr:hover {
		background-color: #D3D3D3;
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
	.as {
		position: relative;
	}
	.as:after {
		content: "";
		position: absolute;
		left: 0;
		bottom: -10px;
		width: 0px;
		height: 2px;
		margin: 5px 0 0;
		transition: all 0.2s ease-in-out;
		transition-duration: 0.3s;
		opacity: 0;
		background-color: #8fd3f4;
	}
	.as:hover:after {
		width: 100%;
 		opacity: 1;
	}
	#add {
		text-align: right;
		margin: 30px 0;
		margin-right: 100px;
	}

</style>

</head>
	<%@include file="/WEB-INF/include/adminHeader.jsp" %>
<body>
     <div id="title">
     	<p>스토어 관리</p>
     </div>
     <div id="aside">
       <ul id="sidemenu">
			<li><a href="/Manager/Member">회원 관리</a><br /></li>
       		<li><a href="/Manager/Menu">메뉴 관리</a> <br /></li>
     		<li><a href="/Manager/subMenu"> - 하위 메뉴</a><br /></li>
     		<li><a href="">이벤트 등록</a><br /></li>
     		<li><a href="/Manager/Store">상품 등록</a><br /></li>
       </ul>
     </div>
     
     <div id="main">
    <div id="add"><a href="/Manager/storeWriteForm">상품 등록</a></div>
	<table id="cont">
	 <tr>
       <th>번호</th>
       <th>제목</th>
       <th>작성일</th> 
       <th>가격</th>
       <th>조회수</th>
     </tr>
     
      <c:forEach var="store" items="${ storeList }">
      <tr>
       <td>${ store.board_idx  }</td>
       <td>
        <a href="/Manager/View?submenu_id=${ store.submenu_id }&board_idx=${ store.board_idx }">
       	   ${ store.board_title }
        </a>
       </td>
       <td>${fn:substring( store.board_regdate, 0, 10) }</td>
       <td>${ store.market_value }</td>
       <td>${ store.readcount }</td>
     </tr>
     </c:forEach>   
	</table>
	<%@include file="/WEB-INF/include/paging.jsp" %>
     </div>
	<%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>