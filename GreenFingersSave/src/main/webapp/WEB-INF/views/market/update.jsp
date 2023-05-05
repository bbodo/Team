 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<title>그린마켓 게시글 수정 </title>

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
	#aside a {
	    text-decoration : none;
	    color: #fff;
	}
	#main {
		width: 80%;
		height: 800px;
		float: left;
		padding: 10px;
		background-color: gray;
	}
	table {
		border-collapse: collapse;
	}
	#cont {
		background-color: #fff;
		margin: 0 auto;
		width: 80%;
	}
	#cont th {
		background-color: #666;
		border: 1px solid black;
		padding: 10px 10px;
	}
	#cont td {
		padding-left: 10px;
		border: 1px solid black;
	}
	.right {
		text-align: right;
	}
	.left {
		text-align: center;
		padding: 30px;
		font-weight: bold;
	}
	input[type=text] {
		width: 100%;
	}
	textarea {
		width: 100%;
		height: 400px;
	}
	.update {
		margin-top : 30px;
		text-align: right;
		margin-right: 130px;
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
	 <%@include file="/WEB-INF/include/header.jsp" %>
     <div id="title">
     	<p>그린마켓</p>  
     </div>
     <div id="aside">
    	<a href="/Market/List?submenu_id=SUBMENU15&nowpage=1">입양원해요</a><br />
     	<a href="/Market/List?submenu_id=SUBMENU16&nowpage=1">나눔합니다</a><br />
     	<a href="/Market/List?submenu_id=SUBMENU17&nowpage=1">포인트 스토어</a><br />
     </div>
     
     <div id="main">
     
     <form action="/Market/Update" method="POST" 
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
		<caption class="left">게시글 수정</caption>
		<tr>
			<th>제목</th>
			<td><input type="text" name="board_title" value="${ vo.board_title }"/></td>
		</tr>
		<tr>
			<th>글 내용</th>
			<td><textarea name="board_cont">${ vo.board_cont }</textarea></td>
		</tr>
		<tr>
			<th>파일 첨부</th>
			<td id="tdfile" colspan="3">
		    <!-- 기존 파일 목록, 삭제버튼 -->
			<c:forEach  var="file"   items="${ fileList }">
			<div>
				  <a  class  = "aDelete"
				      href="/Market/deleteFile?file_num=${ file.file_num }&sfile=${file.sfilename}">
				                ❌
				</a>
				<a  href="/Market/download/external/${ file.sfilename }">
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
	
	<div class="update">
		<input type="submit" value="수정" />
	</div>
	</form>
     </div>  <!-- main end -->
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>