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
	.center {
		text-align: center;
	}
	input[type=text] {
		width: 100%;
	}
	textarea {
		width: 100%;
		height: 400px;
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
	 <c:choose>
		<c:when test="${ sessionScope.login eq null }">
			<%@include file="/WEB-INF/include/header.jsp" %>
		</c:when>
		<c:otherwise>
			<%@include file="/WEB-INF/include/header2.jsp" %>
		</c:otherwise>
	</c:choose>
     <div id="title">
     	<p style="font-size: 40px; font-weight: bold;">식물 연합</p>
     </div>
     <div id="aside">
     	포이즌<br />
     	포이즌<br />
     	포이즌<br />
     	포이즌<br />
     	포이즌<br />
     	포이즌<br />
     </div>
     <div id="main">
     	
	  <form action="/Board/Update" method="POST" 
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
					      href="/Board/deleteFile?file_num=${ file.file_num }&sfile=${file.sfilename}">
					                ❌
					</a>
					<a  href="/Board/download/external/${ file.sfilename }">
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