<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String menuId = request.getParameter("menu_id");
%>
	
<div class="adminsubBanner">
	<c:choose>
		<c:when test="${param.menu_id eq 'Member'}">
				<img src ="/img/common/adminsb.png" alt="subbanner"/>
				<p>회원 관리</p>
		</c:when>
		<c:when test="${param.menu_id eq 'Menu'}">
				<img src ="/img/common/adminsb.png" alt="subbanner"/>
				<p>상위 메뉴 관리</p>
		</c:when>
		<c:when test="${param.menu_id eq 'subMenu'}">
				<img src ="/img/common/adminsb.png" alt="subbanner"/>
				<p>하위 메뉴 관리</p>
		</c:when>
		<c:when test="${param.menu_id eq 'Event'}">
				<img src ="/img/common/adminsb.png" alt="subbanner"/>
				<p>이벤트 관리</p>
		</c:when>
		<c:when test="${param.menu_id eq 'Winner'}">
				<img src ="/img/common/adminsb.png" alt="subbanner"/>
				<p>당첨자 관리</p>
		</c:when>
		<c:when test="${param.menu_id eq 'Store'}">
				<img src ="/img/common/adminsb.png" alt="subbanner"/>
				<p>스토어 관리</p>
		</c:when>
		<c:when test="${param.menu_id eq 'Festival'}">
				<img src ="/img/common/adminsb.png" alt="subbanner"/>
				<p>행사 관리</p>
		</c:when>
		
	</c:choose>
</div>