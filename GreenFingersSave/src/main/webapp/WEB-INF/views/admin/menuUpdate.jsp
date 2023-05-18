<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<%@include file="/WEB-INF/include/adminHeader.jsp" %>
<title>메뉴 관리</title>

<style type="text/css">
	* {
		box-sizing: border-box;
	} 
	#main {
		width: 85%;
		height: 800px;
		float: left;
		padding: 10px;
		background-color: white;
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
	.input_row {
	    position: relative;
	    display: block;
	    height: 100%;
	    border: 1px solid #dadada;
	    padding: 16px 18px 15px;
	    border-radius: 30px;
	    box-sizing: border-box;
	    text-align: left;
	    box-shadow: 0 2px 6px 0 rgba(68,68,68,.08);
	    width: 50%;
	    margin: 0 auto;
	    margin-bottom: 25px;
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
	.regbtn {
	background-color: #44c767;
    color: #ffffff;
    font-size: 15px;
    font-weight: bold;
    margin: 30px 0;
    width: 50%;
    height: 60px;
    text-decoration: none;
    border: none;
    border-radius: 30px;
	}
	.regbtn:hover {
		background-color:#5cbf2a;
	}
	.regbtn:active {
		position:relative;
		top:1px;
	}
</style>
<script type="text/javascript">

	function gohome() {
		location.replace("/Manager/Menu?menu_id=Menu");		
	}

</script>
</head>
<body>
<%@include file="/WEB-INF/include/adminsubBanner.jsp" %>
    <div id="wrapper">
    <div id="aside">
       <ul id="sidemenu">
			<li class="sidemenuTitle">SIDEMENU</li>
			<li><a href="/Manager/Member?menu_id=Member">회원 관리</a><br /></li>
       		<li><a href="/Manager/Menu?menu_id=Menu">메뉴 관리</a> <br /></li>
     		<li><a href="/Manager/subMenu?menu_id=subMenu"> - 하위 메뉴</a><br /></li>
     		<li><a href="/Manager/EventList?menu_id=Event&nowpage=1">이벤트 관리</a><br /></li>
     		<li><a href="/Manager/WinnerList?menu_id=Winner&nowpage=1">당첨자관리</a><br /></li>
     		<li><a href="/Manager/SeminarList?menu_id=Festival&submenu_id=SUBMENU21&nowpage=1">행사 관리</a></li>
     		<li><a href="/Manager/Store?menu_id=Store">상품 등록</a><br /></li>
       </ul>
     </div>
     <div id="main">
     	<form action="/Manager/menuUpdate" method="POST">
     	<div class="findid_wrap">
     			<h2>메뉴 ID</h2>
				<div class="input_row">
					<input type="text" name="menu_id" id="menu_id" value="${ map.menu_id1 }" style="border: none; font-size: 25px; width: 100%;"/>
				</div>
     			<h2>메뉴 이름</h2>
				<div class="input_row">
					<input type="text" name="menu_name" id="menu_name" value="${ map.menu_name }" style="border: none; font-size: 25px; width: 100%;"/>
				</div>
     			<h2>메뉴 순서 </h2>
				<div class="input_row">
					<input type="text" name="menu_seq" id="menu_seq" value="${ map.menu_seq }" style="border: none; font-size: 25px; width: 100%;"/>
				</div>
		</div>
			<input type="submit" value="수정" class="regbtn"/>
			<input type="button"  class="regbtn" value="취소" onclick=gohome(); />
		</form>
     </div>
     </div>
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>