<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<title>쪽지 쓰기</title>

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
		width: 100%;
	}
	#cont th {
		background-color: #666;
	}
	.right {
		text-align: right;
	}
	.left {
		text-align: left;
	}
	textarea {
		width: 100%;
		height: 500px;
	}
	input[type=text] {
		width: 100%;
	}

</style>

</head>
<body>
	 <%@include file="/WEB-INF/include/header.jsp" %>
     <div id="title">
     	<p>쪽지 쓰기</p>
     </div>
     <div id="aside">
     	내정보<br />
     	작성글<br />
     	쪽지<br />
     </div>
     <div id="main">
		<table id="cont">
			<tr>
				<th>받는 사람</th>
				<td><input type="text" placeholder="유저ID를 입력하세용" /></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea></textarea></td>
			</tr>
		</table>
	    <%@include file="/WEB-INF/include/paging.jsp" %>
	    <div style="float: left;">
			취소 버튼
	    </div>
	    <div style="float: right;">
	    	전송 보내기 버튼
	    </div>
	    </div>
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>