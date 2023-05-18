<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<!-- <script src="https://code.jquery.com/jquery.min.js"></script> -->
<!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery.min.js"></script> -->
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



	#main {
		width: 85%;
		height: 800px;
		float: left;
		padding: 10px;
		padding-right : 15%;
		background-color: white;
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
	#cont th {
		border-top: none;
	}

</style>

</head>
<body>
	 <%@include file="/WEB-INF/include/adminHeader.jsp" %>
 	<%@include file="/WEB-INF/include/adminsubBanner.jsp" %>
 	<div id="wrapper">
      <div id="aside">
       <ul id="sidemenu">
       <li class="sidemenuTitle">SIDEMENU</li>
			<li><a href="/Manager/Member?menu_id=Member">회원 관리</a><br /></li>
       		<li><a href="/Manager/Menu?menu_id=Menu">메뉴 관리</a> <br /></li>
     		<li><a href="/Manager/subMenu?menu_id=subMenu"> - 하위 메뉴</a><br /></li>
     		<li><a href="/Manager/EventList?menu_id=Event&nowpage=1">이벤트 관리</a><br /></li>
     		<li><a href="/Manager/WinnerList?menu_id=Winner&nowpage=1">당첨자 관리</a><br /></li>
     		<li><a href="/Manager/Store">상품 등록</a><br /></li>
       </ul>
     </div>
     
     <div id="main">
		<form action="/Manager/SeminarWriteSave?menu_id=MENU04&submenu_id=SUBMENU21&nowpage=1" method="POST" enctype="multipart/form-data" >

			<table id="cont">
				<tr>
					<th>작성자</th>
					<td><input name="manager_name" type="text" value="관리자" disabled/></td>
					<th>등록일</th>
					<td><input id="board_regdate" name="board_regdate" type="text" value="" disabled/></td>
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
					<div class="form-group" >
						<td style="text-align: center;">이미지 첨부</td>
						<td id="imgplus" colspan="3"> 
					      	 <input type="button"  id="btnAddFile0" value="파일 추가(최대 100M byte)" /><br>
					       	 <input type="file"  name="upfile"  class="upfile" onchange="readURL(this,0);"/>
					       	 <img id="preview0" src="#" width=200 height=50 alt="선택된 이미지가 없습니다" style="align-content: flex-end; ">
				   		</td>
			   		</div>
				</tr>
				
				<tr>
					<td style="text-align: center;">파일 첨부</td>
					<td id="tdfile" colspan="3">
			      	 <input type="button"  id="btnAddFile1" value="파일 추가(최대 100M byte)" /><br>
			       	 <input type="file"  name="upfile"  style="height:50px;" class="upfile"/><br>
			   		</td>
				</tr>

				<tr>
					<td colspan="4">
					<a id="btnUpdate"href="/Data/Update" class="btn btn-primary btn-sm">수정</a> 
					<a id="btnDelete" href="/Data/Del" class="btn btn-primary btn-sm">삭제</a>
					<a id="btnDelete" href="/Event/SeminarList?menu_id=MENU04&submenu_id=SUBMENU21&nowpage=1" class="btn btn-primary btn-sm">목록으로</a>
					<input type="button" id="btnClear" class="btn btn-primary btn-sm"value="Clear" />
					<input style="float: right;" id="submitBtn" type="submit" value="전송" class="regbtn"/>
					</td>
				</tr>
			</table>
			
		</form>
		<!-- <button id="cencelBtn" style="float: left;">취소 버튼</button> -->
	</div>
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