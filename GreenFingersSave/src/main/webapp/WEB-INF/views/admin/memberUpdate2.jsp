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
     		<li><a href="/Manager/EventList?menu_id=Event&nowpage=1">이벤트 관리</a><br /></li>
     		<li><a href="/Manager/WinnerList?menu_id=Winner&nowpage=1">당첨자관리</a><br /></li>
     		<li><a href="/Manager/SeminarList?menu_id=Festival&submenu_id=SUBMENU21&nowpage=1">행사 관리</a></li>
     		<li><a href="/Manager/Store?menu_id=Store">스토어 관리</a><br /></li>
       </ul>
     </div>
     <div id="main">
		<table id="cont">
			<tr>
				<!-- id는 수정불가하게 -->
				<td colspan="4" class="left"><h2>아이디</h2></td>
			</tr>
			<tr>
				<td colspan="4" class="left"><span style="width: 40px;"></span>${ vo.userid }</td>
			</tr>
			<tr>
				<!-- 자물쇠 버튼 눌러서 보이게하는 기능 ?? -->
				<!-- admin은 그냥 수정할 수 있게 -->
				<td colspan="4" class="left"><h2>비밀번호</h2></td>
			</tr>
			<tr>
				<td colspan="4" class="left"><input type="password" value="${ vo.passwd }"/></td>
			</tr>
			<tr>
				<td colspan="4" class="left"><h2>이름</h2></td>
			</tr>
			<tr>
				<td colspan="4" class="left"><input type="text" value="${ vo.username }"/></td>
			</tr>
			<tr>
				<td colspan="4" class="left"><h2>생년월일</h2></td>
			</tr>
			<tr>
				<td><input type="text" placeholder="년(4자)" /></td>
				<td colspan="2">
					<select name="" id="">
						<option value="">월</option>					
						<option value="">1</option>					
						<option value="">2</option>					
						<option value="">3</option>					
						<option value="">4</option>					
						<option value="">5</option>					
						<option value="">6</option>					
						<option value="">7</option>					
						<option value="">8</option>					
						<option value="">9</option>					
						<option value="">10</option>					
						<option value="">11</option>					
						<option value="">12</option>					
					</select>
				</td>
				<td>
					<input type="text" placeholder="일"/>
				</td>
			</tr>
			<tr>
				<td colspan="4"><h2>성별</h2></td>
			</tr>
			<tr>
				<td>
					<select name="" id="">
						<option value="">성별</option>
						<option value="">남자</option>
						<option value="">여자</option>
						<option value="">둘다아닌 무언가</option>
						<option value="">외계인</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="4" class="left"><h2>이메일</h2></td>
			</tr>
			<tr>
				<td colspan="4" class="left"><input type="text" /></td>
			</tr>
			<tr>
				<td colspan="4" class="left"><h2>주소</h2></td>
			</tr>
			<tr>
				<td>
					<select name="" id="">
						<option value="">시/군/구</option>
						<option value="">근데 이거 다해야함??</option>
					</select>
				</td>
				<td >
					<select name="" id="">
						<option value="">동</option>
						<option value="">이것도 ㄷㄷ</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="4" class="left"><h2>상세주소</h2></td>
			</tr>
			<tr>
				<td colspan="4" class="left"><input type="text" /></td>
			</tr>
			<tr>
				<td><h2>등급</h2></td>
				<td>
					<select name="" id="">
						<option value="">A</option>
						<option value="">B</option>
						<option value="">C</option>
						<option value="">D</option>
						<option value="">E</option>
					</select>
				</td>
				<td><h2>보유 포인트</h2></td>
				<td>포인트 불러오기</td>
			</tr>
		</table>
	    <div style="float: right;">
	    	<a href="">수정 하기</a> &nbsp; &nbsp;
	    	<a href="">탈퇴 시키기</a>
	    </div>
     </div>
     <%-- <%@include file="/WEB-INF/include/footer.jsp" %> --%>
</body>
</html>