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
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous"> -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/common.css" />
<style>


h2 {text-align : center}
div{text-align : center}
table {margin  : auto; }  

#title {
	width: 100%;
	text-align: center;
	height: 200px;
	background-color: white;
}
#id {
	width:300px;
	height:30px;
	font-size:20px;
}

#pwd {
	width:300px;
	height:30px;
	font-size:20px;
}
#main {
	width: 100%;
	padding-right: 0px;
}
#login {f
	border: 1px solid #C0C0C0;
	width: 40%;
	margin: auto;
	border-radius: 5px;
}
a {
	color: #888;
}
a:hover {
	text-decoration: none;
	color: #3CB371;
}
.input_row {
    position: relative;
    display: block;
    height: 100%;
    border: 1px solid #dadada;
    padding: 16px 18px 15px;
    border-radius: 6px;
    box-sizing: border-box;
    text-align: left;
    box-shadow: 0 2px 6px 0 rgba(68,68,68,.08);
}
.id_pw_wrap .input_row:first-child {
    border-radius: 6px 6px 0 0;
    box-shadow: none;
}
.id_pw_wrap .input_row:last-child {
    border-radius: 0 0 6px 6px;
}


</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	/* a 태그 post방식으로 보내기 */
	function gouri(uri) {
		let f=document.createElement('form');
		
		let obj;
		obj = document.createElement('input');
		obj.setAttribute('type', 'hidden');
		obj.setAttribute('name', 'uri');
		obj.setAttribute('value', uri);
		
		f.appendChild(obj);
		f.setAttribute('method', 'POST');
		f.setAttribute('action', '/User/WriteForm');
		document.body.appendChild(f);
		f.submit();
		
	}

	window.onload = function() {
		const formEl = document.getElementsByTagName('form')[0];
		let userid = document.querySelector('[name=userid]');
		let passwd = document.querySelector('[name=passwd]');
		
		//alert(formEl);
		formEl.onsubmit = function(e) {
			if(userid.value.trim() == '') {
				event.preventDefault();
				event.stopPropagation();
				alert('아이디를 입력하세요');
			} else {
				if(passwd.value.trim() == '') {
					event.preventDefault();
					event.stopPropagation();
					alert('암호를 입력하세요');
				
				} 
			} 
		}
	} 

</script>
</head>
<body>
	<div id="wrapper">
     <div id="title">
		<a href="/"><img src="/img/common/logo.png" alt="logo" style="display: block; margin: auto;"/></a>
     </div>
	<div id="main">
	<div id="login">
	<h2 style="margin: 20px;"> 로그인 </h2>
		<form action = "/User/LoginProcess" method="POST">
		<input type="hidden" name="uri" value="${uri}" />
		<table>
			<tr>
				<td>
					<div class="id_pw_wrap">
						<div class="input_row">
							<input type="text" name="userid" id="id" value="sky" placeholder="아이디" style="border: none;"/>
						</div>
						<div class="input_row"
							><input type="password" name="passwd" id="pwd" value="1234" placeholder="비밀번호" style="border: none;"/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
			 <td colspan="2">
				<input class="btn btn-success" type="submit" value="로그인" style="margin: 20px 0px; width: 350px; height: 55px;"/>
			<td>
			</tr>
			</table>
			</form>
			</div>
			<c:choose>
				<c:when test="${noid eq 'noid' }">
					 <td colspan="2" style="color:red;">
						없는 아이디 입니다</td>
				</c:when>		
				<c:when test="${message eq 'fail' }">
					 <td colspan="2" style="color:red;">
						비밀번호가 틀립니다</td>
				</c:when>
			</c:choose>
			<%-- <a href="/User/WriteForm?uri=${uri}">회원가입</a> --%>
			<div style="margin: 15px; color: #888">
				<a href="/User/FindForm">아이디 / 비밀번호 찾기</a> <span style="margin: 10px;">|</span>
				<a href="javascript:gouri('${uri}')">회원가입</a>
			</div>
	</div>
	</div>
</body>
	
</html>













