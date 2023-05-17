<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<link rel="stylesheet" href="/css/mypage.css" />

<title>게시판 양식</title>

<style type="text/css">
	#title {
		width: 100%;
		text-align: center;
		height: 100px;
		background-color: orange;
	}
	#title p {
		 line-height: 100px;
	}
	
	#sendPaing, #recPaing ,#sendPointList{
	display:none;
	}
</style>

<script type="text/javascript">
	window.onload = function() {
		
	}/*  window */
</script>

</head>
<body>
	 <%@include file="/WEB-INF/include/header.jsp" %>
	 <%@include file="/WEB-INF/include/subBanner.jsp" %>
     
<div id="wrap">
     <div id="main">	
     	<!-- <section2 시작> -->
     	
     	<section id="sec1">
	     	<div class="titleWrap">
	     		<p class="title">내가 쓴 글</p>
	     	</div>
  			
			<table id="sec2Cont">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>

				<c:forEach var="boardVo" items="${ boardList }">
				 <tr>
				    <td>
				    <!-- 번호 -->
				     <c:if test="${ boardVo.lvl eq 0 }">
				         ${ boardVo.board_idx }
				     </c:if> 
				    </td>
				    <td id="tt">
				      <!-- 제목(새글/답글) -->
				      <c:choose>
				        <c:when test="${ boardVo.lvl eq 0 }">
				          <c:choose>
				           <c:when test="${ boardVo.delboard eq 0 }">
				             <a href="/Board/View?menu_id=${ map.menu_id }&submenu_id=${boardVo.submenu_id}&board_idx=${boardVo.board_idx}&nowpage=${map.nowpage}">
				      		   <h2>${ boardVo.board_title }</h2>
				      		  </a>
				      		</c:when>
				      		<c:otherwise>
				      		   <s>삭제된 게시물 입니다</s>
				      		</c:otherwise>
				      	   </c:choose>	 
				      		
				        </c:when>
				        <c:otherwise>
				        
				           <b style="display:inline-block; width:${boardVo.lvl*20}px"></b> 
				           
				           <c:choose>
				             <c:when test="${ boardVo.delboard eq 0 }">
				               <a style="font-weight: bold;" href="/Board/View?menu_id=${ map.menu_id }&submenu_id=${boardVo.submenu_id}&board_idx=${boardVo.board_idx}&nowpage=${map.nowpage}">
				             	  [답글] ${ boardVo.board_title }
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
				    <!-- 작성자 -->
				    ${ boardVo.nickname }
				    </td>
				 <td>    
				    <!-- 날짜 -->
				    ${fn:substring( boardVo.board_regdate, 0, 10) }
				    </td>
				    <td>
				    <!-- 조회수 -->
				    ${ boardVo.readcount }
				    </td>
				 </tr>  
				 </c:forEach>
			</table>
			
			<div>
				<button class="deleteButton">삭제</button>
				<!-- <button><a href="/mypage/myNoteWriteForm?board_idx=5">쪽지보내기</a></button> -->
			</div>
     	</section>
		
	     <%@include file="/WEB-INF/include/myPagePaging.jsp" %>
    </div><!-- main -->
     
</div>
</body>
</html>