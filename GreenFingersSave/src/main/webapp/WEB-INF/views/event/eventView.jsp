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

	#title {
		width: 100%;
		text-align: center;
		height: 100px;
		background-color: orange;
	}
	#title p {
		 line-height: 100px;
	}
	#section {
		height: auto;
	}
	#aside {
		float: left;
		height: auto;
		background-color: white;
		width: 20%;
		padding: 10px;
	}
	#main {
		width: 80%;
		height: auto;
		float: left;
		padding: 50px 200px 50px 50px;
	}
	#cont {
		background-color: #fff;
		margin: 0 auto;
		width: 100%;
		border-collapse: collapse;
		margin-top: 10px;
		border-top: 3px solid #228B22;
	}
	#cont th {
		background-color: #666;
		margin-top: 20px;
	}
	#cont tr:nth-of-type(2) {
		border-bottom: 1px solid #228B22;
	}
	#reply_coment_cont {
		widows: 875px;
		height: 60px;
		resize: none;
	}
	#board_title {
		font-size: 32px;
		font-weight: bold;
	}
	#commentNoti {
		border-bottom: 3px solid #228B22;
		padding: 20px;
	}
	#readComment {
		margin-bottom: 50px;
	}
	#writeComment {
		border-bottom: 1px solid #228B22;
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
		padding: 30px;
	}
	.coment_cont {
		margin: 0 20px;
		width: 95%;
		padding: 3px;
		height: 70px;
		resize: none;
	}
	.contSpace {
		width: 70%;
		padding: 10px;
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
	

</style>
	

<script src="https://code.jquery.com/jquery.min.js"></script>



<script>

		function comment_update(coment_idx, coment_cont) {

			let cont = $("#comment_update_" + coment_idx).val();
			
			fetch("/Comment/CommentUpdate?coment_idx=" + coment_idx + "&coment_cont="+ cont +"&usercode=" + ${login.usercode})
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
				
			console.log($('#comment_updateForm_'+ coment_idx));
			$('#comment_updateForm_'+ coment_idx).replaceWith(html);
		}

		function updateForm_comment(coment_idx, coment_cont) {
			let html  = '';
				html += `<div id="comment_updateForm_\${coment_idx}">`;
			    html += `<textarea name="coment_cont" id="comment_update_\${coment_idx}">\${coment_cont}</textarea>`;
			    html += `<input type="button" value="수정" onclick="comment_update(\${coment_idx})"/>`;
			    html += `<input type="button" value="취소" onclick="comment_back(\${coment_idx}, '\${coment_cont}')"/>`;
			    html += '</div>';
			
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
					html += `<b style="display:inline-block; width:\${com_lvl * 40}px"></b><input type="button" value="대댓작성" id="replyBtn" onclick="reply_comment( \${coment_idx}, \${board_idx}, \${com_bnum}, \${com_lvl}, \${com_step}, \${com_nref}, \${com_parent})">`
					html += '</div></li>';
				
					commentEl.append(html);
			}
		}
		
		function comment_display(data) {
			let html = '';
			for (let comm of data) {
				html += '<li id="comment_li_' + comm.coment_idx +'">';
				if(comm.com_lvl == 0) {
					if(comm.delcoment == 0) {
						html += '<div class="floatleft nameSpace"><p><h2>'+ comm.nickname +'</h2></p></div>';
						html += '<div class="floatright dateSpace"><p><h2>'+ comm.coment_regdate +'</h2></p></div><br />';
						html += `<div class="floatleft contSpace" id="commentCont_\${comm.coment_idx}" onclick="c(\${comm.coment_idx}, \${comm.board_idx}, \${comm.com_bnum}, \${comm.com_lvl}, \${comm.com_step}, \${comm.com_nref}, \${comm.com_parent})">\${comm.coment_cont}</div><br />`;
						if(comm.usercode == ${login.usercode}) {
							html += '<div class="floatright btns"><input type="button" onclick="updateForm_comment('+ comm.coment_idx + ',\'' + comm.coment_cont + '\')" value="수정" />';
							html += '<input type="button" onclick="delete_comment(' + comm.coment_idx + ')" value="삭제" /></div><br />';
						}						
					} else {
						html += '<b>삭제된 댓글입니다.</b>';
					}					
				} else {
					if(comm.delcoment == 0) {
						html += `<b style="display:inline-block; width:\${comm.com_lvl*20}px"></b>`;
						html += `<div class="floatleft nameSpace"><p><h2><b style="display:inline-block; width:\${comm.com_lvl*20}px"></b>\${comm.nickname}</h2></p></div>`;
						html += '<div class="floatright dateSpace"><p><h2>'+ comm.coment_regdate +'</h2></p></div><br />';
						html += `<div class="floatleft contSpace" id="commentCont_\${ comm.coment_idx }" onclick="c( \${comm.coment_idx}, \${comm.board_idx}, \${comm.com_bnum}, \${comm.com_lvl}, \${comm.com_step}, \${comm.com_nref}, \${comm.com_parent})"><b style="display:inline-block; width:\${comm.com_lvl*20}px"></b>\${comm.coment_cont}</div><br />`;
						if(comm.usercode == ${login.usercode}) {
							html += '<div class="floatright btns"><input type="button" onclick="updateForm_comment('+ comm.coment_idx + ',\'' + comm.coment_cont + '\')" value="수정" />';
							html += '<input type="button" onclick="delete_comment(' + comm.coment_idx + ')" value="삭제" /></div><br />';
						}	
					} else {
						html += `<div class="floatleft"><p><h2><b style="display:inline-block; width:\${comm.com_lvl*20}px"></b>\${comm.nickname}</h2></p></div>`;
						html += '<div class="floatright"><p><h2>'+ comm.coment_regdate +'</h2></p></div><br />';
						html += `<s><b style="display:inline-block; width:\${comm.com_lvl*20}px"></b>삭제된 댓글입니다.</s><br />`;
					}
				}
				html += '<br /></li>';
			}
			const commentListEl = document.getElementById("commentList");
			commentListEl.innerHTML = html;
			console.log(commentListEl);
			
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
	 <c:choose>
		<c:when test="${ sessionScope.login eq null }">
			<%@include file="/WEB-INF/include/header.jsp" %>
		</c:when>
		<c:otherwise>
			<%@include file="/WEB-INF/include/header2.jsp" %>
		</c:otherwise>
	</c:choose>
	<div id="section">
     <div id="title">
     	<p  style="font-size: 40px; font-weight: bold;" >이벤트</p>
     </div>
     <div id="aside">
		<c:forEach var="subname" items="">
	    </c:forEach>
     </div>

     <div id="main">
     <div><a id="board_title" href="/Event/EventList?submenu_id=${ map.submenu_id }&nowpage=1">${ map.submenu_name } 게시판</a></div>
		<table id="cont">
			<tr>
				<th class="padd8">제목</th>
				<td class="padd8">${vo.board_title }</td>
			</tr>
			<tr>
				<th class="padd8">작성자</th>
				<td class="padd8">${vo.nickname }</td>
				<th class="padd8">작성일</th>
				<td class="padd8">${vo.board_regdate }</td>
				<th class="padd8">조회수</th>
				<td class="padd8">${vo.readcount }</td>
			</tr>
				<tr><td colspan="6"><hr /></td></tr>
			<tr>
				<td colspan="6" style="height: 600px; padding: 8px;">${vo.board_cont }</td>
			</tr>
			<tr>
				<th>파일 첨부</th>
				<td> 
				<c:forEach var="file"  items="${ fileList }" >
				<div>
					<a href="/Event/download/external/${ file.sfilename }">
					${ file.filename }
					</a>
				</div>
				</c:forEach> 
   	    	 </td>
			</tr>
		</table>
		<div class="right">
		<!-- 이벤트는 답글은 필요없지않나
			<a href="/Event/WriteForm?submenu_id=${vo.submenu_id}&board_idx=${vo.board_idx}&bnum=${vo.bnum}&lvl=${vo.lvl}&step=${vo.step}&nref=${vo.nref}&nowpage=${map.nowpage}&userid=${login.userid}">답글쓰기</a>
			 -->
			<c:if test="${vo.usercode eq login.usercode}">
				<a href="/Event/UpdateForm?submenu_id=${vo.submenu_id}&board_idx=${vo.board_idx}&nowpage=${map.nowpage}">수정</a>
				<a href="/Event/Delete?submenu_id=${vo.submenu_id}&board_idx=${ vo.board_idx }&nowpage=${map.nowpage}">삭제</a> <br />
			</c:if>
		</div>
		<div id="commentNoti">댓글</div>
		<br />
		
		<div id="writeComment">
			<form id="writeC">
			<input type="hidden"  name="board_idx" value="${ vo.board_idx }" />
			<input type="hidden"  name="usercode" value="${ login.usercode }" />
			<table>
				<tr>
					<th><div class="nameSpace">${ login.nickname }</div></th>
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
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>