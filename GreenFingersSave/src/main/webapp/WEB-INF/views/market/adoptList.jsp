<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판 양식</title>

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
		height: 1000px;
		background-color: navy;
		width: 20%;
		padding: 10px;
	}
	#aside a {
	        text-decoration : none;
	        color: #fff;
	        margin: 10px 30px;
	}
	#main {
		width: 80%;
		height: 1000px;
		float: left;
		padding: 10px;
		background-color: gray;
		text-align: center;
	}
	#givelist { 
	            display: flex;
	            gap : 0.3px;
	            text-decoration : none;
	            margin-top: 50px;
	            margin-left: 250px;
    }
    .plant  { 
             margin: 0 0 15px 0;
    }
	#list {
		background-color: #fff;
	}
	#list th {
		background-color: #666;
	}
	.right {
		text-align: right;
	} 
	
	#main { display: block; }
	
	img { width : 250px; 
	      height: 250px;
	}
	#cont {
		background-color: #fff;
		margin: 0 auto;
		margin-bottom: 30px;
		width: 60%;
	}
	#cont th {
		background-color: #666;
	}
	

</style>

</head>
<body>
	 <%@include file="/WEB-INF/include/header.jsp" %>
     <div id="title">
     	<p>그린마켓</p>
     </div>
     <div id="aside">
     	<a href="">나눔합니다</a><br />
     	<a href="">입양원해요</a><br />
     	<a href="">포인트 스토어</a><br />
     </div>
     <div id="main">
     
     <p>회원 등급과 상관없이 누구나 입양 신청글 작성이 가능합니다<br>
     입양 완료 후 답례를 하고 싶다면 포인트로 고마움을 표현하세요</p>
     
    <table id="cont">
		<caption><h2>입양 원해요</h2></caption>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성일</th>
			<th>작성자</th>
			<th>조회수</th>
		</tr>
		
		<c:forEach var="marketVo" items="${ adoptList }">
	  <tr>
	     <td>
	     <!-- 번호 -->
	      <c:if test="${ marketVo.lvl eq 0 }">
	          ${ marketVo.board_idx }
	      </c:if> 
	     </td>
	     <td>
	       <!-- 제목(새글/답글) -->
	       <c:choose>
	         <c:when test="${ marketVo.lvl eq 0 }">
	           <c:choose>
	            <c:when test="${ marketVo.delboard eq 0 }">
	              <a href="/Market/View?submenu_id=${marketVo.submenu_id}&board_idx=${marketVo.board_idx}&nowpage=${map.nowpage}">
	       		   ${ marketVo.board_title }
	       		  </a>
	       		</c:when>
	       		<c:otherwise>
	       		   <s>삭제된 게시물 입니다</s>
	       		</c:otherwise>
	       	   </c:choose>	 
	       		
	         </c:when>
	         <c:otherwise>
	         
	            <b style="display:inline-block; width:${marketVo.lvl*20}px"></b> 
	            
	            <c:choose>
	              <c:when test="${ marketVo.delnum eq 0 }">
	                <a href="/Market/View?submenu_id=${marketVo.submenu_id}&board_idx=${marketVo.board_idx}&nowpage=${map.nowpage}">
	              	  [답글] ${ marketVo.board_title }
	         	    </a>
	         	  </c:when>
	         	  <c:otherwise>
	         	     [답글] <s>삭제된 글입니다</s>
	         	  </c:otherwise>
	         	</c:choose>
	         	
	         </c:otherwise>
	       </c:choose>
	     </td>
	     <td>
	     <!-- 작성일 -->
	     <!-- 날짜 -->
	     ${fn:substring( marketVo.board_regdate, 0, 10) }
	     </td>
		 <td>    
	     <!-- 작성자 -->
	     ${ marketVo.nickname }
	     </td>
	     <td>
	     <!-- 조회수 -->
	     ${ marketVo.readcount }
	     </td>
	  </tr>  
	  </c:forEach>
		</table> 
    
	
	
		<input type="button" class="right" value="새글 작성" />
	    <%@include file="/WEB-INF/include/paging.jsp" %>
     </div>
     
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>