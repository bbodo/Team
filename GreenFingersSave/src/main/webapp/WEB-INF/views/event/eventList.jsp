<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판 양식</title>
<link rel="stylesheet" href="/css/event.css"/>
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
		height: 1500px;
		background-color: navy;
		width: 10%;
		padding: 10px;
	}
	#aside a {
        text-decoration : none;
        color: #fff;
        margin: 10px 30px;
	}
	#main {
		width: 80%;
		height: 1500px;
		float: left;
		padding: 10px;
		background-color: gray;
		text-align: center;
	}
	
	#main p {
		margin-top: 40px;
	}
	#givelist { 
        display: flex;
        gap : 30px;
        text-decoration : none;
        margin-top: 50px;
        margin-left: 340px;
    }
    .plant  { 
        margin: 0 0 15px 0;
    }
	#list {
		background-color: #fff;
	}
	#list th {
		background-color: #666;
	}
	#pointlist { 
        display: flex;
        gap : 30px;
        text-decoration : none;
        margin-top: 50px;
        margin-left: 340px;
    } 
	.tag {
		font-weight: bold;
	}
	
	#main { display: block; }
	
	img { width : 250px; 
	      height: 250px;
	}
	
	h2 {
		margin-bottom: 10px;
	}
	#cont {
		background-color: #fff;
		margin: 0 auto;
		margin-top: 50px;
		margin-bottom: 30px;
		width: 55%;
	}
	#cont th {
		background-color: #666;
	}

</style>

</head>
<body>
	 <%@include file="/WEB-INF/include/header.jsp" %>
	 
 <div id="title">
     	<p>이벤트</p>
     </div>
     <div id="aside">
     	이벤트<br />
     	당첨자<br />
     </div>
     <div id="main">
		<table id="cont">
			<tr>
				<td colspan="3" style="width: 50%">
					<div style="float: left;">
			     		<h2>이벤트</h2>
			     	</div>
				</td>
				<td style="width: 50%">
					<div style="float: right;">
			     		총 X개 &nbsp;&nbsp;
			     		<input type="text" placeholder="검색"/> &nbsp;&nbsp;
		     		<a href="">돋보기버튼</a>
     				</div>
				</td>
			</tr>
			<tr>
				<th colspan="2"><a href="eventList">이벤트</a></th>
				<th colspan="2"><a href="/winnerList">당첨자 발표</a></th>
			</tr>

		<c:forEach var="eventVo" items="${ eventList }">
	  <tr>

	  <td class="product-img-div" colspan="2" ><img onclick="javascript:location.href='http://localhost:9090/eventView'"  src="/img/event/test.png" class="product-img"  ></td>

	     <td colspan="2">
	       <!-- 제목(새글/답글) -->
	       <c:choose>
	         <c:when test="${ eventVo.lvl eq 0 }">
	           <c:choose>
	            <c:when test="${ eventVo.delboard eq 0 }">
	              <a href="/Event/View?submenu_id=${eventVo.submenu_id}&board_idx=${eventVo.board_idx}&nowpage=${map.nowpage}">
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
	                <a href="/Event/View?submenu_id=${eventVo.submenu_id}&board_idx=${eventVo.board_idx}&nowpage=${map.nowpage}">
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
			    <%@include file="/WEB-INF/include/paging.jsp" %>
     </div>   
     <%@include file="/WEB-INF/include/footer.jsp" %>    
</body>
</html>