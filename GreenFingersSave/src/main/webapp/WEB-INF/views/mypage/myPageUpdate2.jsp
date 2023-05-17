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

</head>
<body>
	 <%@include file="/WEB-INF/include/header.jsp" %>
	 <%@include file="/WEB-INF/include/subBanner.jsp" %>
     <div id="aside">
     	내정보<br />
     	작성글<br />
     	쪽지<br />
     </div>
     <div id="main">
		<table id="cont">
			<tr>
				<!-- id는 수정불가하게 -->
				<th colspan="3" class="left">아이디 (수정불가)</th>
			</tr>
			<tr>
				<td colspan="3" class="left"><input type="text" readonly value="${ login.userid }" /></td>
			</tr>
			<tr>
				<!-- 자물쇠 버튼 눌러서 보이게하는 기능 ?? -->
				<th colspan="3" class="left">비밀번호</th>
			</tr>
			<tr>
				<td colspan="3" class="left"><input type="password" value=""/></td>
			</tr>
			<tr>
				<!-- 자물쇠 버튼 눌러서 보이게하는 기능 ?? -->
				<th colspan="3" class="left">비밀번호 재확인</th>
			</tr>
			<tr>
				<td colspan="3" class="left"><input type="password" /></td>
			</tr>
			<tr>
				<th colspan="3" class="left">이름</th>
			</tr>
			<tr>
				<td colspan="3" class="left"><input type="text" /></td>
			</tr>
			<tr>
				<th colspan="3" class="left">생년월일</th>
			</tr>
			<tr>
				<td><input type="text" placeholder="년(4자)" /></td>
				<td>
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
				<th>성별</th>
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
				<th colspan="3" class="left">이메일</th>
			</tr>
			<tr>
				<td colspan="3" class="left"><input type="text" /></td>
			</tr>
			<tr>
				<th colspan="3" class="left">주소</th>
			</tr>
			<tr>
				<td>
					<select name="" id="">
						<option value="">시/군/구</option>
						<option value="">근데 이거 다해야함??</option>
					</select>
				</td>
				<td>
					<select name="" id="">
						<option value="">동</option>
						<option value="">이것도 ㄷㄷ</option>
					</select>
				</td>
			</tr>
			<tr>
				<th colspan="3" class="left">상세주소</th>
			</tr>
			<tr>
				<td colspan="3" class="left"><input type="text" /></td>
			</tr>
		</table>
	    <div style="float: right;">
	    	<a href="">수정 하기</a> &nbsp; &nbsp;
	    	<a href="">탈퇴 하기</a>
	    </div>
     </div>
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>