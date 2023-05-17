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
	#main {
		width: 85%;
		height: auto;
		padding: 10px;
		padding-right : 15%;
		background-color: white;
		display: inline-block;
	}
	.cont {
		background-color: #fff;
		margin: 0 auto;
		width: 90%;
		border-collapse: collapse;
		margin-top: 10px;
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
	#wrapper {
		margin-top: 70px;
	}
	.regbtn {
		background-color:#44c767;
		color:#ffffff;
		font-size:15px;
		font-weight:bold;
		margin: 30px 0;
	    width: 100%;
	    height: 60px;
		text-decoration:none;
		border: none;
	}
	.regbtn:hover {
		background-color:#5cbf2a;
	}
	.regbtn:active {
		position:relative;
		top:1px;
	}

</style>

<script src="https://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">

		function gohome() {
		let menu_idEl = $('[name=menu_id]').val();
		let submenu_idEl = $('[name=submenu_id]').val();
			location.replace('/Board/List?menu_id=' + menu_idEl + '&submenu_id=' + submenu_idEl + '&nowpage=1');		
		}

   function readURL(input) {
      var file = input.files[0];
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
     <div id="wrapper">
     <div id="aside">
     	<ul id="sidemenu">
     	<li class="sidemenuTitle">SIDEMENU</li>
     	<c:forEach var="menu" items="${ submenuList }">
     		<c:choose>
			<c:when test="${menu.menu_id eq map.menu_id }">
				<li><a href="/Board/List?menu_id=${ menu.menu_id }&submenu_id=${menu.submenu_id}&nowpage=1">
						${menu.submenu_name}</a></li>
			</c:when>
			</c:choose>
     	</c:forEach>
     	</ul>
     </div>
     
     <div id="main">
	     <div><a id="board_title" href="/Board/List?submenu_id=${ map.submenu_id }&nowpage=1">${ map.submenu_name } 게시판</a></div>
     	
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
	  <input type="hidden"  name="menu_id"    value="${ map.menu_id    }" /> 
     
		<table id="cont">
			<tr>
				<td style="text-align: center;">제목</td>
				<td><input type="text" name="board_title" value="${ vo.board_title }"/></td>
			</tr>
			<tr>   
				<td style="text-align: center;">글 내용</td>
				<td><textarea name="board_cont" maxlength="1000">${ vo.board_cont }</textarea></td>
			</tr>
				 <div class="form-group" >
				<td style="text-align: center;">이미지 첨부</td>
				<td id="imgplus"> 
	         			<input type="file" name="imgFile" onchange="readURL(this);"/>
				<img id="preview" src="#" width=200 height=180 alt="선택된 이미지가 없습니다" style="align-content: flex-end; ">
				</td>
				</div>
			
			<tr>
				<td style="text-align: center;">모든 파일 목록</td>
				<td id="tdfile">
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
			<input class="regbtn" type="submit" value="작성" />
		</form>
			<input type="button" class="regbtn" value="취소" onclick=gohome(); />
     </div>
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>