<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<title>메뉴 관리</title>

<style type="text/css">
	* {
		box-sizing: border-box;
	} 
	#main {
		width: 85%;
		height: auto;
		min-height: 800px;
		float: left;
		padding: 10px;
		padding-right: 15%;
		background-color: white;
		text-align: center;
	}
	#tt {
		text-align: left;
	}
	#cont {
		background-color: #fff;
		margin: 0 auto;
		width: 90%;
		border-collapse: collapse;
		margin-bottom: 50px;
    	border-bottom: 3px solid #228B22;
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
 		opacity: 1;$
	}
	#wrapper {
		min-height: 100%;
	}

</style>

<script src="https://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">

	function submenuDelete(smId) {
		if (window.confirm("정말 삭제하시겠습니까?")) {
			$.ajax({
				url : "/Manager/submenuDelete",
				data : {submenu_id : smId},
				type : "POST",
				success : function(data) {
					alert("삭제되었습니다 !")
					location.reload();
				},
				error : function() {
					alert("에러!!")
				}
			})
		}
	}
	
</script>

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
     		<li><a href="/Manager/WinnerList?menu_id=Winner&nowpage=1">당첨자관리</a><br /></li>
     		<li><a href="/Manager/Store?menu_id=Store">상품 등록</a><br /></li>
       </ul>
     </div>
     <div id="main">
		<table id="cont">
			 <tr>
       <td>상위메뉴</td>
       <td>Menu_id</td>
       <td>Menu_Name</td>
       <td>Menu_seq</td>
       <td></td>
       <td></td>
     </tr>
     <tr>
       <td colspan="6" class="right">
          <a href="/Manager/subMenuWriteForm?menu_id=subMenu">하위 메뉴 등록</a>
       </td>       
     </tr>
     <c:forEach var="submenu" items="${ submenuList }">
     <tr>
       <td>${ submenu.menu_id }</td>
       <td>${ submenu.submenu_id }</td>
       <td>${ submenu.submenu_name }</td>
       <td>${ submenu.submenu_seq }</td>
        <td><a href="javascript:void(0);" onclick=submenuDelete('${submenu.submenu_id}') >삭제</a></td>
       <td><a href="/Manager/submenuUpdateForm?menu_id=subMenu&menu_id1=${ submenu.menu_id }&submenu_id=${ submenu.submenu_id }&submenu_name=${ submenu.submenu_name }&submenu_seq=${ submenu.submenu_seq }">수정</a></td>
     </tr>   
     </c:forEach>
		</table>
     </div>
     </div>
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>