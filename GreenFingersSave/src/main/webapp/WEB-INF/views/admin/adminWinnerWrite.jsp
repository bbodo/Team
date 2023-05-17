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
	#aside {
		float: left;
		height: 800px;
		background-color: white;
		width: 15%;
		padding: 10px;
	}
	#main {
		width: 85%;
		height: auto;
		min-height: 800px;
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
	.btn {
		margin-top : 30px;
		text-align: right;
		margin-right: 130px;
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

<script>
  $( function() {
	  let num = 1;
	  $('#btnAddFile2').on('click', function(e) {
		  let tag = '<input type="file"  name="upfile' + num + '" class="upfile"/><br>';
		  $('#tdfile').append( tag );		  
		  num++;
	  })
  });
</script>

<script>
//미리보기 시작
   $("#imgplus").change(function(){
                //alert(this.value); //선택한 이미지 경로 표시
                readURL(this);
   });

   //미리보기 처리함수
   function readURL(input) {
       if (input.files && input.files[0]) {
           var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
           reader.onload = function (e) {
           //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
               //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정 
               $('#preview').attr('src', e.target.result);
           }
           //File내용을 읽어 dataURL형식의 문자열로 저장 
           reader.readAsDataURL(input.files[0]);
       }
   }
   </script>

</head>
<body>
	 <%@include file="/WEB-INF/include/header.jsp" %>
     <%@include file="/WEB-INF/include/adminsubBanner.jsp" %>
   
   <div id="aside">
		<ul id="sidemenu">
     	<li class="sidemenuTitle">SIDEMENU</li>
			<li><a href="/Manager/EventList?menu_id=${ map.menu_id }&submenu_id=SUBMENU18&nowpage=1" >이벤트</a></li>
			<li> <a href="/Manager/WinnerList?menu_id=${ map.menu_id }&submenu_id=SUBMENU19&nowpage=1">이벤트 당첨자</a></li>
		</ul>
	</div>
	
     <div id="main">
		<div><a id="board_title" href="/Manager/WinnerList?submenu_id=${ map.submenu_id }&nowpage=1">${ map.submenu_name } 게시판</a></div>
     
     	<form action="/Manager/WinnerWrite" method="POST" 
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
			
				<div class="form-group" >
				<td style="text-align: center;">이미지 첨부</td>
				<td id="imgplus"> 
				<input type="button"  id="btnAddFile1" value="파일 추가(최대 100M byte)" /><br>
          			<input type="file" name="upFile" class="upfile" onchange="readURL(this);"/>
				<img id="preview" src="#" width=200 height=180 alt="선택된 이미지가 없습니다" style="align-content: flex-end; ">
				</td>
			</div> 
			

			
		</table>
		<input class="regbtn" type="submit" value="당첨자 리스트 올리기" />
		</form>
     </div>
</body>
</html>