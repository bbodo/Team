<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디 / 비밀번호 찾기</title>
<link rel="shortcut icon" href="/img/favicon.ico">
<link rel="stylesheet" href="/css/common.css" />

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
	#main {
		width: 100%;
		height: 900px;
		background-color: white;
		text-align: center;
		display: inline-block;
	}
	.cont {
		background-color: #fff;
		margin: 0 auto;
		width: 100%;
		border-collapse: collapse;
	}
</style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">

	/* 아이디 찾기 함수 */
	function findId() {
		
		const findIdEl = document.getElementById("findId");
		
		let findId = new FormData(findIdEl);
		
		let optionId = {
				method : "POST",
				body : findId
		};
		
		fetch("/User/findId", optionId)
			.then( res => res.text() )
			.then( data => {
				alert("당신의 아이디는 [" + data + "] 입니다.")
			})
			.catch( err => {
				console.log(err);
				alert("오류발생 : " + err);
			});
	}
	
	/* 비밀번호 찾기 함수 */
	function findPw() {
		
		const findPwEl = document.getElementById("findPw");
		
		let findPw = new FormData(findPwEl);
		
		let optionPw = {
				method : "POST",
				body : findPw
		};
		
		fetch("/User/findPw", optionPw)
			.then( res => res.text() )
			.then( data => {
				alert("당신의 비밀번호는 [" + data + "] 입니다.")
			})
			.catch( err => {
				console.log(err);
				alert("오류발생 : " + err);
			});
		}
		

</script>

</head>
<body>
	<div id="wrapper">
	<!-- 타이틀 -->
	<div id="title">
		<p>아이디 / 비밀번호 찾기</p>
	</div>
	<div id="main">
	<!-- 아이디 찾기 -->
	<div>
		<p>아이디 찾기</p>
		<form id="findId">
		<table class="cont">
			<tr>
				<td>이름</td>
			</tr>
			<tr>
				<td><input type="text" name="username"/></td>			
			</tr>
			<tr>
				<td>이메일</td>
			</tr>
			<tr>
				<td><input type="email" name="email" /></td>
			</tr>		
		</table>
		<input type="button" value="아이디 찾기" id="idBtn" onclick=findId() />
		</form>	
	</div>
	<!-- 비밀번호 찾기 -->
	<div>
		<p>비밀번호 찾기</p>
		<form id="findPw">
		<table class="cont">
			<tr>
				<td>아이디</td>
			</tr>
			<tr>
				<td><input type="text" name="userid" /></td>
			</tr>
			<tr>
				<td>이메일</td>
			</tr>
			<tr>
				<td><input type="email" name="email"/></td>
			</tr>
		</table>
		<input type="button" value="비밀번호 찾기" onclick=findPw() />
		</form>	
	</div>
	</div>
	</div>
	<%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>








