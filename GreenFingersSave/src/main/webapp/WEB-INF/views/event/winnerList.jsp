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
		height: 800px;
		background-color: white;
		width: 15%;
		padding: 10px;
	}
	#main {
		width: 85%;
		height: 800px;
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
	.right {
		text-align: right;
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
     <div id="title">
     	<p style="font-size: 40px; font-weight: bold;">당첨자</p>
     </div>
     <div id="aside">
     	<ul id="sidemenu">
     	<c:forEach var="menu" items="${ submenuList }">
     		<c:choose>
			<c:when test="${menu.menu_id eq map.menu_id }">
				<li><a href="/Winner/WinnerList?menu_id=${ menu.menu_id }&submenu_id=${menu.submenu_id}&nowpage=1">
						${menu.submenu_name}</a></li>
			</c:when>
			</c:choose>
     	</c:forEach>
     	</ul>
     </div>
     <div id="main">
		<h2 style="font-size: 24px;">${ map.submenu_name }</h2>     
     <div class="right" style="padding: 20px; padding-right: 80px;">
		<a class="as" style="font-size: 20px;" href="/Winner/WriteForm?menu_id=${ map.menu_id }&submenu_id=${ map.submenu_id }&bnum=0&lvl=0&step=0&nref=0&nowpage=1&userid=${ sessionScope.login.userid }">새글 작성</a>
	 </div>
		<table id="cont">
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
            
            <c:choose>
              <c:when test="${ winnerVo.delboard eq 0 }">
                <a style="font-weight: bold;" href="/Event/View?menu_id=${ map.menu_id }&submenu_id=${winnerVo.submenu_id}&board_idx=${winnerVo.board_idx}&nowpage=${map.nowpage}">
              	  [답글] ${ winnerVo.board_title }
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
	    	<%@include file="/WEB-INF/include/winnerPaging.jsp" %>
     </div>
</body>
</html>