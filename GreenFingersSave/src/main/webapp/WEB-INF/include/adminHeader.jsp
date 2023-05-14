<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 메뉴목록 -->

<header>
   <div id="headerInWrap">
	   <div id="logo"><a href="/Manager/Home">logo</a></div>
		
		<div>
			<a href="/Manager/Member">회원관리</a>
			<a href="/Manager/Menu">메뉴관리</a>
			<a href="/Manager/EventList?submenu_id=${submenu.submenu_id}&nowpage=1">이벤트관리</a>
			<a href="/Manager/WinnerList?submenu_id=${submenu.submenu_id}&nowpage=1">당첨자관리</a>
			<a href="/Manager/SeminarSmarteditor?nowpage=1">세미나관리</a>
			<a href="/Manager/Store">상품등록</a>
		</div>
		
		<div>
			<a href="">마이페이지</a>
			<a href="/User/Logout">로그아웃</a>
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








    