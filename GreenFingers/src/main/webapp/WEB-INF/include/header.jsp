<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 메뉴목록 -->

<table  id="header">
 
 <tr>
   
	<td><a href="/">버튼1</a></td>
	<td><a href="/">버튼1</a></td>
	<td><a href="/">버튼1333333333333333333333</a></td>
   <%-- <c:forEach  var="menu"  items="${ menuList }">   
     <td>
       <a href="/Board/List?menu_id=${ menu.menu_id }">${ menu.menu_name }</a> 
     </td>
   </c:forEach> --%>
   <td class="right"><a href="login">로그인</a></td>
 </tr>

</table>









    