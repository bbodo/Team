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
	#title { width: 100%;
		     text-align: center;
		     height: 100px;
	 	     background-color: orange;
	}
	
	#title p { line-height: 100px; }
	
	#div1 { margin: 20px; width: 800px;}
	
    .box { display: flex; margin: 20px;}
    #btn1Ok { width: 100px;}     
	#plantimg {
		  width: 400px;
		  height: 300px;
		  object-fit: cover;
	}
</style>
<script>
	
	function data_display(data) {
		const btnOkEl = document.querySelector('#btnOk');
		const pagingEl = document.getElementById('paging');
		let   phtml    = '';
		
		let body           = data.response.body;
		let pageNo         = body.pageNo;
		let nowpage        = pageNo; //body.pageNo;
		let totalCount     = body.totalCount;
		let pagecount      = 10;
		let pagetotalcount = 10;
		let totalpagecount = Math.ceil(totalCount/pagecount);
		let startnum       = (parseInt((nowpage-1)/pagetotalcount)) * pagetotalcount + 1 ;
		let endnum         = (parseInt((nowpage-1)/pagetotalcount) +1) * pagetotalcount;
		if(totalpagecount < endnum) { endnum = totalpagecount }
		if(startnum > 1) {
			phtml += '<a href="/Wiki/List?submenu_id=SUBMENU20&nowpage=1">[처음]</a>';
			phtml += '<a href="/Wiki/List?submenu_id=SUBMENU20&nowpage=' + (startnum-1) + '">[이전]</a>';
		} 
		for(let i=startnum; i<= endnum  ; i++) {
			phtml += '<a href="/Wiki/List?submenu_id=SUBMENU20&nowpage=' + i + '">' + i + '</a>&nbsp;&nbsp;';
		}
		if(totalpagecount != endnum) {
			phtml += '<a href="/Wiki/List?submenu_id=SUBMENU20&nowpage=' + (endnum+1) + '">[다음]</a>';
			phtml += '<a href="/Wiki/List?submenu_id=SUBMENU20&nowpage=' + totalpagecount + '">[마지막]</a>';
		}
		
		pagingEl.innerHTML = phtml;
		
		let arr  = body.items.item;
		let html = '';
			html += '<h5>총 자료 수 : ' + totalCount  + '개</h5>';
			html += '<h7>페이지 : ' + pageNo  + '페이지</h7>';
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
			if (item.detailYn =='Y'){
				html += '<li>상세정보유무 : <button id="btn1Ok">상세정보조회</button></li>';}
			else {
				html += '<li>상세정보유무 : 상세정보 없음 </li>';}
			
			html += '<li>도감번호 : ' + item.plantPilbkNo + '</li>';
			html += '</ul></div>';
			html += '</div>';
		});
		return html;
	}
	
	function ajax() {
		$.ajax({
			url : 'http://localhost:9090/Wiki/Service',
			data : {
				pageNo  : '${map.nowpage}',
				keyword : $('#search').val()
			},
			success : function(data) {
				console.log(data);
				if(data != null) {
				let html = data_display(data);
				$('#div1').html(html);
					
				} else {
					alert('검색어를 다시 입력하세요');
				}
			},
			error : function(xhr) {
				console.log(xhr);
				alert(xhr.status + ' : ' + xhr.textStatus);
			}
		});
	}
	
	$(function() {
		const btnOkEl = document.querySelector('#btnOk');
		const div1El  = document.querySelector('#div1');
		
		ajax();
		$(btnOkEl).on({
			click : function(e) {
				$.ajax({
					url : 'http://localhost:9090/Wiki/Service',
					data : {
						pageNo  : '1',
						keyword : $('#search').val()
					},
					success : function(data) {
						console.log(data);
						if(data != null) {
						let html = data_display(data);
						$('#div1').html(html);
							
						} else {
							alert('검색어를 다시 입력하세요');
						}
					},
					error : function(xhr) {
						console.log(xhr);
						alert(xhr.status + ' : ' + xhr.textStatus);
					}
				});
			}
		})
		
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
	
	<div class="search" style="height: auto; width: 100%; min-height:800px; padding: 20px 20px;" >
	<h2>그린 위키 검색</h2>
      	
      
	  과명 : <input type="text" id="search" style="width:200px;" />
	  <button id="btnOk"  >검색</button>
	  <div id="paging"></div>
	  <div id="div1"></div> 
	</div>
	
	
	
	<!-- footer -->
    <%@include file="/WEB-INF/include/footer.jsp" %> 
    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
</body>
</html>