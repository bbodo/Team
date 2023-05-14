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

<!-- <script src="/js/home.js"></script> -->

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
		background-color: white;
		width: 20%;
		padding: 10px;
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
	#main {
		width: 80%;
		height: auto;
		min-height: 1000px;
		float: left;
		padding: 10px;
		background-color: white;
		text-align: center;
	}
	
	#main p {
		margin-top: 30px;
		margin-bottom: 30px;
	}
	#tt {
		text-align: left;
	}
	#cont {
		background-color: #fff;
		padding: 10px;
		margin: 0 auto;
		width: 90%;
		border-collapse: collapse;
	}
	#cont th {
		background-color: white;
		border-top: 3px solid #C0C0C0;
		border-bottom: 1px solid #C0C0C0;
		padding: 20px;
	}
	#cont tr td {
		padding: 15px;
		border-bottom: 1px solid #C0C0C0;
	}
	#cont tr:hover {
		background-color: #D3D3D3;
	}	
	.right {
		text-align: right;
	} 
	#main { 
		display: block; 
		}
	
	#main a {
		margin-right: 100px;
	}
	h2 {
		padding: 30px;
	}
	
</style>
</head>
<body>
	<!-- header	 -->
	<c:choose>
		<c:when test="${ sessionScope.login eq null }">
			<%@include file="/WEB-INF/include/header.jsp" %>
		</c:when>
		<c:otherwise>
			<%@include file="/WEB-INF/include/header2.jsp" %>
		</c:otherwise>
	</c:choose>
	
	<%@include file="/WEB-INF/include/subBanner.jsp"%>
     <!-- <div id="title">
     	<p style="font-size: 40px; font-weight: bold;">그린마켓</p>
     </div> -->
     <div id="aside">
      <ul id="sidemenu">
     	<li><a href="/Market/List?menu_id=MENU03&submenu_id=SUBMENU15&nowpage=1">입양원해요</a></li>
     	<li><a href="/Market/List?menu_id=MENU03&submenu_id=SUBMENU16&nowpage=1">나눔합니다</a></li>
     	<li><a href="/Market/List?menu_id=MENU03&submenu_id=SUBMENU17&nowpage=1">포인트 스토어</a></li>
      </ul>
     </div>
     <div id="main">
     <h2 style="font-size: 24px;">${ map.submenu_name }</h2>
     <!-- 하위 메뉴 바뀔 때마다 내용 달라지게  -->
     <c:choose>
       <c:when test="${ map.submenu_id == 'SUBMENU15' }">
     <p style="font-size:15px;">그린핑거 회원이라면 누구나 입양 신청글 작성이 가능합니다<br>
     입양 완료 후 답례를 원한다면 내공이나 후기글로 고마움을 표현하세요</p>
       </c:when>
       <c:when test="${ map.submenu_id == 'SUBMENU16' }">
     <p style="font-size:15px;">그린핑거 회원이라면 누구나 나눔할 수 있습니다<br>
     나눔 후 답례를 원한다면 내공이나 후기글로 고마움을 표현하세요</p>
       </c:when>
       <c:otherwise>
       <p style="font-size:15px;">지금까지 모은 포인트로 물건을 구입하세요</p>
       </c:otherwise>
     </c:choose>
     
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
			<th class="padd8">번호</th>
			<th class="padd8">제목</th>
			<th class="padd8">작성일</th>
		<!-- 포인트 스토어일 때만 가격 뜨게 -->
		<c:choose>	
		<c:when test="${ map.submenu_id == 'SUBMENU17' }">
			<th class="padd8">가격</th>
		</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
		
		 <!-- 포인트 스토어일 때 작성자 비활성화 -->
	     <c:choose>	
		<c:when test="${ map.submenu_id != 'SUBMENU17' }">		
			<th class="padd8">작성자</th>
		 </c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>	
			
			<th class="padd8">조회수</th>
			
		</tr>
		
		<c:forEach var="marketVo" items="${ marketList }">
	  <tr>
	     <td>
	     <!-- 번호 -->
	      <c:if test="${ marketVo.lvl eq 0 }">
	          ${ marketVo.board_idx }
	      </c:if> 
	     </td>
	     <td id="tt">
	       <!-- 제목(새글/답글) -->
	       <c:choose>
	         <c:when test="${ marketVo.lvl eq 0 }">
	           <c:choose>
	            <c:when test="${ marketVo.delboard eq 0 }">
	              <a href="/Market/View?menu_id=${ map.menu_id }&submenu_id=${marketVo.submenu_id}&board_idx=${marketVo.board_idx}&nowpage=${map.nowpage}">
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
	                <a href="/Market/View?menu_id=${ map.menu_id }&submenu_id=${marketVo.submenu_id}&board_idx=${marketVo.board_idx}&nowpage=${map.nowpage}">
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
	<br>
	 <%@include file="/WEB-INF/include/paging.jsp" %>
     </div>
     
  <!--    footer -->
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>