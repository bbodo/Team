 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<title>포인트 스토어 결제 내역</title>

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
		height: 1200px;
		background-color: white;
		width: 15%;
		padding: 10px;
	}
	#main {
		width: 85%;
		height: 1200px;
		float: left;
		padding: 10px;
		padding-right : 15%;
		background-color: white;
	}
	#cont {
		background-color: #fff;
		margin: 0 auto;
		width: 100%;
		border-collapse: collapse;
		margin-top: 10px;
		border-top: 3px solid #228B22;
	}
	#cont tr td {
		padding: 15px;
		border-bottom: 1px solid #C0C0C0;
	} 
	#cont tr:nth-of-type(2) {
		border-bottom: 1px solid #228B22;
	}
	#board_title {
		font-size: 32px;
		font-weight: bold;
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
	
	input[type=text] {
		width: 100%;
		padding: 5px;
	}
	textarea {
		width: 100%;
		height: 400px;
		padding: 20px;
	}
	.btn {
		margin-top : 30px;
		text-align: center;
	}
	#storename {
		font-size: 25px;
		font-weight: bold;
		margin-top: 50px;
		margin-bottom: 20px;
	}

</style>

<script src="https://code.jquery.com/jquery.min.js"></script>

</head>
<body>
	  <!-- header -->
	 <c:choose>
		<c:when test="${ sessionScope.login eq null }">
			<%@include file="/WEB-INF/include/header.jsp" %>
		</c:when>
		<c:otherwise>
			<%@include file="/WEB-INF/include/header2.jsp" %>
		</c:otherwise>
	</c:choose>
	
     <div id="title">
     	<p style="font-size: 40px; font-weight: bold;">그린마켓</p>  
     </div>
     <div id="aside">
      <ul id="sidemenu">
     	<li><a href="/Market/List?submenu_id=SUBMENU15&nowpage=1">입양원해요</a></li>
     	<li><a href="/Market/List?submenu_id=SUBMENU16&nowpage=1">나눔합니다</a></li>
     	<li><a href="/Market/List?submenu_id=SUBMENU17&nowpage=1">포인트 스토어</a></li>
     </ul>
     </div>
     <div id="main">
     
     <form action="/Market/PointPay" method="POST" 
       enctype="multipart/form-data"   >  
       
	  <input type="hidden"  name="board_idx"  value="${ map.board_idx  }" />
	  <input type="hidden"  name="submenu_id" value="${ map.submenu_id }" />
	  <input type="hidden"  name="bnum"       value="${ map.bnum       }" />
	  <input type="hidden"  name="lvl"        value="${ map.lvl        }" />
	  <input type="hidden"  name="step"       value="${ map.step       }" />
	  <input type="hidden"  name="nref"       value="${ map.nref       }" /> 
	  <input type="hidden"  name="parent"     value="${ map.board_idx  }" /> 
	  <input type="hidden"  name="nowpage"    value="${ map.nowpage    }" /> 
     
     
		<div id="storename">스토어 상세 결제창</div>
     
		<table id="cont">
			<tr>
				<td style="text-align: center;">상품명</td>
				<td name="board_title">${ marketVo.board_title }</td>
			</tr>
			<tr>
				<td style="text-align: center;">수량</td>
				<td name="transaction_su">
				<label for="selectAmount1">1개</label>
	               	<input type="radio" name="amount" value="1" id="selectAmount1" checked />
	    			<label for="selectAmount2">2개</label>
	               	<input type="radio" name="amount" value="2" id="selectAmount2" />
	               	<label for="selectAmount3">3개</label>
	               	<input type="radio" name="amount" value="3" id="selectAmount3" />
				</td>
			</tr>
			<tr>
				<td style="text-align: center;">상품 금액</td>
				<td>calc(${ marketVo.market_value }*2)</td>
			</tr>
			<tr>
				<td style="text-align: center;">배송비</td>
				<td>2500</td>
			</tr>
			<tr>
				<td style="text-align: center;">총 결제 포인트</td>
				<td name="point"></td>
			</tr>
			
			
		</table>
		<div class="btn">
		<input type="submit" value="결제" />
		</div>
	  </form>
     </div>
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>