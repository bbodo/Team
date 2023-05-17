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
    
    #detailbtn { width: 100px;}     
    
	#plantimg {
		  width: 400px;
		  height: 300px;
		  object-fit: cover;
	}
	#plantimg1 {
		  width: 300px;
		  height: 200px;
		  object-fit: cover;
	}
	#paging { margin-left: 50px;
	          margin-top: 20px; }
	#paging > .h { padding: 0px 4px;}
	#paging2 {text-align: center; margin: 10px;}
	#paging2 > .h {padding: 0 5px;}
	
</style>
<style>
	
    #modal.modal-overlay {
        width: 100%;
        height: 100%;
        position:fixed;
        left: 0;
        top: 0;
        display: none;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        background: rgba(255, 255, 255, 0.25);
        box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
        backdrop-filter: blur(1.5px);
        -webkit-backdrop-filter: blur(1.5px);
        border-radius: 10px;
        border: 1px solid rgba(255, 255, 255, 0.18);
    }

    #modal .modal-window {
        background: LemonChiffon;
        box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
        backdrop-filter: blur( 13.5px );
        -webkit-backdrop-filter: blur( 13.5px );
        border-radius: 10px;
        border: 1px solid rgba( 255, 255, 255, 0.18 );
		overflow-y: auto;
        width: 700px;
        height: 600px;
        position: relative;
        top: 50px;
        left: 100px;
        padding: 10px;
    }

    #modal .title {
        padding-left: 10px;
        display: block;
        /* text-shadow: 1px 1px 2px gray; */
        color: Navy;
    }

    #modal .title h2 {
        display: block;
    }

    #modal .close-area {
        display: block;
        float: right;
        padding-right: 10px;
        cursor: pointer;
        /* text-shadow: 1px 1px 2px gray; */
        color: Navy;
    }
    
    #modal .content {
        margin-top: 20px;
        padding: 0px 10px;
        /* text-shadow: 1px 1px 2px gray; */
        color: Navy;
    }
</style>
<script>
	
	/* 페이징 및 가져온 데이터 화면에 뿌리기 */
	function data_display(data) {
		const btnOkEl  = document.querySelector('#btnOk');
		const pagingEl = document.getElementById('paging');
		const paging1El = document.getElementById('paging1');
		let   keyword  = $('#search').val();
		let   phtml    = '';
		let   phtml1    = '';
		
		let body           = data.response.body;
		let pageNo         = body.pageNo;
		let nowpage        = pageNo; 
		let totalCount     = body.totalCount;
		let pagecount      = 10;
		let pagetotalcount = 10;
		let totalpagecount = Math.ceil(totalCount/pagecount);
		let startnum       = (parseInt((nowpage-1)/pagetotalcount)) * pagetotalcount + 1 ;
		let endnum         = (parseInt((nowpage-1)/pagetotalcount) +1) * pagetotalcount;
		if(totalpagecount < endnum) { endnum = totalpagecount }
		if(startnum > 1) {
			phtml += '<a class="h" href="/Wiki/List?submenu_id=SUBMENU20&nowpage=1&keyword=' + keyword + '">[처음]</a>';
			phtml += '<a class="h" href="/Wiki/List?submenu_id=SUBMENU20&nowpage=' + (startnum-1) + '&keyword=' + keyword + '">[이전]</a>';
		} 
		for(let i=startnum; i<= endnum  ; i++) {
			phtml += '<a class="h" href="/Wiki/List?submenu_id=SUBMENU20&nowpage=' + i + '&keyword=' + keyword + '">' + i + '</a>&nbsp;&nbsp;';
		}
		if(totalpagecount != endnum) {
			phtml += '<a class="h" href="/Wiki/List?submenu_id=SUBMENU20&nowpage=' + (endnum+1) + '&keyword=' + keyword + '">[다음]</a>';
			phtml += '<a class="h" href="/Wiki/List?submenu_id=SUBMENU20&nowpage=' + totalpagecount + '&keyword=' + keyword + '">[마지막]</a>';
		}
		
		pagingEl.innerHTML = phtml;
		
		let arr  = body.items.item;
		let html = '';
			html += '<div class="h"><h5>총 자료 수 : ' + totalCount  + '개</h5>';
			html += '<h7>페이지 : ' + pageNo  + '페이지</h7></div>';
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
				html += '<li>상세정보유무 : <button id="detailbtn" value="' + item.plantPilbkNo + '">상세정보조회</button></li>';}
			else {
				html += '<li>상세정보유무 : 상세정보 없음 </li>';}
			
			html += '<li>도감번호 : ' + item.plantPilbkNo + '</li>';
			html += '</ul></div>';
			html += '</div>';
		});
		
		phtml1 += '<div style="text-align: center"><h7>페이지 : ' + pageNo  + '페이지</h7></div>';
		phtml1 += '<div id="paging2">' + phtml + '</div>';
		paging1El.innerHTML = phtml1;
		return html;
	}
	
	// 상세 조회 버튼 클릭시
	function detailbtn() {
		const detailbtnEls = document.querySelectorAll('#detailbtn');
		detailbtnEls.forEach(function(button, index) {
			button.addEventListener('click', function() {
				let plantPilbkNo = button.value;
				console.log('버튼' + plantPilbkNo);
				detailajax(plantPilbkNo);
				modalOn();
				
			});
		});
	}
	
	/* ajax로 상세 data 가져오기 */
	function detailajax(plantPilbkNo) {
		$.ajax({
			url : 'http://localhost:9090/Wiki/ServiceDetail',
			data : {
				q1 : plantPilbkNo,
			},
			success : function(detaildata) {
				console.log(detaildata);
				detaildata_display(detaildata);
			},
			error : function(xhr) {
				console.log(xhr);
				alert(xhr.status + ' : ' + xhr.textStatus);
			}
		});
	}
	
	// 상세 data 화면
	function detaildata_display(detaildata) {
		const modalwindowEl = document.querySelector('.modal-window');
		let body = detaildata.response.body;
		let item = body.item;
		//alert('ggg');
		let modalHtml = '';
		modalHtml += '<div class="title">';
		modalHtml += '<h4>' + item.plantGnrlNm + ' 의 상세 정보</h4>';
		modalHtml += '</div>';
		modalHtml += '<div class="close-area">X</div>';
		modalHtml += '<div class="content">';
		modalHtml += '<p><img id="plantimg1" src="' + item.imgUrl + '"/></p>';
		modalHtml += '<p>과    명 : ' + item.familyKorNm + '</p>';
		modalHtml += '<p>속    명 : ' + item.genusKorNm + '</p>';
		modalHtml += '<p>학    명 : ' + item.plantSpecsScnm + '</p>';
		modalHtml += '<p>원 산 지 : ' + item.orplcNm + '</p>';
		modalHtml += '<p>최종수정일시 : ' + item.lastUpdtDtm + '</p>';
		modalHtml += '<p>분포정보 : ' + item.dstrb + '</p>';
		modalHtml += '<p>번식방법 : ' + item.brdMthdDesc + '</p>';
		modalHtml += '<p>형    태 : ' + item.shpe + '</p>';
		modalHtml += '<p>특    징 : ' + item.spft + '</p>';
		modalHtml += '<p>꽃 설 명 : ' + item.flwrDesc + '</p>';
		modalHtml += '<p>열매설명 : ' + item.fritDesc + '</p>';
		modalHtml += '<p>재배특성 : ' + item.farmSpftDesc + '</p>';
		modalHtml += '<p>병충해정보 : ' + item.bugInfo + '</p>';
		modalHtml += '<p>잎설명 : ' + item.leafDesc + '</p>';
		modalHtml += '<p>해외분포 : ' + item.osDstrb + '</p>';
		modalHtml += '<p>뿌리설명 : ' + item.rootDesc + '</p>';
		modalHtml += '<p>줄기설명 : ' + item.stemDesc + '</p>';
		modalHtml += '<p>크기설명 : ' + item.sz + '</p>';
		modalHtml += '<p>사용법 : ' + item.useMthdDesc + '</p>';
		modalHtml += '<p>생육환경설명 : ' + item.grwEvrntDesc + '</p>';
		modalHtml += '<p>유사식물설명 : ' + item.smlrPlntDesc + '</p>';
		modalHtml += '<p>노    트 : ' + item.note + '</p>';
		modalHtml += '</div>';
   	 		 
   		modalwindowEl.innerHTML = modalHtml;
   		 
   		// 모달창 기능 
   		const modal = document.getElementById("modal");
   		
   		function isModalOn() { return modal.style.display === "flex" }
   		
   		function modalOff() { modal.style.display = "none" }
   		
   		const closeBtn = modal.querySelector(".close-area")
   		closeBtn.addEventListener("click",function(e) {
   			modalOff();
   		});
   		
   		modal.addEventListener("click", function(e) {
   		    const evTarget = e.target
   		    if(evTarget.classList.contains("modal-overlay")) {
   		        modalOff();
   		    }
   		});
   		
   		window.addEventListener("keyup", function(e) {
   		    if(isModalOn() && e.key === "Escape") {
   		        modalOff();
   		    }
   		});
   	
	}
	
	/* ajax 로 API 데이터 가져오기 */
	function ajax() {
		$.ajax({
			url : 'http://localhost:9090/Wiki/Service',
			data : {
				pageNo  : '${map.nowpage}',
				keyword : '${map.keyword}'
			},
			success : function(data) {
				console.log(data);
				if(data != null) {
				let html = data_display(data);
				$('#div1').html(html);
				detailbtn();
					
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
	
	/* 검색 버튼 기능 구현 */
	$(function() {
		const btnOkEl = document.querySelector('#btnOk');
		const div1El  = document.querySelector('#div1');
		ajax();
		if('\${map.keyword}' != null)
			$('#search').val('${map.keyword}');
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
						let body       = data.response.body;
						let totalCount = body.totalCount;
						console.log(totalCount);
						if(totalCount != 0) {
							let html = data_display(data);
							$('#div1').html(html);
							detailbtn();
						} else {
							alert('검색어를 다시 입력하세요');
							$('#search').val('');
							/* $('.h').each( function(index,e) {
								$(e).remove();
							});
							$('.box').each( function(index,e) {
								$(e).remove();
							}); */
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
	<%@include file="/WEB-INF/include/subBanner.jsp" %>
	
	<!--  <div id="title">
     	<p style="font-size: 40px; font-weight: bold;">그린 위키</p>
     </div> -->
	
	<div class="search" style="height: auto; width: 100%; min-height:800px; padding: 20px 20px;" >
	<h2>그린 위키 검색</h2>
      	
      
	  과명 : <input type="text" id="search" style="width:200px;" />
	  <button id="btnOk"  >검색</button>
	  <div id="paging"></div>
	  <div id="div1"></div> 
	  
	</div>
	
	<!-- 상세모달창 -->
	<div id="modal" class="modal-overlay">
		<div class="modal-window" ></div>
	</div>
	<script>
	function modalOn() {
		modal.style.display = "flex"
		   		}
	</script>
	<div id="paging1"></div>
	<!-- footer -->
    <%@include file="/WEB-INF/include/footer.jsp" %> 
    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
 
</body>
</html>