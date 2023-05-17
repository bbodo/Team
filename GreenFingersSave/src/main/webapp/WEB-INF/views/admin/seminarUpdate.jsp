<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<script src="https://code.jquery.com/jquery.min.js"></script>
<title>Insert title here</title>

<script>
	window.onload = function() {
		let board_regdate = document.getElementById('board_regdate');
		
		var now = new Date();
		var year = now.getFullYear();
		var month = now.getMonth();
		var date = now.getDate();
		var sysdate = year + "년 " + month +1 + "월 " + date + "일";
		
		board_regdate.value = sysdate;
		
	}//end
	
	  $( function() {
		  let num = 1;
		  $('#btnAddFile0').on('click', function(e) {
			  let tag  = `<input type="file" name="upFile\${num}" class="upfile" onchange=readURL(this,\${num}) /><br>`;
			      tag += '<img id="preview'+ num + '" src="#" width=200 height=50 alt="선택된 이미지가 없습니다" style="align-content: flex-end; ">'
			  $('#imgplus').append( tag );		  
			  num++;
		  })
		  
		  $('#btnAddFile1').on('click', function(e) {
			  let tag = '<input type="file"  name="upfile' + num + '" class="upfile"/><br>';
			  $('#tdfile').append( tag );		  
			  num++;
		  })
	  });
	
	//미리보기 시작
	   $("#imgplus").change(function(){
	                //alert(this.value); //선택한 이미지 경로 표시
	                readURL(this);
	   });
	   
	   //미리보기 처리함수
	   function readURL(input, num) {
		let reader = [];
		console.log(num);
		   if (input.files && input.files[0]) {
	    	   reader[num] = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
	           reader[num].onload = function (e) {
	           //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
	               //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정 
	               console.log(e);
	               $('#preview'+ num).attr('src', e.target.result);
	               
	               var styleObj = { 
                       'width': '200px', 
                       'height': '180px' 
                   };
            
                   $('#preview'+ num).css(styleObj); 
	           }
	           //File내용을 읽어 dataURL형식의 문자열로 저장 
	           reader[num].readAsDataURL(input.files[0]);
	       }
	   }
		
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
/* 	 function Submit() {
		let address = document.getElementById('address');
		let address = document.getElementById('address');
		let boardCont = document.getElementById('board_cont');
		
		let addressValue = address.value;
		let boardContValue = boardCont.value;
		
		var str = boardContValue;
		str += ' ';
		str += addressValue;
		console.log(str);
		
		boardContValue = str;
		
		form.action = "http://www.naver.com";
		form.mothod = "POST";
		form.submit();
		return str;
		
     } */
	
     
	

</script>

<style type="text/css">



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
/* 	#cont {
		background-color: #fff;
		margin: 0 auto;
		width: 100%;
		border-collapse: collapse;
		margin-top: 10px;
		border-top: 3px solid #228B22;
	} */
	
	/* #cont tr td {
		padding: 15px;
		border-bottom: 1px solid #C0C0C0;
	}  */
	/* #cont tr:nth-of-type(2) {
		border-bottom: 1px solid #228B22;
	} */
	
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
		<form action="/Manager/SeminarUpdate?menu_id=MENU04&submenu_id=SUBMENU21&board_idx=${vo.board_idx }&nowpage=1" method="POST" enctype="multipart/form-data" >

			<table id="cont">
				<tr>
					<th>작성자</th>
					<td><input name="manager_name" type="text" value="관리자" disabled/></td>
					<th>등록일</th>
					<td><input id="board_regdate" name="board_regdate" type="text" value="" disabled/></td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3"><input id="board_title" name="board_title" type="text" value="${vo.board_title }" /></td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="3"><input id="address" name="address" type="text" value="${map.address }" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3">
				      <div id="smarteditor" >
				        <textarea name="board_cont" id="board_cont" 
				                  rows="20" cols="10" 
				                  placeholder="내용을 입력해주세요"
				                  style="width: 100%">"${map.board_cont}</textarea>
				      </div>
					</td>
					<!-- <td colspan="3"><textarea id="notecont" name="notecont"></textarea></td> -->
				</tr>
				
				<tr>
					<td style="text-align: center;">모든 파일 목록</td>
					<td id="tdfile" colspan="3">
				    <!-- 기존 파일 목록, 삭제버튼 -->
					<c:forEach  var="file"   items="${ fileList }">
					<div>
						  <a  class  = "aDelete"
						      href="/Event/deleteFile?file_num=${ file.file_num }&sfile=${file.sfilename}">
						                ❌
						</a>
						<a  href="/Event/download/external/${ file.sfilename }">
						${ file.filename }
						  </a>
					</div>
					</c:forEach>  
					<br>     
				</td>
				</tr>
				
				<tr>
					<div class="form-group" >
						<td>이미지 첨부</td>
						<td id="imgplus" colspan="3" > 
					      	 <input type="button"  id="btnAddFile0" value="파일 추가(최대 100M byte)" /><br>
					       	 <input type="file"  name="upfile"  class="upfile" onchange="readURL(this,0);"/>
					       	 <img id="preview0" src="#" width=200 height=50 alt="선택된 이미지가 없습니다" style="align-content: flex-end; ">
				   		</td>
			   		</div>
				</tr>
				
				<tr>
					<td >파일 첨부</td>
					<td id="tdfile" colspan="3">
			      	 <input type="button"  id="btnAddFile1" value="파일 추가(최대 100M byte)" /><br>
			       	 <input type="file"  name="upfile"  style="height:50px;" class="upfile"/><br>
			   		</td>
				</tr>

				<tr>
					<td colspan="4">
					<!-- <a id="btnUpdate"href="/Data/Update" class="btn btn-primary btn-sm">수정완료</a>  -->
					<input type="button" id="btnClear" class="btn btn-primary btn-sm"value="Clear" />
					<a id="btnDelete" href="/Manager/SeminarDelete?menu_id=MENU04&submenu_id=SUBMENU21&board_idx=${map.board_idx }&nowpage=1" class="btn btn-primary btn-sm">삭제</a>
					<input style="float: right;" id="submitBtn" type="submit" value="수정완료"/>
					<a id="btnDelete" href="/Event/SeminarList?menu_id=MENU04&submenu_id=SUBMENU21&nowpage=1" class="btn btn-primary btn-sm">목록으로</a>
					</td>
				</tr>
			</table>
			
		</form>
		<!-- <button id="cencelBtn" style="float: left;">취소 버튼</button> -->
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