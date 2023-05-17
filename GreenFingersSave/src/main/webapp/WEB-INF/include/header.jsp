<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<header>
	<div id="headerInWrap">
		<div id="logo"><a href="/"><img src="/img/common/logo.png" alt="logo" /></a></div>
		<div id="menu1">
		<nav>
		<c:forEach var="menu" items="${ menuList }">
			<li><a href="${ menu.menu_uri }">${ menu.menu_name }</a>
				<ul>
					<c:forEach var="submenu" items="${ submenuList }">
					<c:choose>
					<c:when	test="${submenu.menu_id eq menu.menu_id}">
						<li><a href="${ submenu.submenu_uri }">${ submenu.submenu_name}</a></li>
					</c:when>
					</c:choose>
					</c:forEach>	
				</ul>
			</li>
		</c:forEach>
		</nav>
		</div>
		
		<c:choose>
			<c:when test="${ sessionScope.login ne null }">
				<div id="mypageWrap">
					<div><a href="/mypage/myList?nowpage=1&menu_id=mypage">${login.nickname}  님의 마이페이지</a></div>
					<div><a href="/User/Logout">로그아웃</a></div>
				</div>
			</c:when>
			<c:when test="${ sessionScope.managerlogin ne null }">
				<div id="mypageWrap">
					<div><a href="/mypage/myList?nowpage=1&menu_id=mypage">${login.manager_name}  님의 마이페이지</a></div>
					<div><a href="/User/Logout">로그아웃</a></div>
				</div>
			</c:when>
			<c:otherwise>
				<div><a href="/User/Login" class="right">로그인</a></div>
			</c:otherwise>
		</c:choose>
	</div>
</header>

<%-- 	   <nav>
	      <c:if test="${ vo.usercode ne null }">
	         <div><a href="/">로그아웃</a></div>
	         <div><a href="">마이페이지</a></div>
	      </c:if>
	      
	      <c:if test="${ vo.usercode eq null }">
	      </c:if>
	       <div style="display: inline-block;"><a href="/myPageCheck">마이페이지</a></div> 
	      <div style="display: inline-block;"><a href="/logout">로그아웃</a></div>
	   
	   </nav>  --%>








 
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

</table> --%>






    