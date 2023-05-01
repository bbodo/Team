<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id= "main">
		<form action = "/loginprocess" method="POST">
			<div>
				아이디<input type="text" name="userid" value="admin"/>
			</div>
			<div>
				암호<input type="password" name="passwd" value="1234"/>
			</div>
			<div>
				<input type="submit" value="로그인"/>
			</div>
		</form>
	</div>
</body>
</html>













