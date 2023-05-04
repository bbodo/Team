<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인 창</title>
<link rel="shortcut icon" href="/img/favicon.ico">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/common.css" />
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
<script>
	window.onload = function() {
		const formEl = document.getElementsByTagName('form')[0];
		//alert(formEl);
		formEl.onsubmit = function(e) {
			let userid = document.querySelector('[name=userid]');
			let passwd = document.querySelector('[name=passwd]');
			if(userid.value.trim() == '') {
				event.preventDefault();
				event.stopPropagation();
				alert('아이디를 입력하세요');
			} else if(passwd.value.trim() == '') {
				event.preventDefault();
				event.stopPropagation();
				alert('암호를 입력하세요');
			} 
			
		}
	} 

</script>
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
			<c:if test="${message eq 'fail' }">
			<tr>
			 <td colspan="2" style="color:red;">
			아이디 또는 암호가 일치하지 않습니다
			
			<td>
			</tr>
			</c:if>
			</table>
			</form>
			<a href="/User/WriteForm">회원가입</a>
	</div>
</body>
	
</html>













