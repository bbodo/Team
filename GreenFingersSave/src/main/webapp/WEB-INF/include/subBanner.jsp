<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

	<c:forEach var="menu" items="${ menuList }">
	<c:choose>
		<c:when test="${menu.menu_id eq 'MENU01'}">
			<p>${ menu.menu_name }</p>
			<img src ="/img/common/subbanner1.png" alt="subbanner"/>
		</c:when>
		
		<c:when test="${menu.menu_id eq 'MENU02'}">
			<p>${ menu.menu_name }</p>
			<img src ="" alt="subbanner"/>
		</c:when>
		
		<c:when test="${menu.menu_id eq 'MENU03'}">
			<p>${ menu.menu_name }</p>
			<img src ="" alt="subbanner"/>
		</c:when>
		
		<c:when test="${menu.menu_id eq 'MENU04'}">
			<p>${ menu.menu_name }</p>
			<img src ="" alt="subbanner"/>
		</c:when>
		
		<c:when test="${menu.menu_id eq 'MENU05'}">
			<p>${ menu.menu_name }</p>
			<img src ="" alt="subbanner"/>
		</c:when>
	</c:choose>
	</c:forEach>