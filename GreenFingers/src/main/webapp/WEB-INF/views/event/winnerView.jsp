 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<title>이벤트</title>

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
		height: 800px;
		float: left;
		padding: 10px;
		background-color: gray;
	}
	#cont {
		background-color: #fff;
		margin: 0 auto;
		width: 100%;
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
	textarea {
		width: 650px;
	}

</style>

</head>
<body>
	 <%@include file="/WEB-INF/include/header.jsp" %>
     <div id="title">
     	<p>당첨자 발표</p>
     </div>
     <div id="main">
		<table id="cont">
			<caption class="left">당첨자 발표</caption>
			<tr>
				<th>제목</th>
				<td>땡겨올 제목</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>땡겨올 작성자 이름</td>
				<th>작성일</th>
				<td>땡겨올 작성일</td>
				<th>조회수</th>
				<td>땡겨올 조회수</td>
			</tr>
				<tr><td colspan="6"><hr /></td></tr>
			<tr>
				<th>내용</th>
				<td colspan="5">당첨자 발표 게시글 <br />
				안녕하세요 이번달 당첨자를 발표합니다. <br />
				김XX(서울시) <br />
				박OO(부산시) <br />
				김XX(서울시) <br />
				김XX(서울시) <br />
				박OO(부산시) <br />
				김XX(서울시) <br />
				김XX(서울시) <br />
				박OO(부산시) <br />
				김XX(서울시) <br />
				김XX(서울시) <br />
				박OO(부산시) <br />
				김XX(서울시) <br />
				
				당첨을 축하합니다 ~!
				</td>
			</tr>
		</table>
		<!-- 나중에 if 문 -->
		<div class="right">
		<!-- if문 관리자만 보이게 -->
		<a href="">수정</a>
		<a href="">삭제</a> <br />
		</div>
     </div>
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>