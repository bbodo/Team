<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/adminHeader.jsp" %>
<title>메뉴 관리</title>

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
		width: 85%;
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

</style>

</head>
<body>
     <div id="title">
     	<p>상위 메뉴 관리</p>
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
				<th>메뉴 ID</th>
			</tr>
			<tr>
				<td><input type="text" /></td>
			</tr>
			<tr>
				<th>* 메뉴 이름</th>
			</tr>
			<tr>
				<td><input type="text" required/></td>
			</tr>
			<tr>
				<th>메뉴_SEQ</th>
			</tr>
			<tr>
				<td><input type="text" /></td>
			</tr>
		</table>
		<div style="float: right;">
			<a href="">취소버튼</a>
			<a href="">등록버튼</a>
		</div>
     </div>
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>