<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/adminHeader.jsp" %>
<title>이벤트 관리</title>

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

<script src="https://code.jquery.com/jquery.min.js"></script>

<script>
  $( function() {
	  let num = 1;
	  $('#btnAddFile').on('click', function(e) {
		  let tag = '<input type="file"  name="upfile' + num + '" class="upfile"/><br>';
		  $('#tdfile').append( tag );		  
		  num++;
	  })
  });
</script>

</head>
<body>
     <div id="title">
     	<p>이벤트 관리</p>
     </div>
     <div id="main">
		<table id="cont">
			<tr>
				<th>제목</th>
				<td><input type="text" /></td>
			</tr>
			<tr>
				<th>이벤트 기간</th>
				<td><input type="date" /> ~ <input type="date" /></td>
			</tr>
			<tr>
				<th>글 내용</th>
				<td><textarea>이미지 들어가게</textarea></td>
			</tr>
			<tr>
				<th>파일 첨부</th>
				 <td id="tdfile">
		        <input type="button"  id="btnAddFile" value="파일 추가(최대 100M byte)" /><br>
		        <input type="file"  name="upfile"  class="upfile"/><br>
     </td>
			</tr>
		</table>
		<div style="float: right;">
			<a href="">취소버튼</a>
			<a href="">등록버튼</a>
		</div>
     </div>
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>