<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<title>홈</title>

<style type="text/css">

.button {
	width: 300px;
    height: 100px;
    margin-bottom: 20px;
	background-color: #d0e385;
	cursor: pointer;
	border: none;
	border-radius: 4px;
	box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
	display: inline-block;
    line-height: 100px;
}
.button:hover {
	background-color: #4da865;
	color:#fff;
	text-decoration: none;
}
#wrapper {

	text-align: center

}

</style>

</head>
<body>
<div id="wrapper">
	<h2>관리자 페이지</h2>
	<table style="margin: 0 auto; margin-top: 20px;">
		<tr>
			<td>
				<a href="/Manager/Member?menu_id=Member" class="button">회원 관리</a>
				<a href="/Manager/Menu?menu_id=Menu" class="button">메뉴 관리</a>
			</td>
		</tr>
		<tr>
			<td>
				<a href="/Manager/EventList?menu_id=Event&nowpage=1" class="button">이벤트 관리</a>
				<a href="/Manager/WinnerList?menu_id=Winner&nowpage=1" class="button">당첨자 관리</a>
			</td>
		</tr>
		<tr>
			<td>
				<a href="/Manager/SeminarList?menu_id=Festival&submenu_id=SUBMENU21&nowpage=1"" class="button">행사 관리</a>
				<a href="/Manager/Store?menu_id=Store" class="button">상품 등록</a>
			</td>
		</tr>
	</table>
  </div>
	
  <!-- footer -->

  <!-- Swiper JS -->
  <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
 
</body>
</html>