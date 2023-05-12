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
		 <%@include file="/WEB-INF/include/adminHeader.jsp" %>
     <div id="title">
     	<p>회원관리</p>
     </div>
      <div id="aside">
       <ul id="sidemenu">
			<li><a href="/Manager/Member">회원 관리</a><br /></li>
       		<li><a href="/Manager/Menu">메뉴 관리</a> <br /></li>
     		<li><a href="/Manager/subMenu"> - 하위 메뉴</a><br /></li>
     		<li><a href="/Manager/EventList">이벤트 등록</a><br /></li>
     		<li><a href="/Manager/WinnerList">당첨자 등록</a><br /></li>
     		<li><a href="/Manager/Store">상품 등록</a><br /></li>
       </ul>
     </div>
	
    <div id="main">
		<h2 style="font-size: 24px;">${ map.submenu_name }</h2>   
      <div class="right">
		<a href="/Manager/WinnerWriteForm?submenu_id=SUBMENU19&bnum=0&lvl=0&step=0&nref=0&nowpage=1">새글 작성</a>
	 </div>
		<table id="cont">
			<tr>
				<td colspan="3" style="width: 50%">
					<div style="float: left;">
			     		<h2>이벤트</h2>
			     	</div>
				</td>				
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
              <a href="/Manager/WinnerView?submenu_id=${winnerVo.submenu_id}&board_idx=${winnerVo.board_idx}&nowpage=1">
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
                <a style="font-weight: bold;" href="/Manager/EventView?menu_id=${ map.menu_id }&submenu_id=${winnerVo.submenu_id}&board_idx=${winnerVo.board_idx}&nowpage=${map.nowpage}">
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
	 관리자
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
		</table> 		
			    <%@include file="/WEB-INF/include/eventPaging.jsp" %>
     </div>    
     </div>
        <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>