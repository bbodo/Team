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
		background-color: white;
		width: 15%;
		padding: 10px;
	}
	#main {
		width: 85%;
		height: 800px;
		float: left;
		padding: 10px;
		padding-right: 15%;
		background-color: white;
	}
	#cont {
		border: 1px solid #C0C0C0;
		background-color: #fff;
		margin: 0 auto;
		width: 70%;
		border-collapse: collapse;
		padding: 30px;
	}
	#cont th {
		background-color: white;
		border-top: 3px solid #C0C0C0;
		border-bottom: 1px solid #C0C0C0;
		padding: 20px;
	}
	#cont tr td {
		padding: 15px;
		border-bottom: 1px solid #C0C0C0;
	} 
	#cont tr:hover {
		background-color: #D3D3D3;
	}
	#sidemenu {
		padding: 30px;
	}
	#sidemenu li {
		padding: 10px;
	}
	#sidemenu li a {
		position: relative;
		display: block;
		font-size: 20px;
	}
	#sidemenu li a:after {
		content: "";
		position: absolute;
		left: 0;
		bottom: 24px;
		width: 0px;
		height: 3px;
		margin: 5px 0 0;
		transition: all 0.2s ease-in-out;
		transition-duration: 0.3s;
		opacity: 0;
		background-color: #2E8B57;
	}
	#sidemenu li a:hover:after {
		width: 100%;
		opacity: 1;
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

</style>

<script src="https://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">
	
	$(function(){
		$('#gender').val('${vo.gender}').prop("selected", true);
		$('#grade').val('${vo.grade}').prop("selected", true);
	})

	function memberDelete() {
		if(window.confirm("정말 탈퇴시키겠습니까?")) {
			$.ajax({
				url : "/Manager/memberDelete",
				data : {usercode : ${vo.usercode}},
				type : "POST",
				success : function(data) {
					alert("탈퇴되었습니다 !");
					location.replace("/Manager/Member");
				},
				error : function() {
					alert("에러!!")
				}
			});
		};
	}

</script>

</head>
<body>
	 <%@include file="/WEB-INF/include/header.jsp" %>
     <div id="title">
     	<p>상세보기</p>
     </div>
      <div id="aside">
       <ul id="sidemenu">
     		<li><a href="">회원 관리</a><br /></li>
       		<li><a href="">메뉴 관리</a> <br /></li>
     		<li><a href=""> - 하위 메뉴</a><br /></li>
     		<li><a href="">이벤트 등록</a><br /></li>
     		<li><a href="">마켓 등록</a><br /></li>
       </ul>
     </div>
     <div id="main">
     	<form action="/Manager/memberUpdate" method="POST">
     	<input type="hidden" value="${ vo.userid }" name="userid"/>
     	<input type="hidden" value="${ vo.usercode }" name="usercode" id="usercode"/>
		<table id="cont">
			<tr>
				<!-- id는 수정불가하게 -->
				<td class="left"><h2>아이디</h2></td>
			</tr>
			<tr>
				<td class="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ vo.userid }</td>
			</tr>
			<tr>
				<!-- 자물쇠 버튼 눌러서 보이게하는 기능 ?? -->
				<!-- admin은 그냥 수정할 수 있게 -->
				<td class="left"><h2>비밀번호</h2></td>
			</tr>
			<tr>
				<td class="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" value="${ vo.passwd }" name="passwd"/></td>
			</tr>
			<tr>
				<td class="left"><h2>이름</h2></td>
			</tr>
			<tr>
				<td class="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="${ vo.username }" name="username"/></td>
			</tr>
			<tr>
				<td class="left"><h2>생년월일</h2></td>
			</tr>
			<tr>
				<td>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="${ vo.birthday }" name="birthday"/>
				</td>
			</tr>
			<tr>
				<td><h2>성별</h2></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select name="gender" id="gender">
						<option value="">성별</option>
						<option value="남">남자</option>
						<option value="여">여자</option>
						<option value="뭔데">둘다아닌 무언가</option>
						<option value="외계인">외계인</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="left"><h2>이메일</h2></td>
			</tr>
			<tr>
				<td class="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="${ vo.email }" name="email"/></td>
			</tr>
			<tr>
				<td class="left"><h2>주소</h2></td>
			</tr>
			<tr>
				<td>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="${ vo.addr }" name="addr"/>
				</td>
			</tr>
			<tr>
				<td ><h2>등급</h2></td>
			</tr>
			<tr>
				<td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select name="grade" id="grade">
						<option value="씨앗">씨앗</option>
						<option value="새싹">새싹</option>
						<option value="잎새">잎새</option>
						<option value="가지">가지</option>
						<option value="나무">나무</option>
					</select>
				</td>
			</tr>
			<tr>
				<td ><h2>보유 포인트</h2></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="point" value="${ vo.point }"/></td>
			</tr>
		</table>
	    <div style="float: right;">
	    	<input type="submit" value="수정 하기"/> &nbsp; &nbsp;
	    	<input type="button" value="탈퇴 시키기" onclick=memberDelete() />
	    </div>
		</form>
     </div>
     <%-- <%@include file="/WEB-INF/include/footer.jsp" %> --%>
</body>
</html>