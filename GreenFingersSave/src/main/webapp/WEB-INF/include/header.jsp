<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
 <style type="text/css">

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
	</style>


<!-- 메뉴목록 -->
Board/List?submenu_id=SUBMENU01&nowpage=1
<header>
   <div id="headerInWrap">
	   <div id="logo"><a href="/">logo</a></div>
	   <div id="menu1">
	 	<ul>
	      <c:forEach var="menu" items="${ menuList }">
	          <li><a href="/Board?menu_id=${menu.menu_id}">${ menu.menu_name }</a>
	              <ul>
	              <c:forEach var="submenu" items="${ submenuList }">
	              <c:if test="${submenu.menu_id eq menu.menu_id }">
	               	<li><a href="/Board/List?submenu_id=${submenu.submenu_id}&nowpage=1">${submenu.submenu_name}</a></li>
	               </c:if>
	               </c:forEach>
	               </ul> 
	          </li>
	      </c:forEach>
	      <li><a href="login" class="right">로그인</a></li>
	   </ul> 
	   </div>
   </div> 
</header>
	   
	   
	   
<!-- 	    
  <ul id="menu">
	      <li><a href="/board">식물연합</a>
	         <ul>
	            <li><a href="/board">포이즌</a></li>
	            <li><a href="/board">이파리</a></li>
	            <li><a href="/board">플라워</a></li>
	            <li><a href="/board">우드</a></li>
	            <li><a href="/board">열매</a></li>
	            <li><a href="/board">허브</a></li>
	            <li><a href="/board">사막</a></li>
	            <li><a href="/board">습지</a></li>
	            <li><a href="/board">채소</a></li>
	            <li><a href="/board">불법단체</a></li>
	         </ul>
	      </li>
	      
	      <li><a href="#">커뮤니티</a>
	         <ul>
	            <li><a href="">꿀팁</a></li>
	            <li><a href="qalist">Q&A</a></li>
	            <li><a href="">자유</a></li>
	            <li><a href="">초록별</a></li>
	         </ul>
	      </li>
	      
	      <li><a href="#">그린마켓</a>
	         <ul>
	            <li><a href="/market">입양</a></li>
	            <li><a href="/market">분양</a></li>
	            <li><a href="/market">소모품</a></li>
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
	   </ul> -->
	   
<%-- 	   <nav>
	      <c:if test="${  != null }">
	         <div><a href="/">로그아웃</a></div>
	         <div><a href="">마이페이지</a></div>
	      </c:if>
	      
	      <c:if test="${  == null }">
	      </c:if>
	      <div><a href="login">로그인</a></div>
	   </nav> --%>





 
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






    