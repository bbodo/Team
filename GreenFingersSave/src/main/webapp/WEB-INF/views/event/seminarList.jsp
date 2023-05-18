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
	
	
	<%@include file="/WEB-INF/include/header.jsp" %>
	<%@include file="/WEB-INF/include/subBanner.jsp" %>
	
	<div id="wrapper">
     <div id="aside">
			<ul id="sidemenu">
				<li class="sidemenuTitle">SIDEMENU</li>
				<li><a href="/Event/EventList?menu_id=${ map.menu_id }&submenu_id=SUBMENU18&nowpage=1" >이벤트</a></li>
			<li> <a href="/Winner/WinnerList?menu_id=${ map.menu_id }&submenu_id=SUBMENU19&nowpage=1">이벤트 당첨자</a></li>
			<li> <a href="/Event/SeminarList?menu_id=MENU04&submenu_id=SUBMENU21&nowpage=1">행사</a></li>
			</ul>
		</div>
     
     <div id="main">
		
     <p style="font-size: 24px; font-weight: bold; text-align: left; padding:0 0 20px 50px; margin-bottom: 10px;">${ map.submenu_name }</p>
	 
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
		<br />
	 <%@include file="/WEB-INF/include/paging.jsp" %>
     </div>
     </div>
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>