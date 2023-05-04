 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<title>그린마켓 </title>

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
	#aside a {
	    text-decoration : none;
	    color: #fff;
	}
	#main {
		width: 80%;
		height: 800px;
		float: left;
		padding: 10px;
		background-color: gray;
	}
	#cont {
		background-color: #fff;
		margin: 0 auto;
		width: 80%;
	}
	#cont th {
		background-color: #666;
	}
	.right {
		text-align: right;
	}
	h2 {
	    font-weight: 30px;
		text-align: center;
		padding: 30px;
		font-weight: bold;
	}
	input[type=text] {
		width: 100%;
	}
	textarea {
		width: 100%;
		height: 400px;
	}
	.btn {
		margin-top : 30px;
		text-align: center;
	}

</style>

</head>
<body>
	 <%@include file="/WEB-INF/include/header.jsp" %>
     <div id="title">
     	<p>그린 마켓</p>  
     </div>
     <div id="aside">
     	<a href="">입양원해요</a><br />
     	<a href="">나눔합니다</a><br />
     	<a href="">포인트 스토어</a><br />
     </div>
     <div id="main">
		<table id="cont">
			<h2>그린마켓 등록</h2>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title"/></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer"/></td>
			</tr>
			<tr>
				<th>글 내용</th>
				<td><textarea name="content"></textarea></td>
			</tr>
			<tr>
				<th>파일 첨부</th>
				<td><input type="file" name="file" /></td>
			</tr>
		</table>
		<div class="btn">
		<input type="button" value="등록" />
		</div>
     </div>
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>