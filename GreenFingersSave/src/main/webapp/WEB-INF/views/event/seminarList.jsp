<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<title>${ map.submenu_name } 게시판</title>

<style type="text/css">


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
     <!-- <div id="title">
     	<p style="font-size: 40px; font-weight: bold;">식물 연합</p>
     </div> -->
	<%@include file="/WEB-INF/include/subBanner.jsp" %>
	
	<div id="wrapper">
     <div id="aside">
     	<ul id="sidemenu">
     	<li class="sidemenuTitle">SIDEMENU</li>
     	<c:forEach var="menu" items="${ submenuList }">
     		<c:choose>
			<c:when test="${menu.menu_id eq map.menu_id }">
				<li><a href="/Board/List?menu_id=${ menu.menu_id }&submenu_id=${menu.submenu_id}&nowpage=1">
						${menu.submenu_name}</a></li>
			</c:when>
			</c:choose>
     	</c:forEach>
     	</ul>
     </div>
     
     <div id="main">
		
     <div class="right" style="padding: 20px; padding-right: 80px;">
		<a class="as" href="/Board/WriteForm?menu_id=${ map.menu_id }&submenu_id=${ boardVo.submenu_id }&bnum=0&lvl=0&step=0&nref=0&nowpage=1&userid=${ sessionScope.login.userid }">새글 작성</a>
	 </div>
	 
		<table id="cont">
			<tr>
				<th class="padd8">번호</th>
				<th class="padd8">제목</th>
				<th class="padd8">작성자</th>
				<th class="padd8">작성일</th>
				<th class="padd8">조회수</th>
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
              <a href="/Event/SeminarView?menu_id=${ map.menu_id }&submenu_id=${boardVo.submenu_id}&board_idx=${boardVo.board_idx}&nowpage=${map.nowpage}">
       		   <h2>${ boardVo.board_title }</h2>
       		  </a>
       		</c:when>
       		
       		<c:otherwise>
       		   <s>삭제된 게시물 입니다</s>
       		</c:otherwise>
       	   </c:choose>	 
       		
         </c:when>
         <%-- <c:otherwise>
         
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
         	
         </c:otherwise> --%>
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
     <%-- <td>
     <!-- 첨부파일수 -->
     <c:choose>
       <c:when test="${ boardVo.filescount eq 0 }">
         &nbsp;
       </c:when>
       <c:otherwise>
         ${ boardVo.filescount }         
       </c:otherwise>
     </c:choose>
     </td> --%>
  </tr>  
  </c:forEach>
		</table>
		<br />
	 <%@include file="/WEB-INF/include/paging.jsp" %>
     </div>
     </div>
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>