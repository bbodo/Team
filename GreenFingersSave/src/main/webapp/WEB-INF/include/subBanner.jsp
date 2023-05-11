<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String menuId = request.getParameter("menu_id");
%>
	
<div class="subBanner">
	<c:forEach var="menu" items="${ menuList }">
	<c:choose>
		<c:when test="${param.menu_id eq 'MENU01'}">
			<c:if test="${menu.menu_id eq 'MENU01'}">
				<img src ="/img/common/subbanner.png" alt="subbanner"/>
				<p>${ menu.menu_name }</p>
			</c:if>
		</c:when>
		
		<c:when test="${param.menu_id eq 'MENU02'}">
			<c:if test="${menu.menu_id eq 'MENU02'}">
				<img src ="/img/common/subbanner.png" alt="subbanner"/>
				<p>${ menu.menu_name }</p>
			</c:if>
		</c:when>
		
		<c:when test="${param.menu_id eq 'MENU03'}">
			<c:if test="${menu.menu_id eq 'MENU03'}">
				<p>${ menu.menu_name }</p>
				<img src ="/img/common/subbanner.png" alt="subbanner"/>
			</c:if>
		</c:when>
		
		<c:when test="${param.submenu_id eq 'SUBMENU18'}">
			<c:if test="${menu.menu_id eq 'MENU04'}">
				<p>${ menu.menu_name }</p>
				<img src ="/img/common/subbanner.png" alt="subbanner"/>
			</c:if>
		</c:when>
		
		<c:when test="${param.submenu_id eq 'SUBMENU20'}">
			<c:if test="${menu.menu_id eq 'MENU05'}">
				<p>${ menu.menu_name }</p>
				<img src ="/img/common/subbanner.png" alt="subbanner"/>
			</c:if>
		</c:when>
	</c:choose>
	</c:forEach>
</div>