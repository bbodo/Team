<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<title>홈</title>
</head>
<body>
<div id="wrap">
	
	<aside>
		
	</aside>
	
	<%@include file="/WEB-INF/include/header.jsp" %>
	<h2>Home</h2>
	<a href="/board">board 가는길</a> <br />
	<a href="/write">write 가는길</a> <br />
	<a href="/view">view 가는길</a> <br />
	<a href="/update">update 가는길</a> <br />
	<a href="/eventList">이벤트 리스트 가는길</a> <br />
	<a href="/market">market 가는길</a> <br />
	<a href="">길 찾아가세요</a>
	<h2>Home</h2>
	<%@include file="/WEB-INF/include/footer.jsp" %>
</div>
</body>
</html>