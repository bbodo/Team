<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이벤트 리스트</title>

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
		text-align: center;
	}
	#cont {
		background-color: #fff;
		margin: 0 auto;
		width: 100%;
		padding: 50px;
	}
	#cont th {
		background-color: #666;
	}
	.right {
		text-align: right;
	}

</style>

</head>
<body>
	 <%@include file="/WEB-INF/include/header.jsp" %>
     <div id="title">
     	<p>이벤트</p>
     </div>
     <div id="main">
		<table id="cont">
			
			<!-- 크기 조정 할것 -->
			<tr>
				<td><h2>이벤트</h2></td>
				<td>
					총 X개
				</td>
				<td><input type="text" placeholder="검색"/></td>
				<td><a href="">돋보기 버튼</a></td>
			</tr>
			<tr>
				<th colspan="2"><a href="">이벤트 허허</a></th>
				<th colspan="2"><a href="">당첨자 발표</a></th>
			</tr>
			<tr>
				<td colspan="4"><hr /></td>
			</tr>
			<tr>
				<th colspan="2">제목</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<tr>
				<td colspan="2">땡겨올 제목</td>
				<td>땡겨올 작성일</td>
				<td>땡겨올 조회수</td>
			</tr>
		</table>
	    <%@include file="/WEB-INF/include/paging.jsp" %>
     </div>
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>