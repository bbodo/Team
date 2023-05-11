<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/comHead.jsp" %>
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
	#aside {
		float: left;
		height: 800px;
		background-color: navy;
		width: 20%;
		padding: 10px;
	}
	#main {
		width: 80%;
		height: 800px;
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
	}

</style>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	  $('#cnfBtn').on("click", function(e) {
	    let pw = $('#passwd').val()
	    let code = $('#usercode').val()
	    $.ajax({
	      url : "/mypage/checkPw",
	      data : {
	        usercode : code,
	        passwd : pw
	      },
	      success : function(data) {
	    	  console.log(data)
			if(data == 1) {
				location.replace("/mypage/myUpdate")
			} else {
				alert("틀린 비밀번호 입니다 !")
				$('#passwd').val('');
			}
	      	
	      },
	      error : function(err) {
	        console.log(err);
	      }
	    })
	  })
	});


</script>

</head>
<body>
	 <%@include file="/WEB-INF/include/header.jsp" %>
     <div id="title">
     	<p>마이 페이지</p>
     </div>
     <div id="aside">
     	내정보<br />
     	작성글<br />
     	쪽지<br />
     </div>
     <div id="main">
		<div style="float: left;">내 정보 수정하기</div> <br />
		<hr />
		<div>
			<p>비밀번호 확인</p><br />
			<input type="text" name="passwd" id="passwd"> <br />
			<input type="hidden" value="${login.usercode}" id="usercode" />
			<input type="button" value="확인" id="cnfBtn"/>			
		</div>     
     </div>
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>