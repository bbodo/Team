<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<!-- <script src="https://code.jquery.com/jquery.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>

<script>
	window.onload = function() {

	}//end
	
	

</script>

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
		padding-right : 15%;
		background-color: white;
	}
	#cont {
		background-color: #fff;
		margin: 0 auto;
		width: 100%;
		border-collapse: collapse;
		margin-top: 10px;
		border-top: 3px solid #228B22;
	}
	#cont tr td {
		padding: 15px;
		border-bottom: 1px solid #C0C0C0;
	} 
	#cont tr:nth-of-type(2) {
		border-bottom: 1px solid #228B22;
	}
	#board_title {
		font-size: 32px;
		font-weight: bold;
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
	.left {
		text-align: left;
	}
	input[type=text] {
		width: 100%;
		padding: 5px;
	}
	textarea {
		width: 100%;
		height: 400px;
		padding: 20px;
	}

</style>

</head>
<body>
	 <%@include file="/WEB-INF/include/header.jsp" %>
     <div id="title">
     	<p>행사 등록 관리자페이지임</p>
     </div>
     <div id="aside">
     	내정보<br />
     	작성글<br />
     	쪽지<br />
     </div>
     
     <div id="main">
		<form action="/Manager/SeminarWriteSave?submenu_id=21&nowpage=1" method="POST" enctype="multipart/form-data">

			<table id="cont">
				<tr>
					<th>작성자</th>
					<td><input name="manager_name" type="text" value="" /></td>
					<th>등록일</th>
					<td><input name="board_regdate" type="text" value="" /></td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3"><input id="board_title" name="board_title" type="text" /></td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="3"><input id="address" name="address" type="text" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3">
				      <div id="smarteditor" >
				        <textarea name="board_cont" id="board_cont" 
				                  rows="20" cols="10" 
				                  placeholder="내용을 입력해주세요"
				                  style="width: 100%"></textarea>
				      </div>
					</td>
					<!-- <td colspan="3"><textarea id="notecont" name="notecont"></textarea></td> -->
				</tr>
				
				<tr>
					<td style="text-align: center;">파일 첨부</td>
					<td colspan="3" id="tdfile">
			      	 <input type="button"  id="btnAddFile2" value="파일 추가(최대 100M byte)" /><br>
			       	 <input type="file"  name="upfile"  class="upfile"/><br>
			   		</td>
				</tr>

				<tr>
					<td colspan="2">
					<a id="btnUpdate"href="/Data/Update" class="btn btn-primary btn-sm">수정</a> 
					<a id="btnDelete" href="/Data/Del" class="btn btn-primary btn-sm">삭제</a>
					<input type="button" id="btnClear" class="btn btn-primary btn-sm"value="Clear" />
					<input style="float: right;" id="submitBtn" type="submit" value="전송" onclick='submitPost()'/>
					</td>
				</tr>
			</table>
			
		</form>
		<button id="cencelBtn" style="float: left;">취소 버튼</button>
	</div>
	
	 <!--   <form enctype="multipart/form-data" method="post" >
      <div id="smarteditor">
        <textarea name="editorTxt" id="editorTxt" 
                  rows="20" cols="10" 
                  placeholder="내용을 입력해주세요"
                  style="width: 500px"></textarea>
      </div>
      <input type="button" value="전송"  onclick="submitPost()"/>
    </form> -->
</body>
</html>