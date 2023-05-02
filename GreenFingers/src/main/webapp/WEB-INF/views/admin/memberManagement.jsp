<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<title>회원관리</title>

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
	 <%@include file="/WEB-INF/include/adminHeader.jsp" %>
     <div id="title">
     	<p>회원관리</p>
     </div>
       <div id="aside">
     	회원 관리<br />
     	메뉴 관리<br />
     	- 하위메뉴 관리<br />
     	이벤트 관리<br />
     	제품 등록<br />
     </div>
     <div id="main">
		<table id="cont">
			<tr>
				<th>유저코드</th>
				<th>이름</th>
				<th>아이디</th>
				<th>유저등급</th>
				<th>포인트</th>
			</tr>
			<tr>
				<td>12345</td>
				<td>일이삼</td>
				<td><a href="/adminMemberUpdate">asd123</a></td>
				<td>B</td>
				<td>4326</td>
			</tr>
			<tr>
				<td>12345</td>
				<td>일이삼</td>
				<td><a href="/adminMemberUpdate">asd123</a></td>
				<td>B</td>
				<td>4326</td>
			</tr>
			<tr>
				<td>12345</td>
				<td>일이삼</td>
				<td><a href="/adminMemberUpdate">asd123</a></td>
				<td>B</td>
				<td>4326</td>
			</tr>
		</table>
	    <%@include file="/WEB-INF/include/paging.jsp" %>
     </div>
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>