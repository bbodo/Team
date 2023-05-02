<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<title>게시판 양식</title>

<style type="text/css">

	* {
		box-sizing: border-box;
	}

	#title {
		width: 100%;
		text-align: center;
		height: 100px;
		background-color: orange;
	}
	#title p {
		 line-height: 100px;
	}
	#aside {
		float: left;
		height: 800px;
		background-color: navy;
		width: 20%;
		padding: 10px;
	}
	#main {
		width: 80%;
		height: 800px;
		float: left;
		padding: 10px;
		background-color: gray;
		text-align: center;
	}
	#cont {
		background-color: #fff;
		margin: 0 auto;
		width: 90%;
	}
	#cont th {
		background-color: #666;
	}
	.right {
		text-align: right;
	}

</style>

</head>
<body>
	 <%@include file="/WEB-INF/include/header.jsp" %>
     <div id="title">
     	<div>식물 연합</div>
     </div>
     <div id="aside">
     	포이즌<br />
     	포이즌<br />
     	포이즌<br />
     	포이즌<br />
     	포이즌<br />
     	포이즌<br />
     </div>
     <div id="main">
		<table id="cont">
			<caption><h2>게시판 제목</h2></caption>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>작성자</th>
				<th>조회수</th>
			</tr>
			<tr>
				<td>1</td>
				<td><a href="/view">ㅋㅋㅋ 독초 키워서 다 죽일꺼임</a></td>
				<td>2023-05-01</td>
				<td>독초애호가</td>
				<td>123</td>
			</tr>
		</table>
		<div class="right">
			<a href="/write">새글 작성</a>
		</div>
	    <%@include file="/WEB-INF/include/paging.jsp" %>
     </div>
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>