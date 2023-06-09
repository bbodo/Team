 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<title>게시판 수정</title>

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
		padding: 10px;
		padding: 50px 200px 50px 200px;
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
	.right {
		text-align: right;
	}
	.left {
		text-align: left;
	}
	.center {
		text-align: center;
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

<script src="https://code.jquery.com/jquery.min.js"></script>

<script>
  $( function() {
	  let num = 1;
	  // 파일추가 버튼 클릭
	  $('#btnAddFile').on('click', function(e) {
		  let tag = '<input type="file"  name="upfile' + num + '" class="upfile"/><br>';
		  $('#tdfile').append( tag );		  
		  num++;
	  })
	  
	  // X 클릭 -  파일 삭제
	  $('.aDelete').on('click', function(e) {
		  e.preventDefault();    // 페이지 이동 막음
		  e.stopPropagation();		  
		   
		  let aDelete = this;
		  
		  $.ajax({
			  url     : this.href,
			  method  : 'GET'			  
		  })
		  .done(function( result  ) {
		//	  alert('삭제 완료');
			  $(aDelete).parent().remove();   // 화면에서 항목 삭제
		  })
		  .fail( function( error ) {
			  console.log(JSON.stringify(error));
			  alert('오류발생:' + JSON.stringify(error) );
		  } ) ;
		 
	  })
  });  
</script>

</head>
<body>
	 <!-- header -->
	 <%@include file="/WEB-INF/include/header.jsp" %>
	 <%@include file="/WEB-INF/include/subBanner.jsp" %>
     <div id="title">
     	<p style="font-size: 40px; font-weight: bold;">당첨자 발표</p>
     </div>
     <div id="main">
	     <div><a id="board_title" href="/Winner/WinnerList?submenu_id=${ map.submenu_id }&nowpage=1">${ map.submenu_name } 게시판</a></div>
     	
	  <form action="/Winner/Update" method="POST" 
       enctype="multipart/form-data"   >
          
	  <input type="hidden"  name="board_idx"  value="${ map.board_idx  }" />
	  <input type="hidden"  name="submenu_id" value="${ map.submenu_id }" />
	  <input type="hidden"  name="bnum"       value="${ map.bnum       }" />
	  <input type="hidden"  name="lvl"        value="${ map.lvl        }" />
	  <input type="hidden"  name="step"       value="${ map.step       }" />
	  <input type="hidden"  name="nref"       value="${ map.nref       }" /> 
	  <input type="hidden"  name="parent"     value="${ map.board_idx  }" /> 
	  <input type="hidden"  name="nowpage"    value="${ map.nowpage    }" /> 
     
		<table id="cont">
			<tr>
				<td style="text-align: center;">제목</td>
				<td><input type="text" name="board_title" value="${ vo.board_title }"/></td>
			</tr>
			<tr>   
				<td style="text-align: center;">글 내용</td>
				<td><textarea name="board_cont" maxlength="1000">${ vo.board_cont }</textarea></td>
			</tr>
			<tr>
				<td style="text-align: center;">파일 첨부</td>
				<td id="tdfile">
			    <!-- 기존 파일 목록, 삭제버튼 -->
				<c:forEach  var="file"   items="${ fileList }">
				<div>
					  <a  class  = "aDelete"
					      href="/Winner/deleteFile?file_num=${ file.file_num }&sfile=${file.sfilename}">
					                ❌
					</a>
					<a  href="/Winner/download/external/${ file.sfilename }">
					${ file.filename }
					  </a>
				</div>
				</c:forEach>  
			<br>     
			<!-- 새 파일 추가 -->
			   <input type="button"  id="btnAddFile" value="파일 추가(최대 100M byte)" /><br>
			   <input type="file"  name="upfile"  class="upfile"/><br>
			</td>
			</tr>
		</table>
		<div class="center">
			<input type="submit" value="수정" />
		</div>
		</form>
     </div>
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>