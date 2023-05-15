<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<title>${ map.submenu_name } 게시판</title>
</head>

<style>

.right{
	width:90%;
	margin:0 auto 20px auto;
}
.tableList tr td:hover {
	background-color: #D3D3D3;
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
   
	 <%@include file="/WEB-INF/include/subBanner.jsp" %>
	 
	<div id="wrapper"> 
	
	<div id="aside">
		<ul id="sidemenu">
     	<li class="sidemenuTitle">SIDEMENU</li>
			<li><a href="/Event/EventList?menu_id=${ map.menu_id }&submenu_id=SUBMENU18&nowpage=1" >이벤트</a></li>
			<li> <a href="/Winner/WinnerList?menu_id=${ map.menu_id }&submenu_id=SUBMENU19&nowpage=1">이벤트 당첨자</a></li>
		</ul>
	</div>
     <div id="main">
		<h2 style="font-size: 24px;">${ map.submenu_name }</h2>     
		<table id="cont">
					<tr>
				<th colspan="2"><a href="http://localhost:9090/Event/EventList?submenu_id=SUBMENU18&nowpage=1">이벤트</a></th>
				<th colspan="3"><a href="http://localhost:9090/Winner/WinnerList?submenu_id=SUBMENU19&nowpage=1">당첨자</a></th>
			</tr>
		
			<tr>
				<th class="padd8">번호</th>
				<th class="padd8">제목</th>
				<th class="padd8">작성자</th>
				<th class="padd8">작성일</th>
				<th class="padd8">조회수</th>
			</tr>
<c:forEach var="winnerVo" items="${ winnerList }">
  <tr>
     <td>
     <!-- 번호 -->
      <c:if test="${ winnerVo.lvl eq 0 }">
          ${ winnerVo.board_idx }
      </c:if> 
     </td>
     <td id="tt">
       <!-- 제목(새글/답글) -->
       <c:choose>
         <c:when test="${ winnerVo.lvl eq 0 }">
           <c:choose>
            <c:when test="${ winnerVo.delboard eq 0 }">
              <a href="/Winner/WinnerView?menu_id=${ map.menu_id }&submenu_id=${winnerVo.submenu_id}&board_idx=${winnerVo.board_idx}&nowpage=${map.nowpage}">
       		   <h2>${ winnerVo.board_title }</h2>
       		  </a>
       		</c:when>
       		<c:otherwise>
       		   <s>삭제된 게시물 입니다</s>
       		</c:otherwise>
       	   </c:choose>	 
       		
         </c:when>
         <c:otherwise>
         
            <b style="display:inline-block; width:${winnerVo.lvl*20}px"></b> 
            
         	
         </c:otherwise>
       </c:choose>
     </td>
     <td>
     <!-- 작성자 -->
     ${ winnerVo.nickname }
     </td>
	 <td>    
     <!-- 날짜 -->
     ${fn:substring( winnerVo.board_regdate, 0, 10) }
     </td>
     <td>
     <!-- 조회수 -->
     ${ winnerVo.readcount }
     </td>
 
  </tr>  
  </c:forEach>
		</table>
	    	<%@include file="/WEB-INF/include/winnerPaging.jsp" %>
     </div>
     </div>
          <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>