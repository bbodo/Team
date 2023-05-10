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
		width: 10%;
		padding: 10px;
	}
	#main {
		width: 90%;
		height: 800px;
		float: left;
		padding: 10px;
		background-color: white;
		text-align: center;
	}
	#img1{
	    width: 80%;
		height: 150px;
		object-fit: cover;
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
     	<p>이벤트</p>
     </div>
     <div id="aside">
     	이벤트<br />
     	당첨자<br />
     </div>
     <div id="main">
		<h2 style="font-size: 24px;">${ map.submenu_name }</h2>     
      <div class="right">
		<a href="/Event/WriteForm?submenu_id=${map.submenu_id}&bnum=0&lvl=0&step=0&nref=0&nowpage=1&userid=${ sessionScope.login.userid }">새글 작성</a>
	 </div>
		<table id="cont">
			<tr>
				<td colspan="3" style="width: 50%">
					<div style="float: left;">
			     		<h2>이벤트</h2>
			     	</div>
				</td>				
			</tr>
			
			<tr>
				<th colspan="2"><a href="http://localhost:9090/Event/EventList?submenu_id=${map.submenu_id}&nowpage=1">이벤트</a></th>
				<th colspan="2"><a href="http://localhost:9090/Winner/WinnerList?submenu_id=SUBMENU19&nowpage=1">당첨자 발표</a></th>
			</tr>

		<c:forEach var="eventVo" items="${ eventList }">
	  <tr>

	  <td  colspan="2" ><img id="img1" onclick="javascript:location.href='http://localhost:9090/Event/EventView?submenu_id=${eventVo.submenu_id}&board_idx=${eventVo.board_idx}&nowpage=${map.nowpage}'"  src="D:\ws\spring\GreenFingersSaveTest\src\main\webapp\WEB-INF\resources\img\event\test"   ></td>

	     <td colspan="2" >
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
			    <%@include file="/WEB-INF/include/eventPaging.jsp" %>
     </div>       
</body>
</html>