<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
h2 {text-align : center}
div{text-align : center}

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
	<div id= "main">
	<h2> 로그인 </h2>
		<form action = "/loginprocess" method="POST">
			<div>
				아이디    <input type="text" name="userid" id="id" value="admin"/>
			</div>
			<div>
				암호     <input type="password" name="passwd" id="pwd" value="1234"/>
			</div>
			<div>
				<input type="submit" value="로그인"/>
			</div>
			</form>
		<form action = "/userwrite" method="POST">	
				<input type="submit" value="회원가입"/>
			
		</form>
	</div>
</body>
</html>













