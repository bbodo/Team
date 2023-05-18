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

#main {
	padding-right: 0;
	}

</style>

</head>
<body>
	<!-- header	 -->
	
	
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
     		<li><a href="/Manager/SeminarList?menu_id=Festival&submenu_id=SUBMENU21&nowpage=1">행사 관리</a></li>
     		<li><a href="/Manager/Store?menu_id=Store">스토어 관리</a><br /></li>
       </ul>
     </div> 
     <div id="main">
     <p style="font-size: 24px; font-weight: bold; text-align: left; padding:0 0 20px 50px; margin-bottom: 10px;">${ map.submenu_name }</p>
	 <div class="right" style="padding: 20px; padding-right: 80px;">
		<a class="as" href="/Manager/SeminarWriteForm?menu_id=Festival&submenu_id=SUBMENU21&nowpage=1&manager_code=${ sessionScope.managerlogin.managercode }">새글 작성</a>
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
              <a href="/Manager/SeminarView?menu_id=${ map.menu_id }&submenu_id=${boardVo.submenu_id}&board_idx=${boardVo.board_idx}&nowpage=${map.nowpage}">
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
	 <%@include file="/WEB-INF/include/adminSeminarPaging.jsp" %>
     </div>
     </div>
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>