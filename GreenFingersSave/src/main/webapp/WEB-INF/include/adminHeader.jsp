<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 메뉴목록 -->


<header>
   <div id="headerInWrap">
	   <div id="logo"><a href="/Manager/Home"><img src="/img/common/logo.png" alt="logo" /></a></div>
		
		<div class="tag">
			<a href="/Manager/Member?menu_id=Member">회원 관리</a>
			<a href="/Manager/Menu?menu_id=Menu">메뉴 관리</a>
			<a href="/Manager/EventList?menu_id=Event&nowpage=1">이벤트 관리</a>
			<a href="/Manager/WinnerList?menu_id=Winner&nowpage=1">당첨자 관리</a>
			<a href="/Manager/SeminarList?menu_id=Festival&submenu_id=SUBMENU21&nowpage=1">행사 관리</a>
			<a href="/Manager/Store?menu_id=Store">상품 등록</a>
		</div>
		
		<div>
			<a href="/User/Logout">관리자 로그아웃</a>
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








    