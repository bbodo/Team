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

<script>
	function data_display(data) {
		console.log(data);
		let body = data.response.body;
		let totalCount = body.totalCount
		let arr        = body.items.item;
		let html = '';
		arr.forEach(function(item, index) {
			html += '</div>';
			html += '<ul>ㅎㅎㅎㅎㅎ';
			html += '<li>과국명 : ' + item.familyKorNm + '</li>';
			html += '<li>과명 : ' + item.familyNm + '</li>';
			html += '<li>속국명 : ' + item.genusKorNm + '</li>';
			html += '<li>속명 : ' + item.genusNm + '</li>';
			html += '<li><img src="' + item.imgUrl + '"/></li>';
			html += '<li>국명 : ' + item.plantGnrlNm + '</li>';
			html += '<li>도감번호 : ' + item.plantPilbkNo + '</li>';
			html += '</ul>';
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
	
	<div class="search" style="height: 500px; padding: 20px 20px;" >
	<h2>그린 위키</h2>
	  <input type="text" id="search" />
	  <button id="btnOk" >검색</button>
	  <div id="div1"></div> 
	</div>
	
	
	
	<!-- footer -->
    <%@include file="/WEB-INF/include/footer.jsp" %>
    
    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
</body>
</html>