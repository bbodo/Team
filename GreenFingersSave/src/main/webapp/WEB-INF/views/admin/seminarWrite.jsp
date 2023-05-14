<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<title>Insert title here</title>
</head>
<body>
 <%@include file="/WEB-INF/include/adminHeader.jsp" %>
     <div id="title">
     	<p style="font-size: 30px; font-weight: bold;">상품 등록</p>  
     </div>
     <div id="aside">
      <ul id="sidemenu">
     	<li><a href="/Manager/Member">회원 관리</a><br /></li>
   		<li><a href="/Manager/Menu">메뉴 관리</a> <br /></li>
   		<li><a href="/Manager/subMenu"> - 하위 메뉴</a><br /></li>
   		<li><a href="">이벤트 등록</a><br /></li>
   		<li><a href="/Manager/Store">상품 등록</a><br /></li>
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