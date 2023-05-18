<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<title>회원관리</title>

<style type="text/css">
	* {
		box-sizing: border-box;
	} 
	#main {
		width: 85%;
		min-height: 800px;
		float: left;
		padding: 10px;
		padding-right: 15%;
		background-color: white;
		text-align: center;
		height: auto;
	}
	#tt {
		text-align: left;
	}
	#cont {
		background-color: #fff;
		margin: 0 auto;
		width: 90%;
		border-collapse: collapse;
		margin-bottom: 50px;
 	    border-bottom: 3px solid #228B22;
	}
	#cont th {
		background-color: white;
 	    border-top: 3px solid #228B22;
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
     <%@include file="/WEB-INF/include/adminsubBanner.jsp" %>
     <div id="wrapper">
      <div id="aside">
       <ul id="sidemenu">
      		<li class="sidemenuTitle">SIDEMENU</li>
			<li><a href="/Manager/Member?menu_id=Member">회원 관리</a><br /></li>
       		<li><a href="/Manager/Menu?menu_id=Menu">메뉴 관리</a> <br /></li>
     		<li><a href="/Manager/subMenu?menu_id=subMenu"> - 하위 메뉴</a><br /></li>
     		<li><a href="/Manager/EventList?menu_id=Event&nowpage=1">이벤트 관리</a><br /></li>
     		<li><a href="/Manager/WinnerList?menu_id=Winner&nowpage=1">당첨자관리</a><br /></li>
     		<li><a href="/Manager/SeminarList?menu_id=Festival&submenu_id=SUBMENU21&nowpage=1">행사 관리</a></li>
     		<li><a href="/Manager/Store?menu_id=Store">스토어 관리</a><br /></li>
       </ul>
     </div>
     <div id="main">
		<table id="cont">
			<tr>
				<th>유저코드</th>
				<th>이름</th>
				<th>아이디</th>
				<th>유저등급</th>
				<th>포인트</th>
			</tr>
			<c:forEach var="user" items="${ userList }">
			<tr>
				<td><a href="/Manager/memberUpdateForm?menu_id=Member&usercode=${ user.usercode }">${ user.usercode }</a></td>
				<td><a href="/Manager/memberUpdateForm?menu_id=Member&usercode=${ user.usercode }">${ user.username }</a></td>
				<td><a href="/Manager/memberUpdateForm?menu_id=Member&usercode=${ user.usercode }">${ user.userid }</a></td>
				<td><a href="/Manager/memberUpdateForm?menu_id=Member&usercode=${ user.usercode }">${ user.grade }</a></td>
				<td><a href="/Manager/memberUpdateForm?menu_id=Member&usercode=${ user.usercode }">${ user.point }</a></td>
			</tr>
			</c:forEach>
		</table>
     </div>
     </div>
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>