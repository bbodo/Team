 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${ map.submenu_name } 글쓰기</title>

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
		height: 1200px;
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
		height: 1200px;
		float: left;
		padding: 10px;
		background-color: gray;
	}
	#cont {
		background-color: #fff;
		margin: 0 auto;
		width: 80%;
	}
	#cont th {
		background-color: #666;
		padding: 10px 10px;
	}
	.right {
		text-align: right;
	}
	h2 {
	    font-weight: 30px;
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
	.btn {
		margin-top : 30px;
		text-align: right;
		margin-right: 130px;
	}

</style>

<!-- 파일 첨부 -->
<script src="https://code.jquery.com/jquery.min.js"></script>

<!-- 버튼 파일/이미지 추가 -->
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

<!-- 이미지 파일 첨부 -->
<script type="text/javascript">

   function readURL(input) {
      var file = input.files[0] 
      console.log(file)
      if (file != '') {
         var reader = new FileReader();
         reader.readAsDataURL(file);
         reader.onload = function (e) { 
	     console.log(e.target)
		console.log(e.target.result)
           $('#preview').attr('src', e.target.result);
          }
      }
  }  
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
		<c:choose>
			<c:when test="${  map.bnum eq 0 }">    
				<h2>${ map.submenu_name } 새글 등록</h2>
			</c:when>
			<c:otherwise>    
				<h2>${ map.submenu_name } 답글 등록</h2>
			</c:otherwise>  
		</c:choose>
     
     	<form action="/Market/Write" method="POST" 
        	  enctype="multipart/form-data">
        	  
     	<input type="hidden"  name="submenu_id" value="${ map.submenu_id }" />
		<input type="hidden"  name="bnum"       value="${ map.bnum       }" />
		<input type="hidden"  name="lvl"        value="${ map.lvl        }" />
		<input type="hidden"  name="step"       value="${ map.step       }" />
		<input type="hidden"  name="nref"       value="${ map.nref       }" /> 
		<input type="hidden"  name="parent"     value="${ map.board_idx  }" /> 
		<input type="hidden"  name="nowpage"    value="${ map.nowpage    }" /> 
		<input type="hidden"  name="userid"     value="${ map.userid     }" /> 
		     	
		<table id="cont">
			<tr>
				<th>제목</th>
				<td><input type="text" name="board_title" value="${ vo.board_title }"/></td>
			</tr>
			<tr>
				<th>글 내용</th>
				<td><textarea name="board_cont" maxlength="1000">${ vo.board_cont }</textarea></td>
			</tr>
			
			<form method="post" action="${contextPath}/market/writeSave" enctype="multipart/form-data">
				<div class="form-group" >
					<th>이미지 첨부</th>
					<td id="imgplus"> 
           			<input type="button"  id="btnAddImgFile" value="파일 추가(최대 100M byte)" /><br>
           			<input type="file" name="imgFile" onchange="readURL(this);"/>
					<img id="preview" src="#" width=200 height=180 alt="선택된 이미지가 없습니다" style="align-content: flex-end; ">
					</td>
			</div>
			</form>
			
			
			<tr>
				<th>파일 첨부</th>
				<td id="tdfile">
		      	 <input type="button"  id="btnAddFile" value="파일 추가(최대 100M byte)" /><br>
		       	 <input type="file"  name="upfile"  class="upfile"/><br>
		   		</td>
			</tr>
		</table>
		<div class="btn">
		<input type="submit" value="등록" />
		</div>
		</form>
     </div>
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>