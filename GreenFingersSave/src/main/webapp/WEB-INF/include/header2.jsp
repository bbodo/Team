<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<header>
	<div id="headerInWrap">
	<div id="logo"><a href="/"><img src="/img/common/logo.png" alt="logo" /></a></div>
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
				<c:when	test="${submenu.menu_id eq 'MENU04' and submenu.submenu_id eq 'SUBMENU18'}">
					<li><a href="/Event/EventList?submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li>
				</c:when>		
				<c:when	test="${submenu.menu_id eq 'MENU04' and submenu.submenu_id eq 'SUBMENU19'}">   
				    <li><a href="/Winner/WinnerList?submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li>
				</c:when>
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
		
		<div id="mypageWrap">
			<div><a href="/mypage/myList?nowpage=1">${login.nickname}  님의 마이페이지</a></div>
			<div> <a href="/User/Logout">로그아웃</a></div>
		</div>
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








    