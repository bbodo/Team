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
		height: 800px;
		float: left;
		padding: 10px;
		background-color: gray;
		text-align: center;
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
     <div id="title">
     	<p>마이 페이지</p>
     </div>
     <div id="aside">
     	내정보<br />
     	작성글<br />
     	쪽지<br />
     </div>
     <div id="main">
     	<h2>쪽지</h2><br />
			<div style="float: left;">
			<a href="">받은 쪽지</a>
			<a href="">보낸 쪽지</a>
		</div>
		<div style="float: right;">
			필터버튼
			<select>
				<option value="전체">전체</option>
				<option value="뭘까">뭘까</option>
				<option value="기타">기타</option>
			</select>
		</div>
		<br />
		<br />
		<table id="cont">
			<tr>
				<th><input type="checkbox" /></th>
				<th>보낸 사람</th>
				<th>제목</th>
				<th>날짜</th>
				<th>읽음 상태</th>
			</tr>
			<tr>
				<td><input type="checkbox" /></td>
				<td>엄준식</td>
				<td>독초 키우는 이유가 진짜임??</td>
				<td>2023-05-01</td>
				<td>안읽음ㅋ</td>
			</tr>
		</table>
	    <%@include file="/WEB-INF/include/paging.jsp" %>
	    <div style="float: left;">
	    	삭제 버튼
	    </div>
	    <div style="float: right;">
	    	쪽지 보내기 버튼
	    </div>
     </div>
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>