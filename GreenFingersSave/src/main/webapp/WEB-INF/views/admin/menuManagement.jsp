<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<title>메뉴 관리</title>

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

</style>

</head>
<body>
	 <%@include file="/WEB-INF/include/adminHeader.jsp" %>
     <div id="title">
     	<p>상위 메뉴 관리</p>
     </div>
     <div id="aside">
       <ul id="sidemenu">
			<li><a href="/Manager/Member">회원 관리</a><br /></li>
       		<li><a href="/Manager/Menu">메뉴 관리</a> <br /></li>
     		<li><a href=""> - 하위 메뉴</a><br /></li>
     		<li><a href="">이벤트 등록</a><br /></li>
     		<li><a href="">마켓 등록</a><br /></li>
       </ul>
     </div>
     <div id="main">
		<table id="cont">
			 <tr>
       <td>Menu_id</td>
       <td>Menu_Name</td>
       <td>Menu_seq</td>
       <td></td>
       <td></td>
     </tr>
     <tr>
       <td colspan="5" class="right">
          <a href="/Manager/menuWriteForm">상세 등록</a> &nbsp;&nbsp;
          <a href="/Manager/menuSimpleWriteForm">간편 등록</a>
       </td>       
     </tr>
     <c:forEach var="menu" items="${ menuList }">
     <tr>
       <td>${ menu.menu_id }</td>
       <td>${ menu.menu_name }</td>
       <td>${ menu.menu_seq }</td>
       <td><a href="">삭제</a></td>
       <td><a href="">수정</a></td>
     </tr>   
     </c:forEach>
		</table>
     </div>
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>