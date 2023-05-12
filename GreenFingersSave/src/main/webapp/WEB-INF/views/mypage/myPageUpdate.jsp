<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<title>게시판 양식</title>

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
		min-height: 800px;
		float: left;
		padding: 10px;
		background-color: gray;
		text-align: center;
		height: auto;
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

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

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
	
	function loadchk() {
		$('input:radio[name="gender"]:input[value="${login.gender}"]').prop('checked',true);
	}

	window.onload = function() {
		const formEl   = document.getElementsByTagName('form')[0];
		let useridEl   = document.querySelector('[name=userid]');
		let passwdEl   = document.querySelector('[name=passwd]');
		let pwd2El     = document.getElementById('pwd2');
		let addrEl     = document.querySelector('[name=addr]');
		let emailEl    = document.querySelector('[name=email]');
		let nicknameEl = document.querySelector('[name=nickname]');
		
		loadchk();
		emailCheck(); 
		nicknameCheck();
		
		formEl.onsubmit = function(event) {
			const bTagEl = document.getElementsByClassName('red');
				let redcheck = bTagEl.length;
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
												if(redcheck != '0') {
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
</script>
</head>
<body>
	 <%@include file="/WEB-INF/include/header.jsp" %>
     <div id="title">
     	<p>마이 페이지</p>
     </div>
     <div id="aside">
     	내정보<br />
     	작성글<br />
     	쪽지<br />
     </div>
     <div id="main">
     	<form action="/mypage/updateUser" method="POST">
     	<input type="hidden" value="${ login.userid }" name="userid"/>
     	<input type="hidden" value="${ login.usercode }" name="usercode" id="usercode"/>
     	<input type="hidden" value="${ login.birthday }" name="usercode" id="birthday"/>
		<table id="cont">
			<tr>
				<!-- id는 수정불가하게 -->
				<td class="left"><h2>아이디</h2></td>
			</tr>
			<tr>
				<td class="left" style="padding-left: 35px;">${ login.userid }</td>
			</tr>
			<tr>
				<!-- 자물쇠 버튼 눌러서 보이게하는 기능 ?? -->
				<td class="left">
					<h2 style="display: inline-block;">비밀번호</h2> 
					<span style="font-size: 12px; font-weight: lighter;">(최소문자1개,숫자1개,특수문자1개 포함. 최소8자이상)</span>
				</td>
			</tr>
			<tr>
				<td class="left" style="padding-left: 35px;">
					<input type="password" value="${ vo.passwd }" name="passwd" id="pwd1"/> 
					<input type="button" value="비밀번호보이게하기"/>
				</td>
			</tr>
			<tr>
				<!-- 자물쇠 버튼 눌러서 보이게하는 기능 ?? -->
				<td class="left"><h2>비밀번호 확인</h2></td>
			</tr>
			<tr>
				<td class="left" style="padding-left: 35px;">
					<input type="password" id="pwd2" />
				</td>
			</tr>
			<tr>
				<td class="left"><h2>닉네임</h2></td>
			</tr>
			<tr>
				<td class="left" style="padding-left: 35px;">
				<input type="text" value="${ login.nickname }" id="nickname" name="nickname"/> 
				<input type="button" value="중복체크" id="nicknameCheck"/>
				<span id="nicknameCheckresult"></span>
				</td>
			</tr>
			<tr>
				<td class="left"><h2>이름</h2></td>
			</tr>
			<tr>
				<td class="left" style="padding-left: 35px;">${ login.username }</td>
			</tr>
			<tr>
				<td class="left"><h2>생년월일</h2></td>
			</tr>
			<tr>
				<td class="left" style="padding-left: 35px;">
					${ login.birthday }
				</td>
			</tr>
			<tr>
				<td class="left"><h2>성별</h2></td>
			</tr>
			<tr>
				<td class="left" style="padding-left: 35px;">
				    <input type="radio" name="gender" value="남"/>남
        			<input type="radio" name="gender" value="여"/>여</td>
			</tr>
			<tr>
				<td class="left"><h2>이메일</h2></td>
			</tr>
			<tr>
				<td class="left" style="padding-left: 35px;">
					<input type="text" value="${ login.email }" name="email" id="email"/>
					<input type="button" value="중복체크" id="emailCheck" />
					<span id="emailCheckresult"></span>
				</td>
			</tr>
			<tr>
				<td class="left"><h2>주소</h2></td>
			</tr>
			<tr>
				<td class="left" style="padding-left: 35px;">
					<input type="text" value="${ login.addr }" name="addr"/>
				</td>
			</tr>
		</table>
	    <div style="float: right;">
	    	<input type="submit" value="수정 하기"/> &nbsp; &nbsp;
	    	<input type="button" value="탈퇴 시키기" onclick=memberDelete() />
	    </div>
		</form>
     </div>
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>