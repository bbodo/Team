<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<title>${ map.submenu_name } 게시판</title>
</head>

<style type="text/css">
* {
	box-sizing: border-box;
}

#main {
	width: 85%;
	height: auto;
	min-height: 800px;
	float: left;
	padding: 10px;
	padding-right: 15%;
	background-color: white;
	text-align: center;
}

#tt {
	text-align: left;
}

#cont {
	background-color: #fff;
	margin: 0 auto;
	width: 90%;
	border-collapse: collapse;
	margin-bottom: 50px;
	border-bottom: 3px solid #228B22;
	border-top: 3px solid #228B22;
}

#cont th {
	background-color: white;
	border-bottom: 1px solid #C0C0C0;
	padding: 20px;
	border-top: none;
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
	font-weight: bold;
	font-size: 20px;
 }
a:hover {
	color: coral;
}

.as {
	position: relative;
}

.as:after {
	content: "";
	position: absolute;
	left: 0;
	bottom: -10px;
	width: 0px;
	height: 2px;
	margin: 5px 0 0;
	transition: all 0.2s ease-in-out;
	transition-duration: 0.3s;
	opacity: 0;
	background-color: #8fd3f4;
}

.as:hover:after {
	width: 100%;
	opacity: 1;
	$
}

#wrapper {
	min-height: 100%;
}
</style>



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
     		<li><a href="/Manager/Store">상품 등록</a><br /></li>
       </ul>
     </div>
	
    <div id="main">
		<h2 style="font-size: 24px; padding:20px;">이벤트</h2>   
		<table id="cont">
				<tr>
				<th class="padd8">번호</th>
				<th class="padd8">제목</th>
				<th class="padd8">작성자</th>
				<th class="padd8">작성일</th>
				<th class="padd8">조회수</th>
			</tr>
<c:forEach var="eventVo" items="${ eventList }">
  <tr>
     <td>
     <!-- 번호 -->
      <c:if test="${ eventVo.lvl eq 0 }">
          ${ eventVo.board_idx }
      </c:if> 
     </td>
     <td id="tt">
       <!-- 제목(새글/답글) -->
       <c:choose>
         <c:when test="${ eventVo.lvl eq 0 }">
           <c:choose>
            <c:when test="${ eventVo.delboard eq 0 }">
              <a href="/Manager/EventView?menu_id=Event&submenu_id=${eventVo.submenu_id}&board_idx=${eventVo.board_idx}&nowpage=1">
       		   <h2>${ eventVo.board_title }</h2>
       		  </a>
       		</c:when>
       		<c:otherwise>
       		   <s>삭제된 게시물 입니다</s>
       		</c:otherwise>
       	   </c:choose>	 
       		
         </c:when>
         <c:otherwise>
         
              <b style="display:inline-block; width:${eventVo.lvl*20}px"></b> 
            
            <c:choose>
              <c:when test="${ eventVo.delboard eq 0 }">
                <a style="font-weight: bold;" href="/Manager/EventView?menu_id=Event&submenu_id=${eventVo.submenu_id}&board_idx=${eventVo.board_idx}&nowpage=${map.nowpage}">
              	  [답글] ${ eventVo.board_title }
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
	 관리자
	 </td>
	 <td>
     <!-- 날짜 -->
     ${fn:substring( eventVo.board_regdate, 0, 10) }
     </td>
     <td>
     <!-- 조회수 -->
     ${ eventVo.readcount }
     </td>
  </tr>  
  </c:forEach>
		</table>
			<div class="right">
				<a href="/Manager/EventWriteForm?menu_id=Event&submenu_id=SUBMENU18&bnum=0&lvl=0&step=0&nref=0&nowpage=1"  
				style="font-size: 22px;position: absolute; right: 510px; padding: 10px;background-color: rgb(149 209 176);     color: #ffffff; border-radius: 15px;">새글작성</a>
			</div>
		</div>    
               <%@include file="/WEB-INF/include/adminEventPaging.jsp" %>
     </div>
        <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>