<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<!-- <script src="https://code.jquery.com/jquery.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ed41893c3ac9a9dea296267ef4123b8d&libraries=services"></script>
<link rel="stylesheet" href="/css/event.css" />
<title>Insert title here</title>

<script>
	window.onload = function() {
		
	}//end
	
	  $( function() {
		  let num = 1;
		  $('#btnAddFile').on('click', function(e) {
			  let tag = '<input type="file"  name="upfile' + num + '" class="upfile"/><br>';
			  $('#tdfile').append( tag );		  
			  num++;
		  })
	  });
	
/* 	 function Submit() {
		let address = document.getElementById('address');
		let address = document.getElementById('address');
		let boardCont = document.getElementById('board_cont');
		
		let addressValue = address.value;
		let boardContValue = boardCont.value;
		
		var str = boardContValue;
		str += ' ';
		str += addressValue;
		console.log(str);
		
		boardContValue = str;
		
		form.action = "http://www.naver.com";
		form.mothod = "POST";
		form.submit();
		return str;
		
     } */
	

</script>

<style type="text/css">
.cont {width:100%;}

#wrapper ul {
	padding-legt:0;
}

tr td {
	border-right: 2px solid #e3e3e3;
	border-top: 2px solid #e3e3e3;
}

tr td:last-of-type {
	border-right: none;
}

tr:first-child td {
	border-top: none;
}

tr td span {
	font-weight: 600;
}

/* 	* {
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
		height: 800px;
		background-color: white;
		width: 15%;
		padding: 10px;
	}
	#main {
		width: 85%;
		height: 800px;
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
	.left {
		text-align: left;
	}
	input[type=text] {
		width: 100%;
		padding: 5px;
	}
	textarea {
		width: 100%;
		height: 400px;
		padding: 20px;
	} */

</style>

</head>
<body>
	<%@include file="/WEB-INF/include/adminHeader.jsp" %>
	<%@include file="/WEB-INF/include/adminsubBanner.jsp" %>
	<div id="wrapper"> 
	 <div id="aside">
       <ul id="sidemenu">
       <li class="sidemenuTitle">SIDEMENU</li>
			<li><a href="/Manager/Member?menu_id=Member">회원 관리</a><br /></li>
       		<li><a href="/Manager/Menu?menu_id=Menu">메뉴 관리</a> <br /></li>
     		<li><a href="/Manager/subMenu?menu_id=subMenu"> - 하위 메뉴</a><br /></li>
     		<li><a href="/Manager/EventList?menu_id=Event&nowpage=1">이벤트 관리</a><br /></li>
     		<li><a href="/Manager/WinnerList?menu_id=Winner&nowpage=1">당첨자 관리</a><br /></li>
     		<li><a href="/Manager/SeminarList?menu_id=Festival&submenu_id=SUBMENU21&nowpage=1">행사 관리</a></li>
     		<li><a href="/Manager/Store">상품 등록</a><br /></li>
       </ul>
     </div> 

		<div id="main">
			<form action="/Manager/SeminarWriteSave?submenu_id=SUBMENU21&nowpage=1" method="POST" enctype="multipart/form-data" >
				<table class="cont" style="border-top: 3px solid #228B22;">
					<tr>
						<td class="padd8">작성자</td>
						<td class="padd8"><input name="manager_name" type="text" value="관리자" disabled/></td>
						<td class="padd8">등록일</td>
						<td class="padd8"><input name="board_regdate" type="text" value="${vo.board_regdate }" disabled/></td>
						<td class="padd8">조회수</td>
						<td class="padd8">${vo.readcount }</td>
					</tr>
					<tr>
						<td class="padd8">제목</td>
						<td colspan="5" class="padd8">${vo.board_title }</td>
					</tr>
					<!-- <tr>
						<td colspan="6" class="padd8"><div id="map" style="width:100%;height:250px;">내용</div></td>
					</tr> -->
					<tr>
						<td colspan="6" id="bc" style="padding: 50px;">
							<c:forEach var="file" items="${ fileList }">
								<div>
									<img src="/upload/${ file.sfilename }">
								</div>
							</c:forEach>
							<div style="min-height: 80px; height: auto; text-align: left;">
								${ map.board_cont }</div>
						</td>
					</tr>
					
					<tr>
						<td colspan="6" class="padd8"><p>찾아오시는 길: &emsp; <span id="address" >${map.address }</span></p></td>
					</tr>
					<tr>
						<td colspan="6" class="padd8"><div id="map" style="width:100%;height:250px;"></div></td>
					</tr>
					
					<tr>
						<td class="padd8">파일 첨부</td>
						<td td colspan="5"><c:forEach var="file" items="${ fileList }">
								<div>
									<a href="/Event/download/external/${ file.sfilename }">
									${ file.filename }
									</a> 
								</div>
							</c:forEach>
						</td>
					</tr>
				</table>
			</form>
			
			<c:if test="${map.managercode != null && map.manager_pw != null}" var="delnote">
				<div>
					<a href="/Manager/SeminarUpdateForm?submenu_id=SUBMENU21&nowpage=1&board_idx=${ vo.board_idx }&manager_code=${ map.managercode }" ><button>수정</button></a>
					<a href="/Manager/SeminarDelete?menu_id=MENU04&submenu_id=SUBMENU21&board_idx=${map.board_idx }&nowpage=1" ><button>삭제</button></a>
				</div>
			</c:if>
			
			<button id="cencelBtn" style="float: left;">취소 버튼</button>
		</div>
	</div>
	
	
	 <!--   <form enctype="multipart/form-data" method="post" >
      <div id="smarteditor">
        <textarea name="editorTxt" id="editorTxt" 
                  rows="20" cols="10" 
                  placeholder="내용을 입력해주세요"
                  style="width: 500px"></textarea>
      </div>
      <input type="button" value="전송"  onclick="submitPost()"/>
    </form> -->
    
<script>
	//카카오맵---------------------------------------------------------------------
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	
	var mapContainer = document.getElementById('map'), 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), 
	        level: 3 
	    };  
	
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	var ps = new kakao.maps.services.Places(); 
	
	function placesSearchCB (data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {
	        var bounds = new kakao.maps.LatLngBounds();
	
	        for (var i=0; i<data.length; i++) {
	            displayMarker(data[i]);    
	            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
	        }       
	
	        map.setBounds(bounds);
	    } 
	}
	
	function displayMarker(place) {
	    
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: new kakao.maps.LatLng(place.y, place.x) 
	    });
	
	    kakao.maps.event.addListener(marker, 'click', function() {
	        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
	        infowindow.open(map, marker);
	    });
	}
	
	let address = document.getElementById("address").textContent;
	console.log(address);
	ps.keywordSearch(address, placesSearchCB); 
	
	//-----------------------------------------
</script>
</body>
</html>