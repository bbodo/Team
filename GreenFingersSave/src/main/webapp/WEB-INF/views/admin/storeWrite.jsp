 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<title>스토어 상품 등록</title>

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
		background-color: white;
		width: 15%;
		padding: 10px;
	}
	#main {
		width: 85%;
		height: 1200px;
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

</style>

<!-- 파일 첨부 -->
<script src="https://code.jquery.com/jquery.min.js"></script>

<!-- 이미지/파일 추가 버튼 -->
<script>
  $( function() {
	  let num = 1;
	  $('#btnAddFile1').on('click', function(e) {
		  let tag = `<input type="file"  name="upfile\${num}" class="upfile" onchange=readURL(this,\${num}) /><br>`;
		  tag    += '<img id="preview'+ num + '" src="#" width=200 height=180 alt="선택된 이미지가 없습니다" style="align-content: flex-end; ">'
		  $('#imgplus').append( tag );		  
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

<!-- 이미지 파일 첨부 (자바스크립트 버전)-->
<!-- <script type="text/javascript">

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
</script> -->

<!-- 이미지 파일 첨부(제이쿼리 버전)  -->
<script>
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
               console.log(e)
               $('#preview'+ num).attr('src', e.target.result);
           }
           //File내용을 읽어 dataURL형식의 문자열로 저장 
           reader[num].readAsDataURL(input.files[0]);
       }
   }
   </script>
   

</head>
<body>
	 <%@include file="/WEB-INF/include/adminHeader.jsp" %>
	 <%@include file="/WEB-INF/include/adminsubBanner.jsp" %>
     <!-- <div id="title">
     	<p style="font-size: 30px; font-weight: bold;">상품 등록</p>  
     </div> -->
     <div id="aside">
      <ul id="sidemenu">
     	<li><a href="/Manager/Member">회원 관리</a><br /></li>
   		<li><a href="/Manager/Menu">메뉴 관리</a> <br /></li>
   		<li><a href="/Manager/subMenu"> - 하위 메뉴</a><br /></li>
   		<li><a href="/Manager/EventList?menu_id=Event&nowpage=1">이벤트 관리</a><br /></li>
     		<li><a href="/Manager/WinnerList?menu_id=Winner&nowpage=1">당첨자관리</a><br /></li>
     		<li><a href="/Manager/SeminarList?menu_id=Festival&submenu_id=SUBMENU21&nowpage=1">행사 관리</a></li>
   			<li><a href="/Manager/Store?menu_id=Store">스토어 관리</a><br /></li>
     </ul>
     </div>
     <div id="main">
     
     	<form action="/Manager/storeWrite" method="POST" 
        	  enctype="multipart/form-data">
        	  
		<input type="hidden"  name="menu_id"    value="MENU03" />  	  
        	  
		<table id="cont">
			<tr>
				<td style="text-align: center;">제목</td>
				<td><input type="text" name="board_title" value="${ vo.board_title }"/></td>
			</tr>
			<tr>
				<td style="text-align: center;">가격</td>
				<td><input type="text" name="market_value" value="${ vo.market_value }"/></td>
			</tr>
			<tr>
				<td style="text-align: center;">글 내용</td>
				<td><textarea name="board_cont" maxlength="1000">${ vo.board_cont }</textarea></td>
			</tr>
			
			<div class="form-group" >
				<td style="text-align: center;">이미지 첨부</td>
				<td id="imgplus"> 
				<input type="button"  id="btnAddFile1" value="파일 추가(최대 100M byte)" /><br>
          			<input type="file" name="upFile" class="upfile" onchange="readURL(this,0);"/>
				<img id="preview0" src="#" width=200 height=180 alt="선택된 이미지가 없습니다" style="align-content: flex-end; ">
				</td>
			</div> 
			
			<tr>
				<td style="text-align: center;">파일 첨부</td>
				<td id="tdfile">
		      	 <input type="button"  id="btnAddFile2" value="파일 추가(최대 100M byte)" /><br>
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