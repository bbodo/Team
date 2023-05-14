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
<script type="text/javascript" src="../../static/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="../../static/smarteditor/sample/photo_uploader/jindo.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../../static/smarteditor/sample/photo_uploader/jindo.fileuploader.js" charset="utf-8"></script>
<script type="text/javascript" src="../../static/smarteditor/sample/photo_uploader/attach_photo.js" charset="utf-8"></script>
<title>Insert title here</title>

<script>
	window.onload = function() {
		smartEditor()
	}//end
	
   // $, $$ 함수 정의
   var $$ = function( selector ) {
	   return document.querySelectorAll(selector);   // tag 배열을 찾아줌
   };
   var $  = function( selector ) {
	   return document.querySelector(selector);  // tag 한개만 찾아줌
   };
	   
   let oEditors = []

    smartEditor = function() {
      console.log("Naver SmartEditor")
      nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        elPlaceHolder: "editorTxt",
        sSkinURI: "./../static/smarteditor/SmartEditor2Skin.html",
        fCreator: "createSEditor2"
      })
    }
   
   submitPost = function() {
	   oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", [])
	   let content = document.getElementById("editorTxt").value

	   if(content == '') {
	     alert("내용을 입력해주세요.")
	     oEditors.getById["editorTxt"].exec("FOCUS")
	     return
	   } else {
	     console.log(content)
	   }
	   
	   $(submitBtn).submit();
	 }

    /* $(document).ready(function() {
      smartEditor()
    }) */
    
    //--------------------------------------------------------------------------
    
    
    
   //----------------------------------------------------------
     // 추가, 수정 , 삭제 click - <a>
      const  aEls  = $$('form a');   
      console.dir(aEls);  // tag 배열 
      //  tag 배열(aEls)은 forEach 가 동작하지 않을때가 있음 - Array.from() 안에 넣으면 forEach가능
      //  Array.from(aEls).forEach
      Array.from(aEls).forEach( function( aEl, index ) {
   	   aEl.onclick = function( e ) {   
   		   e.preventDefault();   // a tag 기본 이벤트(href 로 이동)를 방해
   		   e.stopPropagation();
   		   //alert(aEl.id);
   		   
   		   let url = this.href;   // <a href=""></a>  // this == e.target 클릭한 a tag
   		   // 서버에서 조회
   		   switch( this.id ) {    			   
   			   case 'btnUpdate':  data_update( url ); break;    // /data/Update
   			   case 'btnDelete':  data_delete( url ); break;    // /data/Delete
   		   }
   	   }
      } );

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
     	<p>쪽지 쓰기</p>
     </div>
     <div id="aside">
     	내정보<br />
     	작성글<br />
     	쪽지<br />
     </div>
     
     <div id="main">
		<form action="/Manager/SeminarWrite?nowpage=1" method="POST" enctype="multipart/form-data">


			<table id="cont">
				<tr>
					<th>작성자</th>
					<td><input name="manager_name" type="text" value="" /></td>
					<th>시간</th>
					<td><input name="board_regdate" type="text" value="" /></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input id="board_title" name="board_title" type="text" /></td>
					<th>조회수</th>
					<td><input id="boardcount" name="boardcount" type="text" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3">
				      <div id="smarteditor" >
				        <textarea name="editorTxt" id="editorTxt" 
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