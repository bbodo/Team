<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<title>회원정보 상세보기</title>

<style type="text/css">

	* {
		box-sizing: border-box;
	} 
	#main {
		width: 85%;
		height: 800px;
		float: left;
		padding: 10px;
		padding-right: 15%;
		background-color: white;
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
    margin-bottom: 15px;
	}
	#ppwd1 {
		position: relative;
	}
	#ppwd2 {
		position: relative;
	}
	.abs {
		position: absolute;
		top: 10px; 
   		right: 0px;
		width: 30px; 
	}
	.green {
		color: green;
		float: left;
		padding: 10px 0px;
	}
	.red {
		color: red;
		float: left;
		padding: 10px 0px;
	}
	.regbtn {
		background-color:#44c767;
		color:#ffffff;
		font-size:15px;
		font-weight:bold;
		margin: 30px 0;
	    width: 100%;
	    height: 60px;
		text-decoration:none;
		border: none;
	}
	.regbtn:hover {
		background-color:#5cbf2a;
	}
	.regbtn:active {
		position:relative;
		top:1px;
	}
	.right {
		text-align: right;
	}
	.as {
		position: relative;
	}
	.as:after {
		content: "";
		position: absolute;
		left: 0;
		bottom: -10px;
		width: 0px;
		height: 2px;
		margin: 5px 0 0;
		transition: all 0.2s ease-in-out;
		transition-duration: 0.3s;
		opacity: 0;
		background-color: #8fd3f4;
	}
	.as:hover:after {
		width: 100%;
 		opacity: 1;
	}
	button {
	    padding: 6px 8px;
	    cursor: pointer;
	    border: none;
	    background-color: white;
	    box-shadow: none;
	}
	button:hover {
		background-color: white;
		color: white;
	}
</style>

<script src="https://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">
	
$(document).on("click","#seepw",function() {
	let pwd1 = $('#pwd1').val();
	let html = '';
	
	if($('#ppwd1 [type=password]').length) {
		$('#ppwd1 [type=password]').remove();
		html = '<input class="ps_box" type="text" name="passwd" onblur="pwd1Check()" id="pwd1" value="'+ pwd1 +'" />';
	} else {
		$('#ppwd1 [type=text]').remove();
		html = '<input class="ps_box" type="password" name="passwd" onblur="pwd1Check()" id="pwd1" value="'+ pwd1 +'"/>';
	}
	
	$('#ppwd1').prepend(html);
})

function memberDelete() {
	let code = $('#usercode').val();
	if(window.confirm("정말 탈퇴처리하시겠습니까?")) {
		$.ajax({
			url : "/Manager/memberDelete",
			data : {usercode : code},
			type : "POST",
			success : function(data) {
				alert("탈퇴되었습니다 !");
				location.replace("/");
			},
			error : function() {
				alert("에러!!")
			}
		});
	};
}

$(document).on("click","#seepw2",function() {
	let pwd = $('#pwd2').val();
	let html = '';
	
	if($('#ppwd2 [type=password]').length) {
		$('#ppwd2 [type=password]').remove();
		html = '<input class="ps_box" type="text" name="passwd" onblur="pwd2Check()" id="pwd2" value="'+ pwd +'" />';
	} else {
		$('#ppwd2 [type=text]').remove();
		html = '<input class="ps_box" type="password" name="passwd" onblur="pwd2Check()" id="pwd2" value="'+ pwd +'"/>';
	}
	
	$('#ppwd2').prepend(html);
})

/* 비밀번호 정규식 체크 */
function pwd1Check() {
	const pwd1El = document.getElementById('pwd1');
	pwd1El.addEventListener('blur', function() {
		let regex = RegExp(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/);
		if (pwd1El.value.trim() != '') {
			if (!regex.test(pwd1El.value.trim())) {
				event.preventDefault();
				event.stopPropagation();
				$('#pwd1Checkresult').html("<b class=red>비밀번호 형식이 틀립니다</b>");
				pwd1El.value = '';
			} else {
				$('#pwd1Checkresult').html("<b class=green>사용할 수 있는 비밀번호입니다.</b>");
			}
		} else {
			$('#pwd1Checkresult').html("<b class=red>비밀번호를 입력하세요</b>");
		}
	});
}

/* 비밀번호 일치 확인 체크 */
function pwd2Check() {
	const pwd1El = document.getElementById('pwd1');
	const pwd2El = document.getElementById('pwd2');
	pwd2El.addEventListener('blur', function() {
		if (pwd2El.value.trim() != '') {
			if (pwd1El.value != pwd2El.value) {
				event.preventDefault();
				event.stopPropagation();
				$('#pwd2Checkresult').html("<b class=red >비밀번호가 일치하지 않습니다</b>");
				/* pwd2El.value = ''; */
				/* pwd2El.focus(); */
			} else {
				$('#pwd2Checkresult').html("<b class=green>일치합니다</b>");
			}
		} else {
			$('#pwd2Checkresult').html("<b class=red>비밀번호확인을 입력하세요</b>");
		}
	});
}

/* Email 정규식 체크 */
function emailRegCheck() {
	const emailEl = document.getElementById('email');
	emailEl.addEventListener('blur', function() {
		let regex = RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
		if (emailEl.value.trim() != '') {
			if (!regex.test(emailEl.value.trim())) {
				event.preventDefault();
				event.stopPropagation();
				$('#emailCheckresult').html("<b style='color:red;'>이메일 형식이 아닙니다</b>");
			} else {
				let email = $("#email").val();
				$.ajax({
					type     : 'POST',
					url      : '/User/EmailCheck',
					data     : 'email='+ email,
					dataType : 'json',
					success  : function(result) {
						if(result == '0') {
							$('#emailCheckresult').html("<b class='green' value='green'>사용가능</b>");
						} else {
							$('#emailCheckresult').html("<b class='red' value='red'>사용중인 이메일입니다</b>");
						}
					},
					error : function(error) { alert('에러'); }
				});
			}
		} else {
			$('#emailCheckresult').html("<b style='color:red;'>이메일을 입력하세요</b>");
		}
	});
}

/* Nickname 중복 체크  */
function nicknameCheck() {
	const nicknameCheckEl = document.getElementById('nickname');
	nicknameCheckEl.addEventListener('blur', function() {
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
	$('#gender').val('${vo.gender}').prop('checked',true);
}

function gohome() {
	location.replace("/Manager/Member?menu_id=Member&nowpage=1");
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
	pwd1Check();
	pwd2Check();
	emailRegCheck(); 
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
	 <%@include file="/WEB-INF/include/adminsubBanner.jsp" %>
	 <div id="wrapper">
      <div id="aside">
       <ul id="sidemenu">
			<li class="sidemenuTitle">SIDEMENU</li>
			<li><a href="/Manager/Member?menu_id=Member">회원 관리</a><br /></li>
       		<li><a href="/Manager/Menu?menu_id=Menu">메뉴 관리</a> <br /></li>
     		<li><a href="/Manager/subMenu?menu_id=subMenu"> - 하위 메뉴</a><br /></li>
     		<li><a href="/Manager/EventList?menu_id=Event&nowpage=1">이벤트 관리</a><br /></li>
     		<li><a href="/Manager/WinnerList?menu_id=Winner&nowpage=1">당첨자관리</a><br /></li>
     		<li><a href="/Manager/SeminarList?menu_id=Festival&submenu_id=SUBMENU21&nowpage=1">행사 관리</a></li>
     		<li><a href="/Manager/Store?menu_id=Store">스토어 관리</a><br /></li>
       </ul>
     </div>
     <div id="main">
     	<form action="/Manager/memberUpdate" method="POST">
     	<input type="hidden" value="${ vo.userid }" name="userid"/>
     	<input type="hidden" value="${ vo.usercode }" name="usercode" id="usercode"/>
     	<input type="hidden" value="Member" name="menu_id" id="menu_id"/>
		<table style="margin: 0 auto; width: 60%;">
			<tr>
				<!-- id는 수정불가하게 -->
				<td class="left" style="padding-bottom: 5px;">
					<h2>아이디</h2>
				</td>
			</tr>
			<tr>
				<td class="left">
					<input class="ps_box" type="text" name="userid" id ="userid" value="${ vo.userid }" readonly/>
				</td>
			</tr>
			<tr>
				<td class="left" style="padding-bottom: 5px;">
					<h2 style="display: inline-block;">비밀번호</h2> 
					<span style="font-size: 12px; font-weight: lighter;">(최소문자1개,숫자1개,특수문자1개 포함. 최소8자이상)</span>
				</td>
			</tr>
			<tr>
				<td class="left" id="ppwd1">
					<input class="ps_box" type="password" name="passwd" id="pwd1" /> 
					<button type="button"><img src="/img/common/lock.png" alt="lock" id="seepw" class="abs" /></button>
					<span id="pwd1Checkresult"></span>
				</td>
			</tr>
			<tr>
				<td class="left" style="padding-bottom: 5px;">
					<h2>비밀번호 확인</h2>
				</td>
			</tr>
			<tr>
				<td class="left" id="ppwd2">
					<input class="ps_box" type="password" id="pwd2" />
					<button type="button"><img src="/img/common/lock.png" alt="lock" id="seepw2" class="abs" /></button>
					<span id="pwd2Checkresult"></span>
					<!-- <input type="button" value="비밀번호보이게하기" id="seepw2"/> -->
				</td>
			</tr>
			<tr>
				<td class="left" style="padding-bottom: 5px;">
					<h2>닉네임</h2>
				</td>
			</tr>
			<tr>
				<td class="left">
				<input class="ps_box" type="text" name="nickname" id="nickname" value="${ vo.nickname }"/> 
				<!-- <input type="button" value="중복체크" id="nicknameCheck"/> -->
				<span id="nicknameCheckresult"></span>
				</td>
			</tr>
			<tr>
				<td class="left" style="padding-bottom: 5px;">
					<h2>이름</h2>
				</td>
			</tr>
			<tr>
				<td class="left">
				<input class="ps_box" type="text" name="username" id="username" value="${ vo.username }" readonly/>
				</td>
			</tr>
			<tr>
				<td class="left" style="padding-bottom: 5px;">
					<h2>생년월일</h2>
				</td>
			</tr>
			<tr>
				<td class="left">
					<input class="ps_box" type="date" name="birthday" id="birth" value="${ vo.birthday }"/>
				</td>
			</tr>
			<tr>
				<td class="left" style="padding-bottom: 5px;">
					<h2>성별</h2>
				</td>
			</tr>
			<tr>
				<td class="left">
					<select id="gender" name="gender" class="ps_box">
						<option value="">성별</option>
						<option value="남">남</option>
						<option value="여">여</option>
						<option value="무">선택안함</option>
					</select>
				    <!-- <input type="radio" name="gender" value="남"/>남
        			<input type="radio" name="gender" value="여"/>여</td> -->
			</tr>
			<tr>
				<td class="left" style="padding-bottom: 5px;">
					<h2>이메일</h2>
				</td>
			</tr>
			<tr>
				<td class="left">
					<input class="ps_box" type="email" name="email" id ="email" value="${ vo.email }"/>
					<!-- <input type="button" value="중복체크" id="emailCheck" /> -->
					<span id="emailCheckresult"></span>
				</td>
			</tr>
			<tr>
				<td class="left" style="padding-bottom: 5px;">
					<h2>주소</h2>
				</td>
			</tr>
			<tr>
				<td class="left">
					<input class="ps_box" type="text" name="addr" id="add" value="${ vo.addr }"/>
				</td>
			</tr>
			<tr>
				<td class="left" style="padding-bottom: 5px;">
					<h2>등급</h2>
				</td>
			</tr>
			<tr>
				<td>
					<select class="ps_box" name="grade" id="grade">
						<option value="씨앗">씨앗</option>
						<option value="새싹">새싹</option>
						<option value="잎새">잎새</option>
						<option value="가지">가지</option>
						<option value="나무">나무</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="left" style="padding-bottom: 5px;">
					<h2>보유 포인트</h2>
				</td>
			</tr>
			<tr>
				<td>
					<input class="ps_box" type="text" name="point" value="${ vo.point }"/>
				</td>
			</tr>
		</table>
	    <div style="margin: 0 auto; width: 60%">
	    	<input type="button" value="탈퇴" onclick=memberDelete() class="regbtn"/>
	    	<input type="submit" value="수정" class="regbtn"/>
	    	<input type="button" value="취소" onclick=gohome() class="regbtn"/>
	    </div>
		</form>
     </div>
     </div>
     <%-- <%@include file="/WEB-INF/include/footer.jsp" %> --%>
</body>
</html>