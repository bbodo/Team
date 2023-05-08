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
		background-color: navy;
		width: 20%;
		padding: 10px;
	}
	#main {
		width: 80%;
		height: 800px;
		float: left;
		padding: 10px;
		background-color: gray;
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
		background-color: #666;
	}
	#cont tr {
		border-bottom: 
	}
	#cont tr:hover {
		background-color: #D3D3D3;
	}
	.right {
		text-align: right;
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
     	<div>식물 연합</div>
     </div>
     <div id="aside">
     	포이즌<br />
     	포이즌<br />
     	포이즌<br />
     	포이즌<br />
     	포이즌<br />
     	포이즌<br />
     </div>
     <div id="main">
		<h2>${ map.submenu_name }</h2>     
     <div class="right">
		<a href="/Board/WriteForm?submenu_id=SUBMENU01&bnum=0&lvl=0&step=0&nref=0&nowpage=1&userid=${ sessionScope.login.userid }">새글 작성</a>
	 </div>
		<table id="cont">
			<tr>
				<th class="padd8">번호</th>
				<th class="padd8">제목</th>
				<th class="padd8">작성일</th>
				<th class="padd8">작성자</th>
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
              <a href="/Board/View?submenu_id=${boardVo.submenu_id}&board_idx=${boardVo.board_idx}&nowpage=${map.nowpage}">
       		   ${ boardVo.board_title }
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
                <a href="/Board/View?submenu_id=${boardVo.submenu_id}&board_idx=${boardVo.board_idx}&nowpage=${map.nowpage}">
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
     <!-- 작성일 -->
     <!-- 날짜 -->
     ${fn:substring( boardVo.board_regdate, 0, 10) }
     </td>
	 <td>    
     <!-- 작성자 -->
     ${ boardVo.nickname }
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
	    	<%@include file="/WEB-INF/include/paging.jsp" %>
     </div>
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>