<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="menu" items="${ menuList }">
	 <li><a href="">${ menu.menu_name }</a></li>
</c:forEach>