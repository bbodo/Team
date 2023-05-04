<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 창</title>

<style>


h2 {text-align : center}
div{text-align : center}
 table {margin  : auto; }  

#title {
		width: 100%;
		text-align: center;
		height: 100px;
		background-color: orange;
	}
#title p {
		 line-height: 100px;
	}
#id {
  width:300px;
  height:50px;
  font-size:20px;
}

#pwd {
  width:300px;
  height:50px;
  font-size:20px;
}

</style>
</head>
<body>
     <div id="title">
     	<p> 반려식물 로그인 </p>
     </div>
	<div id= "main">	
	<h2> 로그인 </h2>
		<form action = "/User/LoginProcess" method="POST">
		<table>
			<tr>
			<th>아이디</th>
			<td><input type="text" name="userid" id="id" value="sky"/></td>
			</tr>
			<tr>
			<th>암호</th>
			<td><input type="password" name="passwd" id="pwd" value="1234"/></td>
			</tr>
			<tr>
			 <td colspan="2">
			<input type="submit" value="로그인"/>
			<td>
			</tr>
			</table>
			</form>
			<a href="/User/WriteForm">회원가입</a>
	</div>
</body>
</html>













