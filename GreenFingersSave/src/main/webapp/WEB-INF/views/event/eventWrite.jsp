 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/comHead.jsp" %>
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
     	<p>이벤트</p>
     </div>
     <div id="aside">
     	이벤트<br />
     	당첨자<br />
     </div>
     
     <div id="main">
		<div><a id="board_title" href="/Event/EventList?submenu_id=${ map.submenu_id }&nowpage=1">${ map.submenu_name } 게시판</a></div>
     
     	<form action="/Event/Write" method="POST" 
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
		      	 <input type="button"  id="btnAddFile" value="파일 추가(최대 100M byte)" /><br>
		       	 <input type="file"  name="upfile"  class="upfile"/><br>
		   		</td>
			</tr>
			
		</table>
		<input type="submit" value="올리기" />
		</form>
     </div>
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>