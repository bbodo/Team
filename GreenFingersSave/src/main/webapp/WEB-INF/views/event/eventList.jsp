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

<style>
#img1{
	    width: 60%;
		height: 150px;
	}
.right{
	width:90%;
	margin:0 auto 20px auto;
}
.tableList tr td:hover {
	background-color: #D3D3D3;
}

</style>

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
				<td colspan="3" style="width: 50%">
					<div style="float: left;">
			     		<h2>이벤트</h2>
			     	</div>
				</td>				
			</tr>
			
			<tr>
				<th colspan="4"><a href="http://localhost:9090/Event/EventList?submenu_id=${map.submenu_id}&nowpage=1">이벤트</a></th>
				<th colspan="4"><a href="http://localhost:9090/Winner/WinnerList?submenu_id=SUBMENU19&nowpage=1">당첨자</a></th>
			</tr>

		<c:forEach var="eventVo" items="${ eventList }">
	  <tr>
	  
	  <td  colspan="3" >
	         <c:forEach var="file"  items="${ fileList }" >         
	  <c:if test="${ eventVo.board_idx == file.board_idx}">
	  
				 <div>
					<img id="img1" src="/upload/${ file.sfilename }" onclick="javascript:location.href='http://localhost:9090/Event/EventView?submenu_id=${eventVo.submenu_id}&board_idx=${eventVo.board_idx}&nowpage=${map.nowpage}'" >
				 </div>
            
					</c:if>
            </c:forEach>    
             <td colspan="3" >
	       <!-- 제목(새글/답글) -->
	       <c:choose>
	         <c:when test="${ eventVo.lvl eq 0 }">
	           <c:choose>
	            <c:when test="${ eventVo.delboard eq 0 }">
	              <a href="/Event/EventView?submenu_id=${eventVo.submenu_id}&board_idx=${eventVo.board_idx}&nowpage=${map.nowpage}">
	       		   ${ eventVo.board_title }
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
	              <c:when test="${ eventVo.delnum eq 0 }">
	                <a href="/Event/EventView?submenu_id=${eventVo.submenu_id}&board_idx=${eventVo.board_idx}&nowpage=${map.nowpage}">
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
	   
	  </tr>  
	  </c:forEach>
		</table> 		
			    <%@include file="/WEB-INF/include/adminEventPaging.jsp" %>
     </div>    
     </div>
        <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>