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
<title>그린 위키</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>

	#title {
		width: 100%;
		text-align: center;
		height: 100px;
		background-color: orange;
	}
	#title p {
		 line-height: 100px;
	}
	#div1 { margin: 20px; width: 800px;}
    .box { display: flex;
    	margin: 20px;}
    #btn1Ok { width: 100px;}     
	#plantimg {
		  width: 400px;
		  height: 300px;
		  object-fit: cover;
	}
</style>
<script>
	function data_display(data) {
		console.log(data);
		let body = data.response.body;
		let totalCount = body.totalCount
		let arr        = body.items.item;
		let html = '';
			html += '<h5>총 자료 수 : ' + totalCount  + '개</h5>';
		arr.forEach(function(item, index) {
			html += '<div class="box">';
			html += '<div><img id="plantimg" src="' + item.imgUrl + '"/></div>';
			html += '<div class="inbox"><ul>';
			html += '<li>과명 : ' + item.familyKorNm ;
			html += '(' + item.familyNm + ')' + '</li>';
			html += '<li>속명 : ' + item.genusKorNm ;
			html += '(' + item.genusNm + ')' + '</li>';
			html += '<li>국명 : ' + item.plantGnrlNm + '</li>';
			html += '<li>최종수정일시 : ' + item.lastUpdtDtm + '</li>';
			if (item.detailYn=='Y'){
				html += '<li>상세정보유무 : <button id="btn1Ok">상세정보조회</button></li>';}
			else {
				html += '<li>상세정보유무 : 상세정보 없음 </li>';}
			
			html += '<li>도감번호 : ' + item.plantPilbkNo + '</li>';
			html += '</ul></div>';
			html += '</div>';
		})
		return html;
	}

	$(function() {
		const btnOkEl  = document.querySelector('#btnOk');
		const div1El  = document.querySelector('#div1');
		
		$(btnOkEl).on({
			click : function(e) {
				//alert('클릭확인');
				$.ajax({
					url : 'http://localhost:9090/Wiki/Service',
					data : {
						keyword : $('#search').val()
					},
					success : function(data) {
						console.log(data);
						let html = data_display(data);
						//alert(data);
						$('#div1').html(html);
					},
					error : function(xhr) {
						console.log(xhr);
						alert(xhr.status + ' : ' + xhr.textStatus);
					}
					
				});
			}			
		});
	});
</script>
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
     	<p style="font-size: 40px; font-weight: bold;">그린 위키</p>
     </div>
	
	<div class="search" style="height: 800px; padding: 20px 20px;" >
	<h2>그린 위키 검색</h2>
	  <input type="text" id="search" />
	  <button id="btnOk" >검색</button>
	  <div id="div1"></div> 
	</div>
	
	
	
	<!-- footer -->
<%--     <%@include file="/WEB-INF/include/footer.jsp" %> --%>
    
    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
</body>
</html>