<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<title>${ map.submenu_name } 게시판</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<script src="/js/home.js"></script>

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
	
	#main p {
		margin-top: 30px;
		margin-bottom: 30px;
	}
	table {
		border-collapse: collapse;
	}
	#cont th {
		background-color: #666;
		border: 1px solid black;
		padding: 10px 10px;
	}
	#cont td {
		padding-left: 10px;
		border: 1px solid black;
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
	
	#main a {
		margin-right: 300px;
	}
	
	img { width : 250px; 
	      height: 250px;
	}
	#cont {
		background-color: #fff;
		margin: 0 auto;
		margin-top: 30px;
		margin-bottom: 30px;
		width: 60%;
	}
	h2 {
		margin-bottom: 20px;
	}
</style>

	<!-- header	 -->
	<c:choose>
		<c:when test="${ sessionScope.login eq null }">
			<%@include file="/WEB-INF/include/header.jsp" %>
		</c:when>
		<c:otherwise>
			<%@include file="/WEB-INF/include/header2.jsp" %>
		</c:otherwise>
	</c:choose>
</head>
<body>	
     <div id="title">
     	<p>그린마켓</p>
     </div>
     <div id="aside">
     	<a href="/Market/List?submenu_id=SUBMENU15&nowpage=1">입양원해요</a><br />
     	<a href="/Market/List?submenu_id=SUBMENU16&nowpage=1">나눔합니다</a><br />
     	<a href="/Market/List?submenu_id=SUBMENU17&nowpage=1">포인트 스토어</a><br />
     </div>
     <div id="main">
     
     <!-- 하위 메뉴 바뀔 때마다 내용 달라지게  -->
     <c:choose>
       <c:when test="${ map.submenu_id == 'SUBMENU15' }">
     <p>그린핑거 회원이라면 누구나 입양 신청글 작성이 가능합니다<br>
     입양 완료 후 답례를 원한다면 포인트나 후기글로 고마움을 표현하세요</p>
       </c:when>
       <c:when test="${ map.submenu_id == 'SUBMENU16' }">
     <p>그린핑거 회원이라면 누구나 나눔할 수 있습니다<br>
     나눔 후 답례를 원한다면 포인트나 후기글로 고마움을 표현하세요</p>
       </c:when>
       <c:otherwise>
       <p>지금까지 모은 포인트로 물건을 구입하세요</p>
       </c:otherwise>
     </c:choose>
     
		<h2>${ map.submenu_name }</h2>
		
		<!-- 포인트 스토어에서만 비활성화  -->
		<c:choose>	
			<c:when test="${ map.submenu_id != 'SUBMENU17' }">
			<div class="right">
			<a href="/Market/WriteForm?submenu_id=${ map.submenu_id }&bnum=0&lvl=0&step=0&nref=0&nowpage=1&userid=${ sessionScope.login.userid }">새글 작성</a>
	 		</div>
	 	</c:when>
		<c:otherwise>
		</c:otherwise>
		</c:choose>	
		
    <table id="cont">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성일</th>
		<!-- 포인트 스토어일 때만 가격 뜨게 -->
		<c:choose>	
		<c:when test="${ map.submenu_id == 'SUBMENU17' }">
			<th>가격</th>
		</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
		
		 <!-- 포인트 스토어일 때 작성자 비활성화 -->
	     <c:choose>	
		<c:when test="${ map.submenu_id != 'SUBMENU17' }">		
			<th>작성자</th>
		 </c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>	
			
			<th>조회수</th>
			
		</tr>
		
		<c:forEach var="marketVo" items="${ marketList }">
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
	              <c:when test="${ marketVo.delboard eq 0 }">
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
	     ${fn:substring( marketVo.board_regdate, 0, 10) }
	     </td>
	     <!-- 포인트 스토어일 때만 가격 활성화 -->
	     <c:choose>	
		<c:when test="${ map.submenu_id == 'SUBMENU17' }">
	     <td>
	     ${ marketVo.market_value }
	     </td>
	     </c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>		
	     
	     <!-- 포인트 스토어일 때 작성자 비활성화 -->
	     <c:choose>	
		<c:when test="${ map.submenu_id != 'SUBMENU17' }">
		 <td>    
	     <!-- 작성자 -->
	     ${ marketVo.nickname }
	     </td>
	     </c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>		
		
	     <td>
	     <!-- 조회수 -->
	     ${ marketVo.readcount }
	     </td>
	  </tr>  
	  </c:forEach>
		</table> 
	
	 <%@include file="/WEB-INF/include/paging.jsp" %>
     </div>
     
  <!--    footer -->
     <%@include file="/WEB-INF/include/footer.jsp" %>
     
   <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>  
</body>
</html>