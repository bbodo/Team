 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<title>${ map.submenu_name } 게시글 보기</title>

<style type="text/css">

	* {
		box-sizing: border-box;
	}
	#section {
		height: auto;
	}
	#aside {
		float: left;
		height: auto;
		background-color: white;
		width: 15%;
		padding: 10px;
	}
	#main {
		width: 85%;
		height: auto;
		padding: 10px;
		padding-right : 15%;
		background-color: white;
		display: inline-block;
	}#img1{
	    width: 80%;
	    height: 150px;
	    object-fit : contain;
	}	
	.cont {
		background-color: #fff;
		margin: 0 auto;
		width: 90%;
		border-collapse: collapse;
		margin-top: 10px;
	}
	.cont tr:nth-of-type(2) {
		border-bottom: 1px solid #228B22;
	}
	#reply_coment_cont {
		width: 100%;
		height: 60px;
		resize: none;
		padding: 3px;
	}
	#replyComment {
		text-align: left;
	}
	#board_title {
		font-size: 32px;
		font-weight: bold;
	}
	#commentNoti {
		padding: 20px;
		width: 90%;
		text-align: left;
		padding-bottom: 0px;
	}
	#readComment {
		margin-top: 30px;
	}
	#writeComment {
		border-bottom: 1px solid #228B22;
		display: inline-block;
		border-top: 3px solid #228B22;
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
	.nameSpace {
		padding: 10px;
		margin-right: 10px
	}
	.coment_cont {
		margin: 0 20px;
		width: 95%;
		padding: 3px;
		height: 70px;
		resize: none;
		margin-top: 5px;
	}
	.contSpace {
		width: 50%;
		padding: 10px;
		text-align: left;
	}
	.comment_empty {
		padding-left: 80px;
	}
	.right {
		text-align: right;
	}
	.left {
		text-align: left;
	}
	textarea {
		width: 650px;
	}
	.floatright {
		float:right;
	}
	.floatleft {
		float:left;
	}
	#wrapper {
		margin-top: 70px;
	}
	.regbtn {
		background-color:#44c767;
		color:#ffffff;
		font-size:15px;
		font-weight:bold;
		padding:25px 23px;
		text-decoration:none;
		border: none;
	}
	.regbtn:hover {
		background-color:#5cbf2a;
	}
	.regbtn:active {
		position:relative;
		top:1px;
	}
	.smbtn {
	    background-color: #44c767;
	    color: #ffffff;
	    font-size: 15px;
	    font-weight: bold;
	    text-decoration: none;
	    width: 73px;
	    border: none;
	    display: inline-block;
	}
	.smbtn:hover {
		background-color:#5cbf2a;
	}
	.smbtn:active {
		position:relative;
		top:1px;
	}
	.upForm {
		padding: 3px;
		resize: none;
		width: 100%;
	}


</style>

<script src="https://code.jquery.com/jquery.min.js"></script>

<script>

		function comment_update(coment_idx, coment_cont) {

			let cont = $("#comment_update_" + coment_idx).val();
			let usercode = $('#usercode').val();
			
				fetch("/Comment/CommentUpdate?coment_idx=" + coment_idx + "&coment_cont="+ cont +"&usercode=" + usercode)
				.then(res => res.json())
				.then(data => {
					comment_display(data);
				})
				.catch( err => {
					console.log(err);
					alert("오류발생 : " + err);
				});
		}

		function reply_comment(coment_idx, board_idx, com_bnum, com_lvl, com_step, com_nref, com_parent) {
			let coment_cont = $("#reply_coment_cont").val();
			
			fetch("/Comment/ReCommentWrite?coment_idx=" + coment_idx + "&board_idx=" + board_idx + "&coment_cont=" + coment_cont + "&usercode=" + ${login.usercode}
				  +"&com_bnum=" + com_bnum + "&com_lvl=" + com_lvl + "&com_step=" + com_step + "&com_nref=" + com_nref +
				  "&com_parent=" + com_parent)
				.then(res => res.json())
				.then(data => {
					comment_display(data);
				})
				.catch( err => {
					console.log(err);
					alert("오류발생 : " + err);
				});
		}
		
		function comment_back(coment_idx, coment_cont) {
			let html  = '';
				html += '<div>';
				html += '<div class="floatleft" id="commentCont_'+ coment_idx +'" onclick="c(' + coment_idx + ')">'+ coment_cont +'</div>';
				html += '</div>';
				
			$('#comment_li_'+ coment_idx +' .smbtn').css('display', 'inline-block');
			console.log($('#comment_updateForm_'+ coment_idx));
			$('#comment_updateForm_'+ coment_idx).replaceWith(html);
		}

		function updateForm_comment(coment_idx, coment_cont) {
			let html  = '';
				html += `<div id="comment_updateForm_\${coment_idx}">`;
			    html += `<textarea class="upForm" name="coment_cont" id="comment_update_\${coment_idx}">\${coment_cont}</textarea>`;
			    html += '<div style="float: right">'
			    html += `<input class="smbtn" type="button" value="수정" onclick="comment_update(\${coment_idx})"/>`;
			    html += `<input class="smbtn" type="button" value="취소" onclick="comment_back(\${coment_idx}, '\${coment_cont}')"/>`;
			    html += '</div>'
			    html += '</div>';
			
			$('#comment_li_'+ coment_idx +' .smbtn').css('display', 'none');
			$('#commentCont_'+ coment_idx).replaceWith(html);
			$('#comment_update_' + coment_idx).focus();
		}

		function delete_comment(comm) {
				if(window.confirm("정말 삭제하시겠습니까?")) {
					fetch("/Comment/Delete?coment_idx=" + comm)
						.then(res => res.text())
						.then(data => {
							if(data == "suc") {
								alert("삭제되었습니다");
								$("#comment_li_" + comm).remove()
								location.reload();
							} else {
								location.reload();
							}
						})
						.catch( err => {
							console.log(err);
							alert("오류발생 : " + err);
						});
				} else {
					console.log("취소")
				}
			
		}

		function c(coment_idx, board_idx, com_bnum, com_lvl, com_step, com_nref, com_parent) {
			if($("#comment_empty_" + coment_idx).length) {
				
				$("#comment_empty_" + coment_idx).remove()
			} else {
				const commentEl = $("#comment_li_" + coment_idx);
				let html  = '<li class="comment_empty" id=comment_empty_' + coment_idx + '>'
					html += '<div id="replyComment">'
				    html += `<b style="display:inline-block; width:\${com_lvl * 40}px"></b><textarea id="reply_coment_cont" name="comment_cont"></textarea><br />`;
					html += `<b style="display:inline-block; width:\${com_lvl * 40}px"></b><input class="smbtn" type="button" value="대댓작성" style="float: right;" onclick="reply_comment( \${coment_idx}, \${board_idx}, \${com_bnum}, \${com_lvl}, \${com_step}, \${com_nref}, \${com_parent})">`
					html += '</div><br /></li>';
				
					commentEl.append(html);
			}
		}
		
		function comment_display(data) {
			let html = '';
			let usercode = $('#usercode').val();
			console.log(usercode);
			for (let comm of data) {
				html += '<li id="comment_li_' + comm.coment_idx +'">';
				if(comm.com_lvl == 0) {
					if(comm.delcoment == 0) {
						html += '<div class="floatleft nameSpace"><p><h2>'+ comm.nickname +'</h2></p></div>';
						html += `<div class="floatleft contSpace" id="commentCont_\${comm.coment_idx}" onclick="c(\${comm.coment_idx}, \${comm.board_idx}, \${comm.com_bnum}, \${comm.com_lvl}, \${comm.com_step}, \${comm.com_nref}, \${comm.com_parent})">\${comm.coment_cont}</div><br />`;
						if(comm.usercode == usercode) {
							html += '<div class="floatright"><input class="smbtn" type="button" onclick="updateForm_comment('+ comm.coment_idx + ',\'' + comm.coment_cont + '\')" value="수정" />';
							html += '<input class="smbtn" type="button" onclick="delete_comment(' + comm.coment_idx + ')" value="삭제" /></div><br />';
						}						
						html += '<div class="floatright dateSpace"><p><h2>'+ comm.coment_regdate +'</h2></p></div><br />';
					} else {
						html += '<b>삭제된 댓글입니다.</b>';
					}					
				} else {
					if(comm.delcoment == 0) {
						html += `<b style="display:inline-block; width:\${comm.com_lvl*20}px"></b>`;
						html += `<div class="floatleft nameSpace"><p><h2><b style="display:inline-block; width:\${comm.com_lvl*20}px"></b>\${comm.nickname}</h2></p></div>`;
						html += `<div class="floatleft contSpace" id="commentCont_\${ comm.coment_idx }" onclick="c( \${comm.coment_idx}, \${comm.board_idx}, \${comm.com_bnum}, \${comm.com_lvl}, \${comm.com_step}, \${comm.com_nref}, \${comm.com_parent})"><b style="display:inline-block; width:\${comm.com_lvl*20}px"></b>\${comm.coment_cont}</div><br />`;
						if(comm.usercode == usercode) {
							html += '<div class="floatright btns"><input class="smbtn" type="button" onclick="updateForm_comment('+ comm.coment_idx + ',\'' + comm.coment_cont + '\')" value="수정" />';
							html += '<input class="smbtn" type="button" onclick="delete_comment(' + comm.coment_idx + ')" value="삭제" /></div><br />';
						}	
						html += '<div class="floatright dateSpace"><p><h2>'+ comm.coment_regdate +'</h2></p></div><br />';
					} else {
						html += `<div class="floatleft"><p><h2><b style="display:inline-block; width:\${comm.com_lvl*20}px"></b>\${comm.nickname}</h2></p></div>`;
						html += `<s class="floatleft"><b style="display:inline-block; width:\${comm.com_lvl*20}px"></b>삭제된 댓글입니다.</s><br />`;
						html += '<div class="floatright"><p><h2>'+ comm.coment_regdate +'</h2></p></div><br />';
					}
				}
				html += '<br /></li>';
			}
			const commentListEl = document.getElementById("commentList");
			commentListEl.innerHTML = html;
			
		}
	window.onload = function() {
		
		const writeBtnEl = document.getElementById("writeBtn");
		const coment_contEl = document.getElementById("coment_cont");
		const readCEl = document.getElementById("readC");
		const writeCEl = document.getElementById("writeC");
		
		let datar = new FormData(readCEl);
		
		let optionR = {
				method : "POST",
				body : datar
		};
		
		fetch("/Comment/Read", optionR)
			.then( res => res.json() )
			.then( data => {
				comment_display(data);
				    
				})
			.catch( err => {
				console.log(err);
				alert("오류발생 : " + err);
			});
		
		writeBtnEl.addEventListener("click", function(e) {
			let dataw = new FormData(writeCEl);
			
			let optionW = {
					method : "POST",
					body : dataw
			};
			
			fetch("/Comment/Write", optionW)
				.then( res => res.json() )
				.then( data => {
					comment_display(data);
					coment_contEl.value = '';
					coment_contEl.focus();
				})
				.catch( err => {
					console.log(err);
					alert("오류발생 : " + err);
				})
		})
		
	}

</script>






</head>
<body>
	<!-- header -->
	 	 <%@include file="/WEB-INF/include/adminHeader.jsp" %>
	<img src ="/img/common/subbanner.png" alt="subbanner" />
	<div id="wrapper">
    <div id="aside">
     	<ul id="sidemenu">
     	     <a href="/Manager/EventList?menu_id=${ map.menu_id }&submenu_id=${ map.submenu_id }&nowpage=1" >이벤트</a>  <br>  	     	  
     	     <a href="/Manager/WinnerList?menu_id=${ map.menu_id }&submenu_id=SUBMENU19&nowpage=1">당첨자</a>   		
     	</ul>
     </div>

     <div id="main">
     <div><a id="board_title" href="/Manager/EventList?submenu_id=${ map.submenu_id }&nowpage=1">${ map.submenu_name } 게시판</a></div>
		<table id="cont">
			<tr>
				<th class="padd8">제목</th>
				<td class="padd8">${vo.board_title }</td>
			</tr>
			<tr>
				<th class="padd8">작성자</th>
				<td class="padd8">관리자</td>
				<th class="padd8">작성일</th>
				<td class="padd8">${vo.board_regdate }</td>
				<th class="padd8">조회수</th>
				<td class="padd8">${vo.readcount }</td>
			</tr>
			<tr>				
				<td colspan="5" id="bc" style="height: 600px; padding: 8px;">
				<c:forEach var="file"  items="${ fileList }" >
				 <div>
					<img id="img1" src="/upload/${ file.sfilename }">
				 </div>
				</c:forEach>
				${ vo.board_cont }
				</td>
			</tr>
		</table>
		<div class="right">			
				<a class="btns" href="/Manager/EventUpdateForm?submenu_id=${vo.submenu_id}&board_idx=${vo.board_idx}&nowpage=${map.nowpage}">수정</a>
				<a class="btns" href="/Manager/EventDelete?submenu_id=${vo.submenu_id}&board_idx=${vo.board_idx}&nowpage=${map.nowpage}">삭제</a> <br />			
		</div>
			<div id="commentNoti">댓글</div>
		<br />
		
		<div id="writeComment">
			<form id="writeC">
			<input type="hidden"  name="board_idx" value="${ vo.board_idx }" />
			<input type="hidden"  name="usercode" value="0" />
			<table>
				<tr>
					<th><div class="nameSpace">admin</div></th>
					<td style="width: 1000px;">
						<textarea name="coment_cont" placeholder="내용을 작성하세요."
					     required class="coment_cont" id="coment_cont"></textarea>
					</td>
					<td style="width: 100px;">
						<input type="button" id="writeBtn" value="등록"/>
					</td>
				</tr>
			</table>
			</form>
		</div>
		<br />
		<div id="readComment">
			<form id="readC">
			<input type="hidden"  name="board_idx" value="${ vo.board_idx }" />
			<ul id="commentList"></ul>
			</form>
			</div>
			</div>		
			</div>	
</body>
</html>