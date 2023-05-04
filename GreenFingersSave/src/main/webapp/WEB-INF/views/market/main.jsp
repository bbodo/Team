<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판 양식</title>

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
		width: 20%;
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
     	<p>그린마켓</p>
     </div>
     <div id="aside">
     	<a href="/Market/List?submenu_id=SUBMENU15&nowpage=1">입양원해요</a><br />
     	<a href="/Market/List?submenu_id=SUBMENU16&nowpage=1">나눔합니다</a><br />
     	<a href="/Market/List?submenu_id=SUBMENU17&nowpage=1">포인트 스토어</a><br />
     </div>
     <div id="main">
     
     <p>그린핑거는 회원 간의 상품 거래 정보 및 거래에<br>
     관여하지 않으며 어떠한 의무와 책임도 부담하지 않습니다</p>
     
     <div id="givelist">
      <figure>
      <a href="/Market/View?submenu_id=SUBMENU16&board_idx=20">
     <div class="plant">
	     <img src="/img/market/그린마켓1.png" >
	  </div>
	  </a>
	     <span class="tag">나눔</span>
	     <p>루브라 나눔합니다</p>
	  </figure>
      <figure>
      <a href="/Market/View?submenu_id=SUBMENU16&board_idx=21">
     <div class="plant">
	     <img src="/img/market/그린마켓2.png" >
	  </div>
	  </a>
	     <span class="tag">나눔</span>
	     <p>제라늄 데려가실 분</p>
	  </figure>
      <figure>
      <a href="/Market/View?submenu_id=SUBMENU16&board_idx=22">
     <div class="plant">
	     <img src="/img/market/그린마켓3.png">
	  </div>
	  </a>
	     <span class="tag">나눔</span>
	     <p>유니플로라 데려가세요</p> 
	  </figure>
	</div>
	
    <table id="cont">
		<caption><h2>입양원해요</h2></caption>
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
      <a href="">
     <div class="plant">
	     <img src="/img/market/포인트스토어1.jpg" >
	  </div>
	  </a>
	     <span class="tag">3000p</span>
	     <p>귀여운 코끼리 물뿌리개</p>
	  </figure>
      <figure>
      <a href="">
     <div class="plant">
	     <img src="/img/market/포인트스토어2.jpg" >
	  </div>
	  </a>
	     <span class="tag">4500p</span>
	     <p>파쯔파쯔 국내생산 흙</p>
	  </figure>
      <figure>
      <a href="">
     <div class="plant">
	     <img src="/img/market/포인트스토어3.jpg">
	  </div>
	  </a>
	     <span class="tag">1800p</span>
	     <p>원예 모종삽 3종세트</p> 
	  </figure>
	 </div>	
		
     </div>
     
     
     <%@include file="/WEB-INF/include/footer.jsp" %>
     
</body>
</html>