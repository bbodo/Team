<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 등록</title>
<link rel="shortcut icon" href="/img/favicon.ico">
<link rel="stylesheet" href="/css/common.css" />

<style>
   th      { width : 20%; padding: 5px 0px;}  
   td      { width : 80%; padding : 50;  }  
   input[type=text] ,  input[type=password], input[type=email]    { width:100%; } 
   table {margin  : auto; }  
   h2 {text-align : center}

#title {
	width: 100%;
	text-align: center;
	height: 200px;
	background-color: white;
}
#main {
	width: 100%;
	padding-right: 0px;
}
   
  #id {
  height:50px;
  font-size:20px;
}
  #pwd1 {
  height:50px;
  font-size:20px;
}
  #pwd2 {
  height:50px;
  font-size:20px;
}
  #username {
  height:50px;
  font-size:20px;
}
  #birh {
  height:50px;
  font-size:20px;
}
  #email {
  height:50px; 
  font-size:20px;
}

  #add {
  height:50px;
  font-size:20px;
}
  #nickname {
  height:50px;
  font-size:20px;
}
.ps_box {
    display: block;
    position: relative;
    width: 100%;
    height: 51px;
    border: solid 1px #dadada;
    padding: 10px 110px 10px 14px;
    background: #fff;
    box-sizing: border-box;
    vertical-align: top;
}

.left {
	text-align: left;
}

.green  { color: green; }
.red    { color: red; }
span    { padding: 10px; }
   
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

	/* Id 중복 체크  */
	function idCheck() {
		const idCheckEl = document.getElementById('idCheck');
		idCheckEl.addEventListener('click', function() {
			event.preventDefault();
			event.stopPropagation();
			let userid = $("#id").val();
			if(userid != '') {
				$.ajax({
					type     : 'POST',
					url      : '/User/IdCheck',
					data     : 'userid='+ userid,
					dataType : 'json',
					success  : function(result) {
						if(result == '0') {
							$('#idCheckresult').html("<b class='green' value='green'>사용가능</b>");
						} else {
							$('#idCheckresult').html("<b class='red' value='red'>사용불가</b>");
						}
					},
					error : function(error) { alert('에러'); }
				});
				
			} else {
				alert('아이디를 입력하세요');
			}
		});
		
	}
	/* Email 중복 체크  */
	function emailCheck() {
		const emailCheckEl = document.getElementById('emailCheck');
		emailCheckEl.addEventListener('click', function() {
			event.preventDefault();
			event.stopPropagation();
			let email = $("#email").val();
			if(email != '') {
				$.ajax({
					type     : 'POST',
					url      : '/User/EmailCheck',
					data     : 'email='+ email,
					dataType : 'json',
					success  : function(result) {
						if(result == '0') {
							$('#emailCheckresult').html("<b class='green' value='green'>사용가능</b>");
						} else {
							$('#emailCheckresult').html("<b class='red' value='red'>사용불가</b>");
						}
					},
					error : function(error) { alert('에러'); }
				});
				
			} else {
				alert('이메일을 입력하세요');
			}
		});
		
	}
	/* Nickname 중복 체크  */
	function nicknameCheck() {
		const nicknameCheckEl = document.getElementById('nicknameCheck');
		nicknameCheckEl.addEventListener('click', function() {
			event.preventDefault();
			event.stopPropagation();
			let nickname = $("#nickname").val();
			if(nickname != '') {
				$.ajax({
					type     : 'POST',
					url      : '/User/NicknameCheck',
					data     : 'nickname='+ nickname,
					dataType : 'json',
					success  : function(result) {
						if(result == '0') {
							$('#nicknameCheckresult').html("<b class='green' value='green'>사용가능</b>");
						} else {
							$('#nicknameCheckresult').html("<b class='red' value='red'>사용불가</b>");
						}
					},
					error : function(error) { alert('에러'); }
				});
				
			} else {
				alert('닉네임을 입력하세요');
			}
		});
		
	}


	window.onload = function() {
		const formEl   = document.getElementsByTagName('form')[0];
		let useridEl   = document.querySelector('[name=userid]');
		let passwdEl   = document.querySelector('[name=passwd]');
		let pwd2El     = document.getElementById('pwd2');
		let usernameEl = document.querySelector('[name=username]');
		let addrEl     = document.querySelector('[name=addr]');
		let emailEl    = document.querySelector('[name=email]');
		let nicknameEl = document.querySelector('[name=nickname]');
	
		idCheck();
		emailCheck(); 
		nicknameCheck();
		
		formEl.onsubmit = function(event) {
			const bTagEl = document.getElementsByClassName('green');
			let greencheck    = bTagEl.length;
			if (useridEl.value.trim() == '') {
				event.preventDefault();
				event.stopPropagation();
				alert('아이디를 입력하세요');
				useridEl.focus();
				
			} else {
				if (passwdEl.value.trim() == '') {
					event.preventDefault();
					event.stopPropagation();
					alert('비밀번호를 입력하세요');
					passwdEl.focus();
					
				} else {
					/* 최소 8 자, 하나 이상의 문자, 하나의 숫자 및 하나의 특수 문자 */
					let regex = RegExp(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/);
					if (!regex.test(passwdEl.value.trim())) {
						event.preventDefault();
						event.stopPropagation();
						alert('비밀번호 형식이 틀립니당');
						passwdEl.value = '';
						passwdEl.focus();
						
					} else {
						if (pwd2El.value.trim() == '') {
							event.preventDefault();
							event.stopPropagation();
							alert('비밀번호 확인을 입력하세요');
							pwd2El.focus();
							
						} else {
							if (passwdEl.value != pwd2El.value) {
								event.preventDefault();
								event.stopPropagation();
								alert('비밀번호가 일치하지 않습니다');
								pwd2El.value = '';
								pwd2El.focus();
								
							} else {
								if (usernameEl.value.trim() == '') {
									event.preventDefault();
									event.stopPropagation();
									alert('이름을 입력하세요');
									usernameEl.focus();
									
								} else {
									if (addrEl.value.trim() == '') {
										event.preventDefault();
										event.stopPropagation();
										alert('주소를 입력하세요');
										addrEl.focus();
										
									} else {
										if (emailEl.value.trim() == '') {
											event.preventDefault();
											event.stopPropagation();
											alert('이메일을 입력하세요');
											emailEl.focus();
											
										} else {
											if (nicknameEl.value.trim() == '') {
												event.preventDefault();
												event.stopPropagation();
												alert('닉네임을 입력하세요');
												nicknameEl.focus();
												
											} else {
												if(greencheck != '3') {
													event.preventDefault();
													event.stopPropagation();
													alert('중복체크를 확인하세요');
												}
											}
										}
									}
								}
							}
						}
					}
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
  	<div id="write">
  	<h2>회원 가입</h2>
  <form action="/User/Write" method="POST" >
  <input type="hidden" name="uri" value="${map.uri}">
  <table>
   <tr>
     <th class="left">아이디</th>
   </tr>
   <tr> 
     <td><input class="ps_box" type="text" name="userid"  id="id" value=""/>
         <input type="button" value="중복체크" id="idCheck" />
         <span id="idCheckresult"></span>
     </td>
   </tr>
   <tr>
     <td class="left"><span style="font-weight: bold; text-align: left; padding: 0px;">비밀번호</span><span style="font-size: 12px;">(최소문자1개,숫자1개,특수문자1개 포함. 최소8자이상)</span></td>
   </tr>
   <tr> 
     <td><input class="ps_box" type="password" name="passwd" id="pwd1" /></td>
   </tr>
   <tr>
     <th class="left">비밀번호 확인</th>
   </tr>
   <tr> 
     <td><input class="ps_box" type="password" id="pwd2" /></td>
   </tr>
   <tr>
     <th class="left">이름</th>
   </tr>
   <tr> 
     <td><input class="ps_box" type="text" name="username" id="username"/></td>
   </tr>
   <tr>
     <th class="left">생년월일</th>
   </tr>
   <tr> 
     <td><input class="ps_box" type="date" name="birthday" id="birth"/> </td>
   </tr>
   <tr>
     <th class="left">성별</th>
   </tr>
   <tr> 
     <td><input type="radio" name="gender" value="남"/>남
         <input type="radio" name="gender" value="여"/>여
         <input type="radio" name="gender" value="선택안함"/>선택안함</td>
   </tr>
   <tr>
     <th class="left">주소</th>
   </tr>
   <tr>
     <td><input class="ps_box" type="text" name="addr" id="add"/></td>
   </tr>
   <tr> 
     <th class="left">이메일</th>
   </tr>
   <tr>
     <td><input class="ps_box" type="email" name="email" id ="email"/>
         <input type="button" value="중복체크" id="emailCheck" />
         <span id="emailCheckresult"></span>
     </td>
   </tr>
   <tr>
     <th class="left">닉네임</th>
   </tr>
   <tr>  
     <td><input class="ps_box" type="text" name="nickname" id="nickname"/>
         <input type="button" value="중복체크" id="nicknameCheck" />
         <span id="nicknameCheckresult"></span>
     </td>
   </tr>
   <tr>     
     <td colspan="2" style="text-align:center; padding: 10px;">
     <input type="submit" style="width:60pt; height:30pt;" value="가입" />
     </td>
   </tr> 
  </table>
  </form>
  </div>
  </div>
  </div>
</body>
</html>








