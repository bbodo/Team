<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 메뉴목록 -->

<header>
   <div id="headerInWrap">
	   <div id="logo"><a href="/">logo</a></div>
	<%-- 	<ul>
	      <c:forEach var="item" items=${}>
	         <li><a href="#">${}</a>
	            <ul>
	               <li><a href="">포이즌</a></li>
	               <li><a href="">이파리</a></li>
	               <li><a href="">플라워</a></li>
	               <li><a href="">우드</a></li>
	               <li><a href="">열매</a></li>
	               <li><a href="">허브</a></li>
	               <li><a href="">사막</a></li>
	               <li><a href="">습지</a></li>
	               <li><a href="">채소</a></li>
	               <li><a href="">불법단체</a></li>
	            </ul>
	         </li>
	      </c:forEach>
	   </ul> --%>
	    
	   <ul id="menu">
	      <li><a href="/board">식물연합</a>
	         <ul>
	            <li><a href="">포이즌</a></li>
	            <li><a href="">이파리</a></li>
	            <li><a href="">플라워</a></li>
	            <li><a href="">우드</a></li>
	            <li><a href="">열매</a></li>
	            <li><a href="">허브</a></li>
	            <li><a href="">사막</a></li>
	            <li><a href="">습지</a></li>
	            <li><a href="">채소</a></li>
	            <li><a href="">불법단체</a></li>
	         </ul>
	      </li>
	      
	      <li><a href="#">커뮤니티</a>
	         <ul>
	            <li><a href="">꿀팁</a></li>
	            <li><a href="">QA</a></li>
	            <li><a href="">자유</a></li>
	            <li><a href="">초록별</a></li>
	         </ul>
	      </li>
	      
	      <li><a href="#">그린마켓</a>
	         <ul>
	            <li><a href="">입양</a></li>
	            <li><a href="">분양</a></li>
	            <li><a href="">소모품</a></li>
	         </ul>
	      </li>
	      
	      <li><a href="/eventList">이벤트</a>
	         <ul>
	            <li><a href="">이벤트</a></li>
	         </ul>
	      </li>
	      
	      <li><a href="#">그린위키</a>
	         <ul>
	            <li><a href="/static/html/green.html">그린위키</a></li>
	         </ul>
	      </li>
	   </ul>
	   
	   <nav>
	      <%-- <c:if test="${  != null }">
	         <div><a href="/">로그아웃</a></div>
	         <div><a href="">마이페이지</a></div>
	      </c:if>
	      
	      <c:if test="${  == null }">
	      </c:if> --%>
	      <div><a href="login">로그인</a></div>
	   </nav>
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








    