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
	/*css common 으로 이동*/
	/* * {
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
		height: auto;
		background-color: white;
		width: 15%;
		padding: 10px;
		float: left;
	}
	#main {
		width: 85%;
		height: 900px;
		padding: 10px;
		padding-right: 15%;
		background-color: white;
		text-align: center;
		display: inline-block;
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
	.left {
		text-align: left;
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
	#wrapper {
		margin-top: 30px;
	} */
	

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
     <!-- <div id="title">
     	<p style="font-size: 40px; font-weight: bold;">식물 연합</p>
     </div> -->
	<%@include file="/WEB-INF/include/subBanner.jsp" %>
	<div id="wrapper">
     <div id="aside">
     	<ul id="sidemenu">
     	<li class="sidemenuTitle">SIDEMENU</li>
     	<c:forEach var="menu" items="${ submenuList }">
     		<c:choose>
			<c:when test="${menu.menu_id eq map.menu_id }">
				<li><a href="/Board/List?menu_id=${ menu.menu_id }&submenu_id=${menu.submenu_id}&nowpage=1">
						${menu.submenu_name}</a></li>
			</c:when>
			</c:choose>
     	</c:forEach>
     	</ul>
     </div>
     <div id="main">
		<p style="font-size: 24px; font-weight: bold; text-align: left; padding-left: 50px; margin-bottom: 10px;">${ map.submenu_name }</p>
		<c:choose>
			<c:when test="${ map.submenu_name eq '포이즌' }">
				<p class="left" style="padding-left: 50px;">독성을 가진 천남성과 식물을 키웁니다. <br />
				나를 지키기 위한 독이에요. 먼저 건들지 않으면 해치지 않아요.</p>
			</c:when>
			<c:when test="${ map.submenu_name eq '이파리' }">
				<p class="left" style="padding-left: 50px;">어쩌다 잎보기 식물을 키웁니다 <br />
				아름다운 잎의 매력에 빠져보세요.</p>
			</c:when>
			<c:when test="${ map.submenu_name eq '플라워' }">
				<p class="left" style="padding-left: 50px;">꽃보기가 주력인 식물을 키웁니다. <br />
				꿀벌이 좋아하는 식물 연합입니다.</p>
			</c:when>
			<c:when test="${ map.submenu_name eq '우드' }">
				<p class="left" style="padding-left: 50px;">나무를 키웁니다. <br />
				야자수, 대나무 등은 매우 크게 자라지만 나무가 아닙니다.
				유사품에 주의하세요.</p>
			</c:when>
			<c:when test="${ map.submenu_name eq '열매' }">
				<p class="left" style="padding-left: 50px;">유실수를 키웁니다. <br />
				식용 열매를 수확할 수 있는 식물 연합입니다.</p>
			</c:when>
			<c:when test="${ map.submenu_name eq '허브' }">
				<p class="left" style="padding-left: 50px;">향기로운 식물을 키웁니다. <br />
				조미료로 사용하거나 요리에 고명으로 얹을 수 있습니다.</p>
			</c:when>
			<c:when test="${ map.submenu_name eq '사막' }">
				<p class="left" style="padding-left: 50px;">가뭄을 잘 견딥니다. <br />
				오랫동안 물이 없어도 견디는 식물 연합입니다.</p>
			</c:when>
			<c:when test="${ map.submenu_name eq '습지' }">
				<p class="left" style="padding-left: 50px;">습한 환경에서 태어났습니다. <br />
				습한 곳에 살더라도 햇빛은 필수입니다.</p>
			</c:when>
			<c:when test="${ map.submenu_name eq '채소' }">
				<p class="left" style="padding-left: 50px;">먹는 것에 진심입니까? <br />
				그래도 사랑해주세요.</p>
			</c:when>
			<c:when test="${ map.submenu_name eq '불법 단체' }">
				<p class="left" style="padding-left: 50px;">우리는 투쟁합니다. <br />
				연합에 들지 못한 소모임/단체입니다.</p>
			</c:when>
			<c:when test="${ map.submenu_name eq '꿀팁' }">
				<p class="left" style="padding-left: 50px;">윙윙~ 소리안들리나요? <br />
				꿀보다 달달한 꿀팁 들여가세요.</p>
			</c:when>
			<c:when test="${ map.submenu_name eq 'Q&A' }">
				<p class="left" style="padding-left: 50px;">궁금한 사람 손 ! <br />
				문제를 GreenFingers와 함께 해결해보세요</p>
			</c:when>
			<c:when test="${ map.submenu_name eq '자유' }">
				<p class="left" style="padding-left: 50px;">어제 그거봤어?<br />
				자유로운 주제로 소통해요.</p>
			</c:when>
			<c:when test="${ map.submenu_name eq '초록별' }">
				<p class="left" style="padding-left: 50px;">삼가 초목의 명복을 빕니다.<br />
				초록별로 떠난 우리 아기들을 추모해요.</p>
			</c:when>
		</c:choose>
     <div class="right" style="padding: 20px; padding-right: 80px;">
		<a class="as" href="/Board/WriteForm?menu_id=${ map.menu_id }&submenu_id=${ boardVo.submenu_id }&bnum=0&lvl=0&step=0&nref=0&nowpage=1&userid=${ sessionScope.login.userid }">새글 작성</a>
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
              <a href="/Board/View?menu_id=${ map.menu_id }&submenu_id=${boardVo.submenu_id}&board_idx=${boardVo.board_idx}&nowpage=${map.nowpage}">
       		   <h2>${ boardVo.board_title }</h2>
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
                <a style="font-weight: bold;" href="/Board/View?menu_id=${ map.menu_id }&submenu_id=${boardVo.submenu_id}&board_idx=${boardVo.board_idx}&nowpage=${map.nowpage}">
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
	 <%@include file="/WEB-INF/include/paging.jsp" %>
     </div>
     </div>
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>