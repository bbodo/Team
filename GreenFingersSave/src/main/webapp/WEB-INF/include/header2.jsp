<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
 <!-- <style type="text/css">

	* {
		margin: 0;
		padding: 0;
	}

	ul li{
		list-style: none;
	}

	a {
		text-decoration: none;
		color:#333;
	}

	#menu1 {
		width:100%;
		height:50px;
		background: #ccc;
		color:black;
		line-height: 50px; 
		margin:0 auto;
		text-align: center;
	}


	#menu1 > ul > li {
		float:left;
		width:140px;
		position:relative;
	}
	
	#menu1 > ul > li > ul {
		width:130px;
		display:none;
		position: absolute;
		font-size:14px;
		background: skyblue;
	}
	
		#menu1 > ul > li:hover > ul {
		display:block;
	}
	
	#menu1 > ul > li > ul > li:hover {
		background: orange;
		transition: ease 1s;
		}
	</style> -->
<!-- 메뉴목록 -->

<header>
	<div id="headerInWrap">
	<div class="sub_bg"></div>
	<div id="logo"><a href="/"><img src="./img/common/logo.png" alt="logo" /></a></div>
	<div id="menu1">
	<nav>
		<c:forEach var="menu" items="${ menuList }">
		<c:choose>
			<c:when test="${menu.menu_id eq 'MENU01'}">
			<li><a href="/Board/List?menu_id=${ menu.menu_id }&submenu_id=${submenuList[0].submenu_id}&nowpage=1">${ menu.menu_name }</a>
				<ul>
				<c:forEach var="submenu" items="${ submenuList }">
				<c:if test="${submenu.menu_id eq menu.menu_id }">
				<c:choose>
				<c:when	test="${(submenu.menu_id eq 'MENU01') or (submenu.menu_id eq 'MENU02')}">
					<li><a href="/Board/List?menu_id=${ submenu.menu_id }&submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				<c:when	test="${submenu.menu_id eq 'MENU03'}">
					<li><a href="/Market/List?menu_id=${ submenu.menu_id }&submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				<c:when	test="${submenu.menu_id eq 'MENU04'}">
					<li><a href="/Event/EventList?menu_id=${ submenu.menu_id }&submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				<c:when	test="${submenu.menu_id eq 'MENU05'}">
					<li><a href="/Wiki/List?submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				</c:choose>	
				</c:if>	
				</c:forEach>
				</ul>
			</li>
			</c:when>
			<c:when test="${menu.menu_id eq 'MENU02'}">
			<li><a href="/Board/List?menu_id=${ menu.menu_id }&submenu_id=${submenuList[10].submenu_id}&nowpage=1">${ menu.menu_name }</a>
				<ul>
				<c:forEach var="submenu" items="${ submenuList }">
				<c:if test="${submenu.menu_id eq menu.menu_id }">
				<c:choose>
				<c:when	test="${(submenu.menu_id eq 'MENU01') or (submenu.menu_id eq 'MENU02')}">
					<li><a href="/Board/List?menu_id=${ submenu.menu_id }&submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				<c:when	test="${submenu.menu_id eq 'MENU03'}">
					<li><a href="/Market/List?menu_id=${ submenu.menu_id }&submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				<c:when	test="${submenu.menu_id eq 'MENU04'}">
					<li><a href="/Event/EventList?menu_id=${ submenu.menu_id }&submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				<c:when	test="${submenu.menu_id eq 'MENU05'}">
					<li><a href="/Wiki/List?submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				</c:choose>	
				</c:if>	
				</c:forEach>
				</ul>
			</li>
			</c:when>
			<c:when test="${menu.menu_id eq 'MENU03'}">
			<li><a href="/Market/Main?menu_id=${menu.menu_id}&submenu_id=${submenuList[14].submenu_id}&nowpage=1">${ menu.menu_name }</a>
				<ul>
				<c:forEach var="submenu" items="${ submenuList }">
				<c:if test="${submenu.menu_id eq menu.menu_id }">
				<c:choose>
				<c:when	test="${(submenu.menu_id eq 'MENU01') or (submenu.menu_id eq 'MENU02')}">
					<li><a href="/Board/List?menu_id=${ submenu.menu_id }&submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				<c:when	test="${submenu.menu_id eq 'MENU03'}">
					<li><a href="/Market/List?menu_id=${ submenu.menu_id }&submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				<c:when	test="${submenu.menu_id eq 'MENU04'}">
					<li><a href="/Event/EventList?menu_id=${ submenu.menu_id }&submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				<c:when	test="${submenu.menu_id eq 'MENU05'}">
					<li><a href="/Wiki/List?submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				</c:choose>	
				</c:if>	
				</c:forEach>
				</ul>
			</li>
			</c:when>
			<c:when test="${menu.menu_id eq 'MENU04'}">
			<li><a href="/Event/EventList?submenu_id=${submenuList[17].submenu_id}&nowpage=1">${ menu.menu_name }</a>
				<ul>
				<c:forEach var="submenu" items="${ submenuList }">
				<c:if test="${submenu.menu_id eq menu.menu_id }">
				<c:choose>
				<c:when	test="${(submenu.menu_id eq 'MENU01') or (submenu.menu_id eq 'MENU02')}">
					<li><a href="/Board/List?submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				<c:when	test="${submenu.menu_id eq 'MENU03'}">
					<li><a href="/Market/List?submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				<c:when	test="${submenu.menu_id eq 'MENU04'}">
					<li><a href="/Event/EventList?submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				<c:when	test="${submenu.menu_id eq 'MENU05'}">
					<li><a href="/Wiki/List?submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				</c:choose>	
				</c:if>	
				</c:forEach>
				</ul>
			</li>
			</c:when>
			<c:when test="${menu.menu_id eq 'MENU05'}">
			<li><a href="/Wiki/List?submenu_id=${submenuList[19].submenu_id}&nowpage=1">${ menu.menu_name }</a>
				<ul>
				<c:forEach var="submenu" items="${ submenuList }">
				<c:if test="${submenu.menu_id eq menu.menu_id }">
				<c:choose>
				<c:when	test="${(submenu.menu_id eq 'MENU01') or (submenu.menu_id eq 'MENU02')}">
					<li><a href="/Board/List?submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				<c:when	test="${submenu.menu_id eq 'MENU03'}">
					<li><a href="/Market/List?submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				<c:when	test="${submenu.menu_id eq 'MENU04'}">
					<li><a href="/Event/EventList?submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				<c:when	test="${submenu.menu_id eq 'MENU05'}">
					<li><a href="/Wiki/List?submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				</c:choose>	
				</c:if>	
				</c:forEach>
				</ul>
			</li>
			</c:when>
		</c:choose>
		</c:forEach>
		</nav>
		</div>

		<div><a href="">${login.nickname}  님의 마이페이지</a></div>
		<div> <a href="/User/Logout">로그아웃</a></div>
	</div>
</header>

 
<%-- <table  id="header">
   
<tr>
   <td><a href="/">버튼1</a></td>
   <td><a href="/">버튼1</a></td>
   <td><a href="/">버튼1</a></td>
   <c:forEach  var="menu"  items="${ menuList }">   
     <td>
       <a href="/Board/List?menu_id=${ menu.menu_id }">${ menu.menu_name }</a> 
     </td>
   </c:forEach>
   <td class="right"><a href="login">로그인</a></td>
 </tr>

</table>
 --%>








    