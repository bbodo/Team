<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<link rel="stylesheet" href="/css/mypage.css" />

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
	/* #main {
		float: left;
		padding: 10px;
		background-color: gray;
		text-align: center;
	}
	#cont {
		background-color: #fff;
		margin: 0 auto;
		width: 85%;
	}
	#cont th {
		background-color: #666;
	}
	.right {
		text-align: right;
	} */

</style>

</head>
<body>
<div id="wrap">
	 <%@include file="/WEB-INF/include/header.jsp" %>
	 
     <div id="title">
     	<p>마이 페이지</p>
     </div>
     
     <div id="main">
     	
     	<!-- <section1 시작> -->
     	<div class="titleWrap">
     		<p class="title">내 정보</p>
     		<p><a href="">내 정보 수정하기</a></p>
     	</div>
     	
     	<section id="sec1">
     		<div id="con1">
     			<div><img src="/img/common/profile.png" alt="myimg"/></div>
     			<div><p>아이디 님</p></div>
     			<div><p>등급 :</p> <p>씨앗</p></div>
     		</div>
     		
     		<div id="con2">
     			<div>
     				<img src="" alt="myimg"/>
     				<div></div>	
     				<div>
     					<p>씨앗</p>
     					<p>새싹</p>
     				</div>
     			</div>
     			
     			<div id="con3">
     				<p>씨앗 등업에 필요한 조건을 만족시켜주세요</p>
     				<div><p>내공</p> <p>294필요</p></div>
     				<div><p>게시글 수</p> <p>10</p></div>
     			</div>
     		</div>
     		
     		<div>
     			<div id="myGrade">
     				<div><P>씨앗</P></div>
     				<div><P>새싹</P></div>
     				<div><P>잎새</P></div>
     				<div><P>가지</P></div>
     				<div><P>열매</P></div>
     				<div><P>나무</P></div>
     			</div>
     			
     			<div>
     				<div>
     					<img src="" alt="myimg"/>
     				</div>
     				
     				<div>
     					<div><P>씨앗</P></div>
     					<div><P>씨앗평균</P></div>
     					
     					<div>
     						<div>
     							<div id="point1"></div>
     							<div id="point2"></div>
     						</div>
     						<div>
     							<div>거래포인트</div>
     							<div>게시글 포인트</div>
     							<div>100%</div>
     						</div>
     					</div>
     				</div>
     			</div>
     		</div>
     	</section>
     	
     	<!-- <section2 시작> -->
     	<div class="titleWrap">
     		<p class="title">쪽지</p>
     		<p><a href="">전체보기</a></p>
     	</div>
     	
     	<section id="sec2">
			<div>
				<p>받은 쪽지</p>
				<p>보낸 쪽지</p>
			</div>         
			
			<table id="cont">
				<caption>내가 작성 한 글</caption>
				<tr>
					<th>번호</th>
					<th>보낸 사람</th>
					<th>제목</th>
					<th>날짜</th>
					<th>읽음 상태</th>
				</tr>
				
				<tr>
					<a href="">
						<td>1</td>
						<td>독초애호가</td>
						<td>독초사겠습니다</td>
						<td>2022-02-17</td>
						<td>읽음</td>
					</a>
				</tr>
			</table>
			
			<div>
				<button>삭제</button>
				<button><a href="">쪽지보내기</a></button>
			</div>
     	</section>
		
	    <%@include file="/WEB-INF/include/paging.jsp" %>
     </div>
     
     <%@include file="/WEB-INF/include/footer.jsp" %>
</div>
</body>
</html>