<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디 / 비밀번호 찾기</title>
<link rel="shortcut icon" href="/img/favicon.ico">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/common.css" />

<style type="text/css">

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
#email {
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
#findid11 {
	border: 1px solid #C0C0C0;
	width: 40%;
	margin: auto;
	border-radius: 5px;
	margin-bottom: 50px;
}
#findpw {
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
		<a href="/"><img src="/img/common/logo.png" alt="logo" style="display: block; margin: auto;"/></a>
		<h2>찾고자하는 아이디 / 비밀번호를 입력해주세요</h2>
     </div>
	<div id="main">
	<!-- 아이디 찾기 -->
	<div id="findid11">
		<h2 style="margin: 20px;"> 아이디 찾기 </h2>
		<form id="findId">
		<table>
			<tr>
				<td>
					<div class="findid_wrap">
						<div class="input_row">
							<input type="email" name="email" id="email" placeholder="이메일" style="border: none;"/>
						</div>
					</div>
				</td>
			</tr>		
		</table>
			<input class="btn btn-success" type="button" value="아이디 찾기" id="idBtn" onclick=findId() style="margin: 20px 0px; width: 335px; height: 55px;" />
		</form>	
	</div>
	<!-- 비밀번호 찾기 -->
	<div id="findpw">
		<h2 style="margin: 20px;"> 비밀번호 찾기 </h2>
		<form id="findPw">
		<table>
			<tr>
				<td>
					<div class="id_pw_wrap">
						<div class="input_row">
							<input type="text" name="userid" id="id" placeholder="아이디" style="border: none;"/>
						</div>
						<div class="input_row">
							<input type="email" name="email" id="pwd" placeholder="이메일" style="border: none;"/>
						</div>
					</div>
				</td>
			</tr>
		</table>
		<input class="btn btn-success" type="button" value="비밀번호 찾기" onclick=findPw() style="margin: 20px 0px; width: 335px; height: 55px;" />
		</form>	
	</div>
	</div>
	</div>
	<%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>








