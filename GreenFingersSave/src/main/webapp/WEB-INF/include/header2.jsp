<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 메뉴목록 -->

<header>
	<div id="headerInWrap">
	<div id="logo"><a href="/">logo</a></div>
	<div id="menu1">
	<ul>
		<c:forEach var="menu" items="${ menuList }">
		<c:choose>
			<c:when test="${menu.menu_id eq 'MENU01'}">
			<li><a href="/Board/List?submenu_id=${submenuList[0].submenu_id}&nowpage=1">${ menu.menu_name }</a>
				<ul>
				<c:forEach var="submenu" items="${ submenuList }">
				<c:if test="${submenu.menu_id eq menu.menu_id }">
				<c:choose>
				<c:when	test="${(submenu.menu_id eq 'MENU01') or (submenu.menu_id eq 'MENU02')}">
					<li><a href="/Board/List?submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				<c:when	test="${submenu.menu_id eq 'MENU03'}">
					<li><a href="/Market/AdoptList?submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				<c:when	test="${submenu.menu_id eq 'MENU04'}">
					<li><a href="/eventList?submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				<c:when	test="${submenu.menu_id eq 'MENU05'}">
					<li><a href="/Board/List?submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				</c:choose>	
				</c:if>	
				</c:forEach>
				</ul>
			</li>
			</c:when>
			<c:when test="${menu.menu_id eq 'MENU02'}">
			<li><a href="/Board/List?submenu_id=${submenuList[10].submenu_id}&nowpage=1">${ menu.menu_name }</a>
				<ul>
				<c:forEach var="submenu" items="${ submenuList }">
				<c:if test="${submenu.menu_id eq menu.menu_id }">
				<c:choose>
				<c:when	test="${(submenu.menu_id eq 'MENU01') or (submenu.menu_id eq 'MENU02')}">
					<li><a href="/Board/List?submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				<c:when	test="${submenu.menu_id eq 'MENU03'}">
					<li><a href="/Market/AdoptList?submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				<c:when	test="${submenu.menu_id eq 'MENU04'}">
					<li><a href="/eventList?submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				<c:when	test="${submenu.menu_id eq 'MENU05'}">
					<li><a href="/Board/List?submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				</c:choose>	
				</c:if>	
				</c:forEach>
				</ul>
			</li>
			</c:when>
			<c:when test="${menu.menu_id eq 'MENU03'}">
			<li><a href="/Market/AdoptList?submenu_id=${submenuList[14].submenu_id}&nowpage=1">${ menu.menu_name }</a>
				<ul>
				<c:forEach var="submenu" items="${ submenuList }">
				<c:if test="${submenu.menu_id eq menu.menu_id }">
				<c:choose>
				<c:when	test="${(submenu.menu_id eq 'MENU01') or (submenu.menu_id eq 'MENU02')}">
					<li><a href="/Board/List?submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				<c:when	test="${submenu.menu_id eq 'MENU03'}">
					<li><a href="/Market/AdoptList?submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				<c:when	test="${submenu.menu_id eq 'MENU04'}">
					<li><a href="/eventList?submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				<c:when	test="${submenu.menu_id eq 'MENU05'}">
					<li><a href="/Board/List?submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				</c:choose>	
				</c:if>	
				</c:forEach>
				</ul>
			</li>
			</c:when>
			<c:when test="${menu.menu_id eq 'MENU04'}">
			<li><a href="/eventList?submenu_id=${submenuList[17].submenu_id}&nowpage=1">${ menu.menu_name }</a>
				<ul>
				<c:forEach var="submenu" items="${ submenuList }">
				<c:if test="${submenu.menu_id eq menu.menu_id }">
				<c:choose>
				<c:when	test="${(submenu.menu_id eq 'MENU01') or (submenu.menu_id eq 'MENU02')}">
					<li><a href="/Board/List?submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				<c:when	test="${submenu.menu_id eq 'MENU03'}">
					<li><a href="/Market/AdoptList?submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				<c:when	test="${submenu.menu_id eq 'MENU04'}">
					<li><a href="/eventList?submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				<c:when	test="${submenu.menu_id eq 'MENU05'}">
					<li><a href="/Board/List?submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				</c:choose>	
				</c:if>	
				</c:forEach>
				</ul>
			</li>
			</c:when>
			<c:when test="${menu.menu_id eq 'MENU05'}">
			<li><a href="/Wiki/List?submenu_id=${submenuList[18].submenu_id}&nowpage=1">${ menu.menu_name }</a>
				<ul>
				<c:forEach var="submenu" items="${ submenuList }">
				<c:if test="${submenu.menu_id eq menu.menu_id }">
				<c:choose>
				<c:when	test="${(submenu.menu_id eq 'MENU01') or (submenu.menu_id eq 'MENU02')}">
					<li><a href="/Board/List?submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				<c:when	test="${submenu.menu_id eq 'MENU03'}">
					<li><a href="/Market/AdoptList?submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				<c:when	test="${submenu.menu_id eq 'MENU04'}">
					<li><a href="/eventList?submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				<c:when	test="${submenu.menu_id eq 'MENU05'}">
					<li><a href="/Board/List?submenu_id=${submenu.submenu_id}&nowpage=1">
						${submenu.submenu_name}</a></li></c:when>
				</c:choose>	
				</c:if>	
				</c:forEach>
				</ul>
			</li>
			</c:when>
		</c:choose>
		</c:forEach>
		<li><a href="login" class="right">로그인</a></li>
			</ul>
		</div>
	</div>
</header>
<%-- 	   <nav>
	      <c:if test="${ usercode != null }">
	         <div><a href="/">로그아웃</a></div>
	         <div><a href="">마이페이지</a></div>
	      </c:if>
	      
	      <c:if test="${  usercode== null }">
	      </c:if>
	      <div style="display: inline-block;"><a href="/myPageCheck">마이페이지</a></div> 
	      <div style="display: inline-block;"><a href="/logout">로그아웃</a></div>
	   </nav> --%> --%>

 
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








    