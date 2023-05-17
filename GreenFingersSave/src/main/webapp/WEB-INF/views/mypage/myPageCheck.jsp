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
	#main {
		width: 100%;
		height: 800px;
		padding: 10px;
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
	}
	.regbtn {
	background-color: #44c767;
    color: #ffffff;
    font-size: 15px;
    font-weight: bold;
    margin: 30px 0;
    width: 30%;
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
				location.replace("/mypage/myUpdate?menu_id=mypage")
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
	<%@include file="/WEB-INF/include/subBanner.jsp" %>
     <div id="main">
		<div style="margin: 250px 0;">
			<h2 style="font-size: 40px; margin-bottom: 100px;">비밀번호 확인</h2>
			<div class="findid_wrap">
				<div class="input_row">
					<input type="password" name="passwd" id="passwd" placeholder="비밀번호" style="border: none; font-size: 25px; width: 100%;"/>
				</div>
			</div>
			<input type="hidden" value="${login.usercode}" id="usercode" />
			<input class="regbtn" type="button" value="확인" id="cnfBtn"/>			
		</div>     
     </div>
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>