<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<title>그린마켓 메인</title>

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
	#main {
		width: 80%;
		min-height: 1500px;
		height: auto;
		float: left;
		padding: 10px;
		background-color: white;
		text-align: center;
	}
	
	#main p {
		margin-top: 40px;
		margin-bottom: 30px;
	}
	
	#givelist { 
        display: flex;
        gap : 30px;
        text-decoration : none;
        margin-top: 20px; 
		justify-content: center;        
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
        margin-top: 20px; 
         justify-content: center;
    } 
    
	.tag {
		font-weight: bold;
	}
	
	
	#main { display: block; }
	

	.mainimg {
		width : 250px; 
	    height: 250px;
	}
	
	h2 {
		font-size: 24px;
		margin-bottom: 10px;
		margin-top: 20px;
	}
	#cont {
		background-color: #fff;
		padding: 10px;
		margin: 0 auto;
		margin-bottom: 50px;
		width: 65%;
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
	 <%@include file="/WEB-INF/include/subBanner.jsp"%>
	 
    <!-- <div id="title">
     	<p style="font-size: 40px; font-weight: bold;">그린마켓</p>
     </div> -->
     
    <div id="wrapper">
     <div id="aside">
      <ul id="sidemenu">
      <li class="sidemenuTitle">SIDEMENU</li>
     	<li><a href=/Market/List?menu_id=MENU03&submenu_id=SUBMENU15&nowpage=1>입양원해요</a></li>
     	<li><a href="/Market/List?menu_id=MENU03&submenu_id=SUBMENU16&nowpage=1">나눔합니다</a></li>
     	<li><a href="/Market/List?menu_id=MENU03&submenu_id=SUBMENU17&nowpage=1">포인트 스토어</a></li>
     	</ul>
     </div>
     
     <div id="main">
     
     <p>그린핑거는 회원 간의 상품 거래 정보 및 거래에<br>
     관여하지 않으며 어떠한 의무와 책임도 부담하지 않습니다</p>
     
     <caption><h2>나눔</h2></caption>
     <div id="givelist">
      <figure>
      <a href="/Market/View?menu_id=MENU03&submenu_id=SUBMENU16&board_idx=80&nowpage=1">
     <div class="plant">
	     <img class="mainimg" src="/img/market/그린마켓1.png" >
	  </div>
	  </a>
	    <!--  <span class="tag">나눔</span> -->
	     <p>루브라 나눔합니다</p>
	  </figure>
      <figure>
      <a href="/Market/View?menu_id=MENU03&submenu_id=SUBMENU16&board_idx=82&nowpage=1">
     <div class="plant">
	     <img class="mainimg" src="/img/market/그린마켓2.png" >
	  </div>
	  </a>
	     <p>제라늄 데려가실 분</p>
	  </figure>
      <figure>
      <a href="/Market/View?menu_id=MENU03&submenu_id=SUBMENU16&board_idx=83&nowpage=1">
     <div class="plant">
	     <img class="mainimg" src="/img/market/그린마켓3.png">
	  </div>
	  </a>
	     <p>유니플로라 데려가세요</p> 
	  </figure>
	</div>
	
    <table id="cont">
		<h2 style="font-size: 24px;">입양</h2>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성일</th>
			<th>작성자</th>
			<th>조회수</th>
		</tr>
		
		<c:forEach var="marketVo" items="${ marketList }">
	  <tr>
	     <td>
	     <!-- 번호 -->
	      <c:if test="${ marketVo.lvl eq 0 }">
	          ${ marketVo.board_idx }
	      </c:if> 
	     </td>
	     <td>
	       <!-- 제목(새글/답글) -->
	       <c:choose>
	         <c:when test="${ marketVo.lvl eq 0 }">
	           <c:choose>
	            <c:when test="${ marketVo.delboard eq 0 }">
	              <a href="/Market/View?submenu_id=${marketVo.submenu_id}&board_idx=${marketVo.board_idx}&nowpage=${map.nowpage}">
	       		   ${ marketVo.board_title }
	       		  </a>
	       		</c:when>
	       		<c:otherwise>
	       		   <s>삭제된 게시물 입니다</s>
	       		</c:otherwise>
	       	   </c:choose>	 
	       		
	         </c:when>
	         <c:otherwise>
	         
	            <b style="display:inline-block; width:${marketVo.lvl*20}px"></b> 
	            
	            <c:choose>
	              <c:when test="${ marketVo.delnum eq 0 }">
	                <a href="/Market/View?submenu_id=${marketVo.submenu_id}&board_idx=${marketVo.board_idx}&nowpage=${map.nowpage}">
	              	  [답글] ${ marketVo.board_title }
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
	     ${fn:substring( marketVo.board_regdate, 0, 10) }
	     </td>
		 <td>    
	     <!-- 작성자 -->
	     ${ marketVo.nickname }
	     </td>
	     <td>
	     <!-- 조회수 -->
	     ${ marketVo.readcount }
	     </td>
	  </tr>  
	  </c:forEach>
		</table> 
	
	  <caption><h2>포인트 스토어</h2></caption>	
	  <div id="pointlist">
      <figure>
      <a href="/Market/View?submenu_id=SUBMENU17&board_idx=107&nowpage=1">
     <div class="plant">
	     <img class="mainimg" src="/img/market/포인트스토어1.jpg" >
	  </div>
	  </a>
	     <span class="tag">3000p</span>
	     <p>귀여운 코끼리 물뿌리개</p>
	  </figure>
      <figure>
      <a href="/Market/View?submenu_id=SUBMENU17&board_idx=108&nowpage=1">
     <div class="plant">
	     <img class="mainimg" src="/img/market/포인트스토어2.jpg" >
	  </div>
	  </a>
	     <span class="tag">4500p</span>
	     <p>파쯔파쯔 국내생산 흙</p>
	  </figure>
      <figure>
      <a href="/Market/View?submenu_id=SUBMENU17&board_idx=112&nowpage=1">
     <div class="plant">
	     <img class="mainimg" src="/img/market/포인트스토어3.jpg">
	  </div>
	  </a>
	     <span class="tag">1800p</span>
	     <p>원예 모종삽 3종세트</p> 
	  </figure>
	 </div>	
		
     </div>
    </div> <!-- wrapper end  -->
     <%@include file="/WEB-INF/include/footer.jsp" %>
     
</body>
</html>